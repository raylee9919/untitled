// Copyright Seong Woo Lee. All Rights Reserved.

#import "Compiler";
#import "Basic";
#import "File";

EXECUTABLE_NAME :: "untitled";

#run,stallable build();

build :: () {

    options := get_build_options();
    args := options.compile_time_command_line;

    if !make_directory_if_it_does_not_exist("build") {
        log_error("Failed to create directory: 'build'.\n");
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
                compiler_report(tprint("Command-line argument #%, '%' is invalid.", it_index + 1, arg));
        }
    }

    if build_debug {
        set_optimization(*options, .DEBUG);
        options.backend           = .X64;
        options.output_path       = "build/debug";
        options.intermediate_path = "build/debug/intermediate";
        print("Debug build\n");
    } else {
        set_optimization(*options, .OPTIMIZED);
        options.backend           = .LLVM;
        options.output_path       = "build/release";
        options.intermediate_path = "build/release/intermediate";
        print("Release build\n");
    }

    set_working_directory(#filepath);

    set_build_options(options, w);
    
    add_build_file("source/main.jai", w);

    set_build_options_dc(.{ do_output = false });
}
