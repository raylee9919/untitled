// Copyright Seong Woo Lee. All Rights Reserved.

#import "Compiler";
#import "Basic";
#import "File";

EXECUTABLE_NAME :: "untitled";
BUILD_PATH      :: "build";

#run,stallable build();

build :: () {

    set_working_directory(#filepath);

    options := get_build_options();
    args := options.compile_time_command_line;

    if !make_directory_if_it_does_not_exist(BUILD_PATH) {
        print("Failed to create directory: '%'.\n", BUILD_PATH);
        return;
    }

    options.output_executable_name = EXECUTABLE_NAME;

    w := compiler_create_workspace();

    build_debug := true;

    for arg: args {
        if arg == { 
            case "release";
                build_debug = false;

            case;
                print("Command-line argument #%, '%' is invalid.\n", it_index + 1, arg);
                return;
        }
    }

    if build_debug {
        print("Debug build\n");
        set_optimization(*options, .DEBUG);
        options.backend           = .X64;
        options.output_path       = tprint("%/debug", BUILD_PATH);
        options.intermediate_path = tprint("%/debug/intermediate", BUILD_PATH);
    } else {
        print("Release build\n");
        set_optimization(*options, .OPTIMIZED);
        options.backend           = .LLVM;
        options.output_path       = tprint("%/release", BUILD_PATH);
        options.intermediate_path = tprint("%/release/intermediate", BUILD_PATH);
    }

    set_build_options(options, w);

    if build_debug  add_build_string("DEBUG :: true;", w);
    else            add_build_string("DEBUG :: false;", w);
    
    add_build_file("source/main.jai", w);

    set_build_options_dc(.{ do_output = false });
}
