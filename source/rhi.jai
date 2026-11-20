// Copyright Seong Woo Lee. All Rights Reserved.

#if OS == .WINDOWS {

    #import     "Windows";
    #import     "Windows_Utf8";
    #import,dir "DXGI";
    #import     "d3d12"()(INCLUDE_DEBUG_BINDINGS = DEBUG);
    #import     "d3d_compiler";


    #program_export D3D12SDKVersion: u32 = 619;
    #program_export D3D12SDKPath:   *u8  = ".\\.";


    #scope_module

    RHI_Device :: struct {
        factory_6: *IDXGIFactory6;
        device_0:  *ID3D12Device;
        device_10: *ID3D12Device10;

        #if DEBUG {
            info_queue_0:    *ID3D12InfoQueue;
            info_queue_1:    *ID3D12InfoQueue1;
            callback_cookie:  DWORD;

            dxgi_debug_dll:   HMODULE;
            dxgi_debug:      *IDXGIDebug;
        }

        graphics_queue: Command_Queue;
        compute\_queue: Command_Queue;
        transfer_queue: Command_Queue;

        rtv\    _heap: Descriptor_Heap;
        dsv\    _heap: Descriptor_Heap;
        resource_heap: Descriptor_Heap;
        sampler\_heap: Descriptor_Heap;

        global_root_signature: *ID3D12RootSignature;
    }


    Command_Type :: enum {
        GRAPHICS;
        COMPUTE;
        TRANSFER;
    }

    Command_Queue :: struct {
        type:     D3D12_COMMAND_LIST_TYPE;
        queue_0: *ID3D12CommandQueue;
    }

    Command_Buffer :: struct {
        type:          D3D12_COMMAND_LIST_TYPE;
        list_0:       *ID3D12GraphicsCommandList;
        list_7:       *ID3D12GraphicsCommandList7;
        allocator:    *ID3D12CommandAllocator;
        is_recording:  bool;
    }


    Memory_Type :: enum {
        GPU_ONLY :: 0;
        UPLOAD   :: 1;
        READBACK :: 2;
    }




    init_device :: (device: *RHI_Device) -> bool {
        hr: HRESULT;

        #if DEBUG {
            debug_0: *ID3D12Debug;
            debug_3: *ID3D12Debug3;

            device.dxgi_debug_dll = LoadLibraryW(utf8_to_wide("dxgidebug.dll"));
            if device.dxgi_debug_dll {
                DXGI_Get_Debug_Interface :: #type (REFIID, **void) -> HRESULT;
                dxgi_get_debug_interface: DXGI_Get_Debug_Interface = xx GetProcAddress(device.dxgi_debug_dll, "DXGIGetDebugInterface");
                if dxgi_get_debug_interface {
                    dxgi_get_debug_interface(*uid(IDXGIDebug_UUID), xx *device.dxgi_debug);
                } else {
                    log_error("failed to get dxgi debug interface.");
                    return false;
                }
            } else {
                log_error("failed to load 'dxgidebug.dll'.");
                return false;
            }


            hr = D3D12GetDebugInterface(*uid(ID3D12Debug_UUID), xx *debug_0);
            if FAILED(hr) {
                log_error("Failed to get 'ID3D12Debug'.");
                return false;
            }

            hr = IUnknown_QueryInterface(debug_0, *uid(ID3D12Debug3_UUID), xx *debug_3);
            if FAILED(hr) {
                log_error("Failed to query 'ID3D12Debug3'.");
                return false;
            }

            ID3D12Debug1_EnableDebugLayer(xx debug_3);
            ID3D12Debug3_SetEnableGPUBasedValidation(xx debug_3, .TRUE);
            ID3D12Debug3_SetEnableSynchronizedCommandQueueValidation(xx debug_3, .TRUE);

            IUnknown_Release(debug_3); debug_3 = null;
            IUnknown_Release(debug_0); debug_0 = null;
        }


        // @Todo: DRED (Device Removal Extended Data)
        // (https://microsoft.github.io/DirectX-Specs/d3d/DeviceRemovedExtendedData.html)


        factory_6: *IDXGIFactory6;
        {
            #if DEBUG {
                flags: u32;
            } else {
                flags: u32 = .DXGI_CREATE_FACTORY_DEBUG;
            }
            hr = CreateDXGIFactory2(flags, *uid(IDXGIFactory6_UUID), xx *factory_6);

            if FAILED(hr) {
                log_error("'CreateDXGIFactory2' failed on 'IDXGIFactory6'. 'IDXGIFactory' is supported from Windows 10, version 1803.");
                return false;
            }
        }


        adapter_1: *IDXGIAdapter1;
        {
            adapter_index: u32;
            preference: DXGI_GPU_PREFERENCE = .DXGI_GPU_PREFERENCE_HIGH_PERFORMANCE;
            hr = IDXGIFactory6_EnumAdapterByGpuPreference(factory_6, adapter_index, preference, *uid(IDXGIAdapter1_UUID), xx *adapter_1);

            if hr != S_OK {
                log_error("IDXGIFactory6_EnumAdapterByGpuPreference() failed.");
                return false;
            }
        }


        device_0: *ID3D12Device;
        {
            minimum_feature_level: D3D_FEATURE_LEVEL = .D3D_FEATURE_LEVEL_12_0;
            hr = D3D12CreateDevice(adapter_1, minimum_feature_level, *uid(ID3D12Device_UUID), xx *device_0);

            if hr != S_OK {
                log_error("D3D12CreateDevice() failed.");
                return false;
            }
        }


        #if DEBUG {
            info_queue_0: *ID3D12InfoQueue;
            info_queue_1: *ID3D12InfoQueue1;

            hr = IUnknown_QueryInterface(device_0, *uid(ID3D12InfoQueue_UUID), xx *info_queue_0);
            if FAILED(hr) {
                log_error("Failed to query 'ID3D12InfoQueue'.");
                return false;
            }

            hr = IUnknown_QueryInterface(info_queue_0, *uid(ID3D12InfoQueue1_UUID), xx *info_queue_1);
            if FAILED(hr) {
                log_error("Failed to query 'ID3D12InfoQueue1'.");
                return false;
            }

            ID3D12InfoQueue1_RegisterMessageCallback(info_queue_1, d3d12_message_callback, .D3D12_MESSAGE_CALLBACK_IGNORE_FILTERS, null, *device.callback_cookie);
            ID3D12InfoQueue_SetMuteDebugOutput(info_queue_1, .TRUE);

            ID3D12InfoQueue_SetBreakOnSeverity(info_queue_0, .D3D12_MESSAGE_SEVERITY_CORRUPTION, .TRUE);
            ID3D12InfoQueue_SetBreakOnSeverity(info_queue_0, .D3D12_MESSAGE_SEVERITY_ERROR,      .TRUE);
            ID3D12InfoQueue_SetBreakOnSeverity(info_queue_0, .D3D12_MESSAGE_SEVERITY_WARNING,    .TRUE);

            device.info_queue_0 = info_queue_0;
            device.info_queue_1 = info_queue_1;
        }


        {
            /*
              Bindless rendering requires Shader Model 6.6 and Resource Binding Tier 3. 
              According to the d3d12 info db, all hardware since 2016, except two Qualcomm GPUs supports these features. 
              (https://d3d12infodb.boolka.dev/)
              (https://github.com/microsoft/DirectX-Specs/blob/master/d3d/HLSL_SM_6_6_DynamicResources.md)
            */
            sm: D3D12_FEATURE_DATA_SHADER_MODEL;
            sm.HighestShaderModel = .D3D_SHADER_MODEL_6_6;
            hr = ID3D12Device_CheckFeatureSupport(device_0, .D3D12_FEATURE_SHADER_MODEL, *sm, size_of(D3D12_FEATURE_DATA_SHADER_MODEL));
            if FAILED(hr) {
                log_error("ID3D12Device_CheckFeatureSupport() failed.");
                return false;
            }

            options: D3D12_FEATURE_DATA_D3D12_OPTIONS;
            hr = ID3D12Device_CheckFeatureSupport(device_0, .D3D12_FEATURE_D3D12_OPTIONS, *options, size_of(D3D12_FEATURE_DATA_D3D12_OPTIONS));
            if options.ResourceBindingTier < .D3D12_RESOURCE_BINDING_TIER_3 {
                log_error("Only device with resource binding tier 3 or greater is supported.");
                return false;
            }
        }


        {
            // Check for enhanced barrier feature.
            options_12: D3D12_FEATURE_DATA_D3D12_OPTIONS12;
            hr = ID3D12Device_CheckFeatureSupport(device_0, .D3D12_FEATURE_D3D12_OPTIONS12, *options_12, size_of(D3D12_FEATURE_DATA_D3D12_OPTIONS12));

            if FAILED(hr) {
                log_error("ID3D12Device_CheckFeatureSupport(.. D3D12_FEATURE_D3D12_OPTIONS12) failed.");
                return false;
            }

            if !options_12.EnhancedBarriersSupported {
                log_error("Enhanced barrier is not supported on this device.");
                return false;
            }
        }

        device_10: *ID3D12Device10;
        {
            hr = IUnknown_QueryInterface(device_0, *uid(ID3D12Device10_UUID), xx *device_10);
            if FAILED(hr) {
                log_error("QueryInterface() for ID3D12Device10 failed. Requires DirectX 12 Agility SDK 1.7 or later.");
            }
        }


        // Set fields.
        device.factory_6  = factory_6;
        device.device_0   = device_0;
        device.device_10  = device_10;


        // Initialize command queues.
        ok := true;
        ok &&= init_command_queue(device, *device.graphics_queue, d3d12_command_type_from_rhi(.GRAPHICS));
        ok &&= init_command_queue(device, *device.compute\_queue, d3d12_command_type_from_rhi(.COMPUTE));
        ok &&= init_command_queue(device, *device.transfer_queue, d3d12_command_type_from_rhi(.TRANSFER));
        if !ok {
            return false;
        }


        // @Todo
        // Initialize descriptor heaps.


        // Create bindless global root signature.
        root_params: [2] D3D12_ROOT_PARAMETER = .[
            .{ ParameterType = ._32BIT_CONSTANTS, Constants = .{ ShaderRegister = 0, RegisterSpace = 0, Num32BitValues = MAX_32BIT_PUSH_CONSTANTS } },  // b0
            .{ ParameterType = ._32BIT_CONSTANTS, Constants = .{ ShaderRegister = 1, RegisterSpace = 0, Num32BitValues = MAX_32BIT_PUSH_CONSTANTS } },  // b1
        ];

        root_signature_desc: D3D12_ROOT_SIGNATURE_DESC = .{
            NumParameters     = root_params.count,
            pParameters       = root_params.data,
            NumStaticSamplers = 0,
            pStaticSamplers   = null,
            Flags             = .ALLOW_INPUT_ASSEMBLER_INPUT_LAYOUT | .CBV_SRV_UAV_HEAP_DIRECTLY_INDEXED | .SAMPLER_HEAP_DIRECTLY_INDEXED
        };

        signature_blob: *ID3DBlob;
        error\   _blob: *ID3DBlob;

        hr = D3D12SerializeRootSignature(*root_signature_desc, .D3D_ROOT_SIGNATURE_VERSION_1, *signature_blob, *error_blob);
        if hr != S_OK {
            log_error("D3D12SerializeRootSignature() failed.");
            return false;
        }

        hr = ID3D12Device_CreateRootSignature(device_0, 0, ID3D10Blob_GetBufferPointer(signature_blob), ID3D10Blob_GetBufferSize(signature_blob), *uid(ID3D12RootSignature_UUID), xx *device.global_root_signature);
        if hr != S_OK {
            log_error("ID3D12Device_CreateRootSignature() failed.");
            return false;
        }

        safe_release(*signature_blob);
        safe_release(*error\   _blob);
        safe_release(*adapter_1);

        return true;
    }

    deinit_device :: (using device: *RHI_Device) {
        #if DEBUG {
            IUnknown_Release(info_queue_1);
            info_queue_1 = null;

            IUnknown_Release(info_queue_0);
            info_queue_0 = null;

            if dxgi_debug {
                IUnknown_Release(dxgi_debug);
                dxgi_debug = null;
            }

            FreeLibrary(dxgi_debug_dll);
            dxgi_debug_dll = null;
        }

        safe_release(*device_10);
        safe_release(*device_0);
        safe_release(*factory_6);
    }




    #scope_file


    MAX_32BIT_PUSH_CONSTANTS :: 32;

    Descriptor_Heap :: struct {
        type:    D3D12_DESCRIPTOR_HEAP_TYPE;
        heap_0: *ID3D12DescriptorHeap;

        base_cpu_handle: D3D12_CPU_DESCRIPTOR_HANDLE;
        base_gpu_handle: D3D12_GPU_DESCRIPTOR_HANDLE;

        descriptor_size: u32;
    }

    safe_release :: (pptr: $T) {
        // @Robustness: my gut tells me I could check if it is a pointer or double pointer in Jai.
        if (pptr && pptr.*) {
            IUnknown_Release(pptr.*);
            pptr.* = null;
        }
    }

    d3d12_log :: (severity: D3D12_MESSAGE_SEVERITY, description: *u8) #no_context {
        strlen :: (s: *u8) -> s64 #no_context {
            count: s64 = 0;

            while s.* {
                count += 1;
                s += 1;
            }

            return count;
        }

        s: string = ---;
        s.data  = description;
        s.count = strlen(description);

        // @Incomplete
    }

    d3d12_message_callback :: (category: D3D12_MESSAGE_CATEGORY, severity: D3D12_MESSAGE_SEVERITY, id: D3D12_MESSAGE_ID, description: *u8, user_data: *void) #c_call {
        if #complete severity == {
            case .CORRUPTION; #through;
            case .ERROR;      #through;
            case .WARNING;
                if description  d3d12_log(severity, description);
                debug_break();

            case .INFO;
            case .MESSAGE;
                if description  d3d12_log(severity, description);
        }
    }

    d3d12_command_type_from_rhi :: (type: Command_Type) -> D3D12_COMMAND_LIST_TYPE {
        if #complete type == {
            case .GRAPHICS;  return .DIRECT;
            case .COMPUTE;   return .COMPUTE;
            case .TRANSFER;  return .COPY;
        }
    }

    init_command_queue :: (device: *RHI_Device, queue: *Command_Queue, type: D3D12_COMMAND_LIST_TYPE) -> bool {
        desc: D3D12_COMMAND_QUEUE_DESC = .{
            Type     = type,
            Priority = xx D3D12_COMMAND_QUEUE_PRIORITY.NORMAL,
        };

        hr := ID3D12Device_CreateCommandQueue(device.device_0, *desc, *uid(ID3D12CommandQueue_UUID), xx *queue.queue_0);
        if FAILED(hr) {
            log_error("Failed to create command queue.");
            return false;
        }

        queue.type = type;

        return true;
    }

    deinit_command_queue :: (using queue: *Command_Queue) {
        IUnknown_Release(xx queue_0);
        queue_0 = null;
    }
}
