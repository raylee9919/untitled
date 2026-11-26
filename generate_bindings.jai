// Copyright Seong Woo Lee. All Rights Reserved.

LIB_PATH        :: "lib";
BASE_NAME       :: "d3d12ma";
PATH            :: "source/ThirdParty/D3D12MemoryAllocator";
FILENAME        :: "bindings.jai";

#run,stallable {
    if !generate_bindings() {
        compiler_set_workspace_status(.FAILED);
    }
    delete_directory(".build");
}

generate_bindings :: () -> bool {

    set_working_directory(#filepath);
    set_build_options_dc(.{do_output=false});
    args := get_build_options().compile_time_command_line;

    compile := array_find(args, "compile");
    debug   := array_find(args, "debug");

    if compile {
        print_color("Compiling in % mode..\n", ifx debug then "debug" else "release",color=.GREEN);
        if build_libraries(tprint("%/%", LIB_PATH, BASE_NAME), debug) {
            print_color("Successfully compiled libraries to '%'\n", LIB_PATH, color=.GREEN);
        } else {
            return false;
        }
    }

    options: Generate_Bindings_Options;
    {
        using options;

        array_add(*library_search_paths, LIB_PATH);

        array_add(*libraries, {filename=tprint("%.lib", BASE_NAME)});

        array_add(*source_files, tprint("%/cpp/MyAtomic.h",      PATH));
        array_add(*source_files, tprint("%/cpp/D3D12MemAlloc.h", PATH));

        array_add(*extra_clang_arguments, "-x", "c++", "-DD3D12MA_ATOMIC_UINT32=MyAtomicU32", "-DD3D12MA_ATOMIC_UINT64=MyAtomicU64");

        log_stripped_declarations = false;
        generate_compile_time_struct_checks = false;
        
        generate_library_declarations = false;
        footer = #string END
d3d12ma :: #library,no_dll "../../../lib/d3d12ma";
libcpmt :: #library,system,link_always "libcpmt";
uuid    :: #library,system,link_always "uuid";
END
    }

    return generate_bindings(options, tprint("%/%", PATH, FILENAME));
}

build_libraries :: (base_name: string, debug: bool) -> bool {
    source_files: [..] string;

    array_add(*source_files, tprint("%/cpp/BuildThis.cpp", PATH));

    success := true;
    success &&= build_cpp_static\_lib(base_name, ..source_files, debug=debug, extra=["/DD3D12MA_ATOMIC_UINT32=MyAtomicU32", "/DD3D12MA_ATOMIC_UINT64=MyAtomicU64"]);

    return success;
}

#import "Basic";
#import "Bindings_Generator";
#import "BuildCpp";
#import "Compiler";
#import "File";
#import "Print_Color";
