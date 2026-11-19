// Since compile-time debugging is still tricky, it can sometimes be useful to compile this script into a binary and run that instead of generating the bindings at compile-time.
AT_COMPILE_TIME :: true;

NAMES_TO_OMIT :: string.[
    "DXGI_DEBUG_ALL",
    "DXGI_DEBUG_DX",
    "DXGI_DEBUG_DXGI",
    "DXGI_DEBUG_APP",
];

PREFIXES_FOR_TYPES_TO_OMIT :: string.[
    "__REQUIRED_",
    // Omit all the COM garbage
    "IID_",
    "__MIDL_",
];

ENUM_FLAGS :: string.[
    "DXGI_USAGE",
    "DXGI_MAP",
    "DXGI_ENUM_MODES",
    "DXGI_PRESENT",
    "DXGI_MWA",
];

MACRO_ENUM_NAMES :: string.[
    "DXGI_CPU_ACCESS",
    "DXGI_USAGE",
    "DXGI_RESOURCE_PRIORITY",
    "DXGI_MAP",
    "DXGI_ENUM_MODES",
    "DXGI_PRESENT",
    "DXGI_MWA",
    // "DXGI_SHARED_RESOURCE", // There's a struct with the same name :-/
];

#if AT_COMPILE_TIME {
    #run,stallable {
        set_build_options_dc(.{do_output=false});
        if !generate_bindings() {
            compiler_set_workspace_status(.FAILED);
        }
    }
} else {
    #import "System";

    main :: () {
        set_working_directory(path_strip_filename(get_path_of_running_executable()));
        if !generate_bindings() {
            exit(1);
        }
    }
}

generate_bindings :: () -> bool {
    output_filename: string;
    opts: Generate_Bindings_Options;
    {
        using opts;

        #if OS == .WINDOWS {
            output_filename = "dxgi_bindings.jai";
        } else {
            assert(false);
        }
        array_add(*libraries, .{filename="dxgi.dll"});
        array_add(*libraries, .{filename="dxgidebug.dll"});

        array_add(*source_files, "dxgi.h");
        array_add(*source_files, "dxgidebug.h");
        array_add(*source_files, "dxgiformat.h");
        array_add(*source_files, "dxgitype.h");
        array_add(*source_files, "dxgi1_2.h");
        array_add(*source_files, "dxgi1_3.h");
        array_add(*source_files, "dxgi1_4.h");
		array_add(*source_files, "dxgi1_5.h");
        // Added in Windows 10, version 1703
        array_add(*source_files, "dxgi1_6.h");

        array_add(*path_fragments_to_treat_as_non_system_paths, "dxgi.h", "dxgiformat.h", "dxgitype.h", "dxgicommon.h", "fwptypes.h", "dxgi1_2.h", "dxgi1_3.h", "dxgi1_4.h", "dxgi1_5.h", "dxgi1_6.h", "dxgidebug.h");

        array_add(*extra_clang_arguments, "-x", "c++", "-DWIN32_LEAN_AND_MEAN");

        mimic_spacing_flags &= ~Mimic_Spacing_Flags.VTABLE;
        log_stripped_declarations = false;
        generate_compile_time_struct_checks = false;
        array_add(*generate_enums_from_macros_with_prefixes, .. MACRO_ENUM_NAMES);

        visitor = d3d_visitor;
    }

    return generate_bindings(opts, output_filename);
}

#scope_file

d3d_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    // Make unnecessary typedefs for enums and structs disappear by
    if (decl.kind == .STRUCT || decl.kind == .ENUM) && decl.output_name.count > 2 && decl.output_name[0] == "_" && decl.output_name[1] !=  "_" {
        advance(*decl.output_name);
    }

    if array_find(NAMES_TO_OMIT, decl.name){
        decl.decl_flags |= .OMIT_FROM_OUTPUT;
        return .STOP;
    }

    if !parent_decl {
        for PREFIXES_FOR_TYPES_TO_OMIT {
            if begins_with(decl.name, it) {
                decl.decl_flags |= .OMIT_FROM_OUTPUT;
                return .STOP;
            }
        }
    }

    if decl.kind == .ENUM {
        if ends_with(decl.name, "FLAG") || ends_with(decl.name, "FLAGS") || array_find(ENUM_FLAGS, decl.name) {
            en := cast(*Enum)decl;
            en.flags |= .IS_ENUM_FLAGS;
            en.flags |= .VALUES_IN_HEX;

            if en.type {
                // Clang on Windows claims that all enums are signed, but MS function declarations expects at least the flags to be unsigned
                if en.type.size == {
                    case 1;
                        en.type = context.generator.type_def_u8;
                    case 2;
                        en.type = context.generator.type_def_u16;
                    case 4;
                        en.type = context.generator.type_def_u32;
                    case 8;
                        en.type = context.generator.type_def_u64;
                }
            }
        }
    }

    if decl.kind == .TYPEDEF {
        // Replace typedefs with the enums we created for macro values
        if array_find(MACRO_ENUM_NAMES, decl.name) {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            for context.generator.global_scope.members {
                if it.kind == .ENUM && it.name == decl.name {
                    it.type = decl.type;
                    break;
                }
            }
        }
    }

    return .RECURSE;
}

#import "Basic";
#import "Bindings_Generator";
#import "Compiler";
#import "File";
#import "String";

