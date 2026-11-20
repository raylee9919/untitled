// Copyright Seong Woo Lee. All Rights Reserved.

EXECUTABLE_NAME :: "untitled";
BUILD_PATH      :: "build";
LIB_PATH        :: "lib";

#run,stallable build();

build :: () {

    set_working_directory(#filepath);

    options := get_build_options();
    args := options.compile_time_command_line;

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
        options.output_path       = path_join(BUILD_PATH, "debug");
        options.intermediate_path = path_join(options.output_path, "intermediate");
    } else {
        print("Release build\n");
        set_optimization(*options, .OPTIMIZED);
        options.backend           = .LLVM;
        options.output_path       = path_join(BUILD_PATH, "release");
        options.intermediate_path = path_join(options.output_path, "intermediate");
    }


    // Create necessary directories
    {
        using options;
        if !make_dir(BUILD_PATH)        return;
        if !make_dir(output_path)       return;
        if !make_dir(intermediate_path) return;
    }


    // Copy libraries
    libs := file_list(LIB_PATH);
    for src: libs {
        name := path_filename(src);
        dst := path_join(options.output_path, name);

        if !file_exists(dst) {
            if !copy_file(src, dst, true) {
                print("failed to copy '%' to '%'.\n", src, dst);
                return;
            }
        }
    }

    set_build_options(options, w);

    if build_debug  add_build_string("DEBUG :: true;", w);
    else            add_build_string("DEBUG :: false;", w);
    
    add_build_file("source/main.jai", w);

    set_build_options_dc(.{ do_output = false });
}

make_dir :: (dir: string) -> bool {
    if !make_directory_if_it_does_not_exist(dir) {
        print("Failed to create directory: '%'.\n", dir);
        return false;
    }
    return true;
}

#import "Compiler";
#import "Basic";
#import "String";
#import "File";
#import "File_Utilities";

