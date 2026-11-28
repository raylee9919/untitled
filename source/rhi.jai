// Copyright Seong Woo Lee. All Rights Reserved.

#if OS == .WINDOWS {

    #import "ThirdParty/DXGI";
    #import "ThirdParty/D3D12"()(INCLUDE_DEBUG_BINDINGS = DEBUG);
    #import "d3d_compiler";
    #load   "ThirdParty/D3D12MemoryAllocator/bindings.jai";


    // @Todo: Check if it works as expected.
    #program_export D3D12SDKVersion: u32 = 619;
    #program_export D3D12SDKPath:   *u8  = ".\\.";


    #scope_module

    Device :: struct {
        factory_6: *IDXGIFactory6;
        device_0:  *ID3D12Device;
        device_10: *ID3D12Device10;

        allocator: Allocator;

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

        d3d12ma: *D3D12MA.Allocator;
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

    Command_Encoder :: struct {
        type:          Command_Type;
        device:       *Device;
        allocator:    *ID3D12CommandAllocator;
        list_0:       *ID3D12GraphicsCommandList;
        list_7:       *ID3D12GraphicsCommandList7;
        is_encoding:   bool;
    }

    Memory_Type :: enum {
        GPU_ONLY :: 0;
        UPLOAD   :: 1;
        READBACK :: 2;
    }

    Descriptor_Heap :: struct {
        type: D3D12_DESCRIPTOR_HEAP_TYPE;

        allocator: Allocator;

        heap_0: *ID3D12DescriptorHeap;

        base_cpu_handle: D3D12_CPU_DESCRIPTOR_HANDLE;
        base_gpu_handle: D3D12_GPU_DESCRIPTOR_HANDLE; // valid if visible on GPU.

        descriptor_size: s64;

        free_list: *s64;
        node_count: int;
        allocated:  int; // number of every slots.
        count:      int; // number of active descriptors.
    }

    Descriptor :: struct {
        type:        D3D12_DESCRIPTOR_HEAP_TYPE;
        index:       u32;
        heap:       *Descriptor_Heap;
        cpu_handle:  D3D12_CPU_DESCRIPTOR_HANDLE;
        gpu_handle:  D3D12_GPU_DESCRIPTOR_HANDLE;
    }

    Semaphore :: struct {
        fence: *ID3D12Fence;
        event:  HANDLE;
    }

    Texture_Filter :: enum {
        LINEAR;
        NEAREST;
        ANISOTROPIC;
    }

    Address_Mode :: enum {
        REPEAT;
        MIRROR;
        EDGE;
        BORDER;
    }

    Compare_Op :: enum {
        ALWAYS;
        NEVER;
        EQUAL;
        NOT_EQUAL;
        LESS;
        LESS_EQUAL;
        GREATER;
        GREATER_EQUAL;
    }

    Sampler_Desc :: struct {
        filter:          Texture_Filter;
        address_u:       Address_Mode;
        address_v:       Address_Mode;
        address_w:       Address_Mode;
        max_anisotropy:  u32;
        compare_op:      Compare_Op;
        border_color:    [4] float;
        mip_lod_bias:    float;
        min_lod:         float;
        max_lod:         float;
    }

    Sampler :: struct {
        descriptor: Descriptor;
    }

    Swapchain :: struct {
        current_backbuffer:     u32;
        swapchain_4:           *IDXGISwapChain4;
        frame_waitable_object:  HANDLE;
        allow_tearing:          bool;
    }

    Allocation_Kind :: enum {
        BUFFER             :: 0;
        NON_RT_DS_TEXTURES :: 1;
        RT_DS_TEXTURES     :: 2;
    }

    Allocation_Priority :: enum {
        LOW    :: 0;
        NORMAL :: 1;
        HIGH   :: 2;
    }

    Memory_Allocator :: struct {
        memory_type:  Memory_Type;
        kind:         Allocation_Kind;
        priority:     Allocation_Priority;
        pool:        *D3D12MA.Pool;
    }

    Resource :: struct {
        allocation:  *D3D12MA.Allocation;
        resource:    *ID3D12Resource;
        state:        D3D12_RESOURCE_STATES;
    }

    Buffer :: struct {
        #as using base: Resource;

        memory_type:  Memory_Type;
        size:         u64;
    }

    Buffer_View :: struct {
        descriptor: Descriptor;
        offset:     s64;
        size:       s64;
        writable:   bool;
    }

    Texture :: struct {
        #as using base: Resource;

        using desc: Texture_Desc;
    }

    Texture_View :: struct {
        descriptor: Descriptor;
    }

    Dimension :: enum {
        _1D;
        _2D; 
        _2D_ARRAY;
        _3D;
        CUBE;
    }

    Format :: enum {
        UNKNOWN :: 0;

        R8_UNORM;
        RG8_UNORM;
        RGBA8_UNORM;
        BGRA8_UNORM;
        RGBA8_UNORM_SRGB;
        BGRA8_UNORM_SRGB;

        R16_UNORM;
        RG16_UNORM;
        RGBA16_UNORM;

        R16F;
        RG16F;
        RGBA16F;

        R32F;
        RG32F;
        RGBA32F;

        D32F;

        BC1_UNORM;
        BC1_UNORM_SRGB;
        BC3_UNORM;
        BC3_UNORM_SRGB;
        BC4_UNORM;
        BC5_UNORM;
        BC6H_UFLOAT;
        BC7_UNORM;
        BC7_UNORM_SRGB;
    }

    Usage_Flags :: enum_flags {
        SAMPLED                  :: 0x1;
        UNORDERED_ACCESS         :: 0x2;
        COLOR_ATTACHMENT         :: 0x4;
        DEPTH_STENCIL_ATTACHMENT :: 0x8;
    }

    Texture_Desc :: struct {
        dimension:   Dimension;
        format:      Format;
        usage_flags: Usage_Flags;
        name:        string;
        width:       u32;
        height:      u32;
        mip_levels:  u16;
        depth:       u16; // or array length
    }

    Clear_Op :: struct {
        clear_depth_stencil: bool;

        color: [4] float;

        #overlay (color[0]) depth:   float;
        #overlay (color[1]) stencil: u8;
    }



    init_device :: (device: *Device, allocator: Allocator) -> bool {
        hr: HRESULT;

        remember_allocators(device,, allocator);

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
                flags: u32 = DXGI_CREATE_FACTORY_DEBUG;
            }
            hr = CreateDXGIFactory2(flags, *uid(IDXGIFactory6_UUID), xx *factory_6);

            if FAILED(hr) {
                log_error("'CreateDXGIFactory2' failed on 'IDXGIFactory6'. 'IDXGIFactory' is supported from Windows 10, version 1803.");
                return false;
            }
        }


        adapter_1: *IDXGIAdapter1;
        defer safe_release(*adapter_1);
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
        ok &&= init_command_queue(device, *device.graphics_queue, to_d3d12_command_type(.GRAPHICS));
        ok &&= init_command_queue(device, *device.compute\_queue, to_d3d12_command_type(.COMPUTE));
        ok &&= init_command_queue(device, *device.transfer_queue, to_d3d12_command_type(.TRANSFER));
        if !ok  return false;


        // Initialize descriptor heaps.
        ok = init_descriptor_heap(device, *device.rtv_heap,      .RTV,          256);
        ok = init_descriptor_heap(device, *device.dsv_heap,      .DSV,           32);
        ok = init_descriptor_heap(device, *device.resource_heap, .CBV_SRV_UAV, 2048);
        ok = init_descriptor_heap(device, *device.sampler_heap,  .SAMPLER,       16);
        if !ok  return false;


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

        defer safe_release(*signature_blob);
        defer safe_release(*error_blob);


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


        // Initialize D3D12 Memory Allocator
        {
            desc: D3D12MA.ALLOCATOR_DESC;
            using desc;

            Flags    = .DEFAULT_POOLS_NOT_ZEROED | .MSAA_TEXTURES_ALWAYS_COMMITTED;
            pDevice  = device_10;
            pAdapter = adapter_1;

            if FAILED(D3D12MA.CreateAllocator(*desc, *device.d3d12ma)) {
                log_error("D3D12MA::CreateAllocator() failed.");
                return false;
            }
        }


        return true;
    }

    deinit_device :: (using device: *Device) {
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

        deinit_descriptor_heap(*device.rtv_heap);
        deinit_descriptor_heap(*device.dsv_heap);
        deinit_descriptor_heap(*device.resource_heap);
        deinit_descriptor_heap(*device.sampler_heap);

        safe_release(*device_10);
        safe_release(*device_0);
        safe_release(*factory_6);
    }

    alloc_descriptor :: (using heap: *Descriptor_Heap) -> Descriptor {
        i1 := -1;
        i2 := -1;

        for 0..node_count-1 {
            bits := free_list[it];
            i2 = bit_scan_forward(bits) - 1;
            if i2 >= 0 {
                i1 = it;
                bits ^= (1 << i2);
                free_list[it] = bits;
                break;
            }
        }

        if i1 < 0 {
            assert(i2 == -1);
            assert(false, "Descriptor heap out of space."); // @Robustness: Resize
        }

        count += 1;

        index  := i1*64 + i2;
        offset := heap.descriptor_size * index;

        result: Descriptor = .{
            type       = heap.type,
            index      = cast(u32) index,
            heap       = heap,
            cpu_handle = .{ heap.base_cpu_handle.ptr + xx offset },
        };

        if is_shader_visible(type) {
            result.gpu_handle.ptr = heap.base_gpu_handle.ptr + xx offset;
        }

        return result;
    }

    dealloc_descriptor :: (using d: *Descriptor) {
        assert(heap.count > 0);
        heap.count -= 1;

        i1 := index / 64;
        i2 := index % 64;

        cleared := ((heap.free_list[i1] & (1 << i2)) == 0);
        assert(cleared);

        heap.free_list[i1] |= (1 << i2);
    }

    init_encoder :: (device:  *Device,
                     encoder: *Command_Encoder, 
                     type:     Command_Type) -> bool {
        encoder.type = type;
        encoder.device = device;

        native_type := to_d3d12_command_type(type);

        hr := ID3D12Device_CreateCommandAllocator(device.device_0, native_type, *uid(ID3D12CommandAllocator_UUID), xx *encoder.allocator);
        if FAILED(hr) {
            log_error("ID3D12Device_CreateCommandAllocator failed.");
            return false;
        }

        hr = ID3D12Device4_CreateCommandList1(device.device_10, 0, native_type, .D3D12_COMMAND_LIST_FLAG_NONE, *uid(ID3D12GraphicsCommandList_UUID), xx *encoder.list_0);
        if FAILED(hr) {
            log_error("ID3D12Device4_CreateCommandList failed.");
            return false;
        }

        hr = IUnknown_QueryInterface(encoder.list_0, *uid(ID3D12GraphicsCommandList7_UUID), xx *encoder.list_7);
        if FAILED(hr) {
            log_error("Failed to query 'ID3D12GraphicsCommandList7'.");
            return false;
        }

        return true;
    }

    deinit_encoder :: (using encoder: *Command_Encoder) {
        if encoder {
            safe_release(*list_7);
            safe_release(*list_0);
            safe_release(*allocator);
        }
    }

    begin :: (using encoder: *Command_Encoder) {
        assert(!is_encoding);
        is_encoding = true;
        ID3D12GraphicsCommandList_Reset(list_7, allocator, null);

        // [0]: resource, [1]: sampler
        heaps: [2] *ID3D12DescriptorHeap = .[ device.resource_heap.heap_0, device.sampler_heap.heap_0 ];
        ID3D12GraphicsCommandList_SetDescriptorHeaps(list_7, heaps.count, heaps.data);
    }

    end :: (using encoder: *Command_Encoder) {
        assert(is_encoding);
        is_encoding = false;
        ID3D12GraphicsCommandList_Close(list_7);
    }

    submit :: (using encoder: *Command_Encoder) {
        if #complete type == {
            case .GRAPHICS;
                ID3D12CommandQueue_ExecuteCommandLists(device. graphics_queue.queue_0, 1, cast(**ID3D12CommandList) *list_7);
            case .COMPUTE;
                ID3D12CommandQueue_ExecuteCommandLists(device. compute\_queue.queue_0, 1, cast(**ID3D12CommandList) *list_7);
            case .TRANSFER;
                ID3D12CommandQueue_ExecuteCommandLists(device. transfer_queue.queue_0, 1, cast(**ID3D12CommandList) *list_7);
        }
    }


    init_semaphore :: (device: *Device, using s: *Semaphore) -> bool {
        init: u64 = 0;
        flags := D3D12_FENCE_FLAGS.NONE;

        hr := ID3D12Device_CreateFence(device.device_0, init, flags, *uid(ID3D12Fence_UUID), xx *fence);
        if FAILED(hr) {
            log_error("ID3D12Device_CreateFence failed.");
            return false;
        }

        event = CreateEventW(null, 0, 0, null);
        return true;
    }

    deinit_semaphore :: (using s: *Semaphore) {
        safe_release(*fence);
        if event {
            CloseHandle(event);
            event = null;
        }
    }

    wait :: (using s: *Semaphore, value: u64, milliseconds: s32) {
        timeout: u32 = ifx milliseconds == -1 then INFINITE else cast(u32) milliseconds;
        if get_completed_value(s) < value {
            ID3D12Fence_SetEventOnCompletion(fence, value, event);
            WaitForSingleObject(event, timeout);
        }
    }

    get_completed_value :: (using s: *Semaphore) -> u64 {
        return ID3D12Fence_GetCompletedValue(fence);
    }


    init_sampler :: (device: *Device, s: *Sampler, using desc: Sampler_Desc) {
        s.descriptor = alloc_descriptor(*device.sampler_heap);

        compare := (compare_op != .ALWAYS);

        sampler_desc: D3D12_SAMPLER_DESC = .{
            Filter         = to_d3d12_filter(filter, compare),
            AddressU       = to_d3d12_address_mode(address_u),
            AddressV       = to_d3d12_address_mode(address_v),
            AddressW       = to_d3d12_address_mode(address_w),
            MipLODBias     = mip_lod_bias,
            MaxAnisotropy  = max_anisotropy,
            ComparisonFunc = ifx compare then to_d3d12_comparison_func(compare_op) else .NONE,
            BorderColor    = border_color,
            MinLOD         = min_lod,
            MaxLOD         = max_lod
        };

        // Seems like it can't fail.
        ID3D12Device_CreateSampler(device.device_0, *sampler_desc, s.descriptor.cpu_handle);
    }

    deinit_sampler :: (s: *Sampler) {
        dealloc_descriptor(*s.descriptor);
        memset(s, 0, size_of(Sampler));
    }


    init_swapchain :: (device:          *Device, 
                       s:               *Swapchain, 
                       native_window:   *void, 
                       width:            u32, 
                       height:           u32, 
                       backbuffer_count: u32) -> bool {

        hwnd: HWND = cast(HWND) native_window;

        swapchain_desc: DXGI_SWAP_CHAIN_DESC1 = .{
            Width  = width,
            Height = height,
            Format = .R8G8B8A8_UNORM,
            Stereo = .FALSE,

            // FLIP presentation model disallow MSAA framebuffer.
            // If one wants MSAA, render offscreen and manually 
            // resolve to non-MSAA framebuffer.
            SampleDesc = .{ 1, 0 },

            BufferUsage = .RENDER_TARGET_OUTPUT | .SHADER_INPUT,
            BufferCount = backbuffer_count,
            Scaling = .NONE,

            SwapEffect = .FLIP_DISCARD,
            AlphaMode = .UNSPECIFIED,
            Flags = xx DXGI_SWAP_CHAIN_FLAG.FRAME_LATENCY_WAITABLE_OBJECT
        };

        // Tearing?
        allow_tearing: BOOL = .FALSE;
        if FAILED(IDXGIFactory5_CheckFeatureSupport(device.factory_6, .PRESENT_ALLOW_TEARING, *allow_tearing, size_of(BOOL))) {
            log_error("Error while checking support for allow tearing feature.");
            return false;
        }

        if allow_tearing {
            swapchain_desc.Flags |= xx DXGI_SWAP_CHAIN_FLAG.ALLOW_TEARING;
            s.allow_tearing = true;
        }


        swapchain_1: *IDXGISwapChain1;
        defer safe_release(swapchain_1);
        hr := IDXGIFactory2_CreateSwapChainForHwnd(device.factory_6, device.graphics_queue.queue_0, hwnd, *swapchain_desc, null, null, *swapchain_1);
        if FAILED(hr) {
            log_error("IDXGIFactory2_CreateSwapChainForHwnd failed.");
            return false;
        }

        hr = IUnknown_QueryInterface(swapchain_1, *uid(IDXGISwapChain4_UUID), xx *s.swapchain_4);
        if FAILED(hr) {
            log_error("QueryInterface for IDXGISwapChain4 failed.");
            return false;
        }


        // Disable Alt + Enter changing monitor resolution to match window size.
        IDXGIFactory_MakeWindowAssociation(device.factory_6, hwnd, xx DXGI_MWA.NO_ALT_ENTER);


        // Get initial backbuffer index.
        s.current_backbuffer = IDXGISwapChain3_GetCurrentBackBufferIndex(s.swapchain_4);


        // Get frame waitable object.
        s.frame_waitable_object = IDXGISwapChain2_GetFrameLatencyWaitableObject(s.swapchain_4);
        if IDXGISwapChain2_SetMaximumFrameLatency(s.swapchain_4, backbuffer_count - 1) != S_OK {
            log_error("IDXGISwapChain2_SetMaximumFrameLatency() failed.");
            return false;
        }

        return true;
    }

    deinit_swapchain :: (s: *Swapchain) {
        safe_release(s.swapchain_4);
        memset(s, 0, size_of(Swapchain));
    }

    present :: (s: *Swapchain, sync_interval: u32) {
        flags: u32;
        if sync_interval == 0 {
            assert(s.allow_tearing, "Tearing is not allowed for the swapchain.");
            flags = xx DXGI_PRESENT.ALLOW_TEARING;
        }
        IDXGISwapChain_Present(s.swapchain_4, sync_interval, flags);
        s.current_backbuffer = IDXGISwapChain3_GetCurrentBackBufferIndex(s.swapchain_4);
    }


    set_viewport :: (encoder: *Command_Encoder, 
                     x:         float, y:         float, 
                     width:     float, height:    float, 
                     min_depth: float, max_depth: float) {
        viewport: D3D12_VIEWPORT = .{
            TopLeftX = x,
            TopLeftY = y,
            Width    = width, 
            Height   = height,
            MinDepth = min_depth,
            MaxDepth = max_depth
        };
        ID3D12GraphicsCommandList_RSSetViewports(encoder.list_7, 1, *viewport);
    }

    set_scissor :: (encoder: *Command_Encoder, 
                    x:     s32, y:      s32, 
                    width: s32, height: s32) {
        r: D3D12_RECT = .{
            left   = x,
            top    = y,
            right  = x + width,
            bottom = y + height
        };
        ID3D12GraphicsCommandList_RSSetScissorRects(encoder.list_7, 1, *r);
    }

    push_constants :: (encoder:    *Command_Encoder, 
                       root_index:  u32, 
                       data:       *void, 
                       size:        s64) {
        count := cast(u32) (size / 4);

        if #complete encoder.type == {
            case .GRAPHICS;
                ID3D12GraphicsCommandList_SetGraphicsRoot32BitConstants(encoder.list_7, root_index, count, data, 0);

            case .COMPUTE;
                ID3D12GraphicsCommandList_SetComputeRoot32BitConstants(encoder.list_7, root_index, count, data, 0);

            case .TRANSFER;
                assert(false, "Pushing constants to transfer command encoder is not allowed.");
        }
    }

    draw :: (encoder:       *Command_Encoder, 
             num_vertices:   u32, 
             num_instances:  u32, 
             first_vertex:   u32, 
             first_instance: u32) {
        assert(encoder.type == .GRAPHICS);
        ID3D12GraphicsCommandList_DrawInstanced(encoder.list_7, num_vertices, num_instances, first_vertex, first_instance);
    }

    draw_indexed :: (encoder:       *Command_Encoder, 
                     index_buffer:  *Buffer,
                     index_size:     u32,
                     num_indices:    u32, 
                     num_instances:  u32,
                     first_index:    u32, 
                     first_vertex:   u32,
                     first_instance: u32) {
         view := D3D12_INDEX_BUFFER_VIEW.{
             BufferLocation = ID3D12Resource_GetGPUVirtualAddress(index_buffer.resource),
             Format         = ifx index_size == 2 then .R16_UINT else .R32_UINT,
             SizeInBytes    = cast(u32) index_buffer.size
         };

         ID3D12GraphicsCommandList_IASetIndexBuffer(encoder.list_7, *view);
         ID3D12GraphicsCommandList_DrawIndexedInstanced(encoder.list_7, num_indices, num_instances, first_index, cast(s32) first_vertex, first_instance);
     }


    signal_queue :: (device: *Device, type: Command_Type, semaphore: *Semaphore, value: u64) {
        if #complete type == {
            case .GRAPHICS;
                ID3D12CommandQueue_Signal(device.graphics_queue.queue_0, semaphore.fence, value);
            case .COMPUTE;
                ID3D12CommandQueue_Signal(device.compute\_queue.queue_0, semaphore.fence, value);
            case .TRANSFER;
                ID3D12CommandQueue_Signal(device.transfer_queue.queue_0, semaphore.fence, value);
        }
    }

    wait_queue :: (device: *Device, type: Command_Type, semaphore: *Semaphore, value: u64) {
        if #complete type == {
            case .GRAPHICS;
                ID3D12CommandQueue_Wait(device.graphics_queue.queue_0, semaphore.fence, value);
            case .COMPUTE;
                ID3D12CommandQueue_Wait(device.compute\_queue.queue_0, semaphore.fence, value);
            case .TRANSFER;
                ID3D12CommandQueue_Wait(device.transfer_queue.queue_0, semaphore.fence, value);
        }
    }

    init_allocator :: (device: *Device, a: *Memory_Allocator, memory_type: Memory_Type, kind: Allocation_Kind, priority: Allocation_Priority, linear: bool) -> bool {
        desc: D3D12MA.POOL_DESC;
        {
            using desc;

            Flags = .MSAA_TEXTURES_ALWAYS_COMMITTED;
            if linear {
                Flags |= .ALGORITHM_LINEAR;
            }

            HeapProperties.Type = to_d3d12_heap_type(memory_type);

            /*
              NVIDIA Pascal (10 series) is heap tier 1, which means I can't just 
              shove 'D3D12_HEAP_FLAG_ALLOW_ALL_BUFFERS_AND_TEXTURES' everywhere and 
              forget about it.
            */
            HeapFlags = .NONE;

            if #complete kind == {
                case .BUFFER;             HeapFlags |= .ALLOW_ONLY_BUFFERS;
                case .NON_RT_DS_TEXTURES; HeapFlags |= .ALLOW_ONLY_NON_RT_DS_TEXTURES;
                case .RT_DS_TEXTURES;     HeapFlags |= .ALLOW_ONLY_RT_DS_TEXTURES;
            }

            if #complete priority == {
                case .LOW;    ResidencyPriority = .LOW;
                case .NORMAL; ResidencyPriority = .NORMAL;
                case .HIGH;   ResidencyPriority = .HIGH;
            }
        }

        if FAILED(D3D12MA.Allocator.CreatePool(device.d3d12ma, *desc, *a.pool)) {
            log_error("D3D12MA::Allocator::CreatePool failed.");
            return false;
        }

        a.memory_type = memory_type;
        a.kind        = kind;
        a.priority    = priority;

        return true;
    }

    deinit_allocator :: (a: *Memory_Allocator) {
        safe_release(*a.pool);
        memset(a, 0, size_of(Memory_Allocator));
    }

    init_buffer :: (device:      *Device, 
                    buffer:      *Buffer, 
                    allocator:   *Memory_Allocator, 
                    memory_type:  Memory_Type, 
                    size:         u64, 
                    use_own_heap: bool) -> bool {

        if memory_type != allocator.memory_type {
            log_error("Memory type mismatch: Buffer to be allocated and the allocator disagree with the memory type.");
            return false;
        }

        if allocator.kind != .BUFFER {
            log_error("Allocator type mismatch: expected 'RHI_ALLOCATOR_BUFFER' during buffer allocation.");
            return false;
        }

        resource_desc: D3D12_RESOURCE_DESC = {
            Dimension        = .BUFFER,
            Alignment        = 0,
            Width            = size,
            Height           = 1,
            DepthOrArraySize = 1,
            MipLevels        = 1,
            Format           = .UNKNOWN,
            SampleDesc       = { 1, 0 },
            Layout           = .ROW_MAJOR,
            Flags            = .NONE
        };

        if memory_type != .UPLOAD && memory_type != .READBACK {
            resource_desc.Flags = .ALLOW_UNORDERED_ACCESS;
        }

        initial_state := D3D12_RESOURCE_STATES.COMMON;

        alloc_desc: D3D12MA.ALLOCATION_DESC;
        {
            using alloc_desc;

            Flags |= D3D12MA.ALLOCATION_FLAGS.STRATEGY_MIN_MEMORY;

            if use_own_heap { 
                Flags |= D3D12MA.ALLOCATION_FLAGS.COMMITTED;
            }

            CustomPool = allocator.pool;
        }

        clear_value := null;
        hr := D3D12MA.Allocator.CreateResource(device.d3d12ma, *alloc_desc, *resource_desc, initial_state, clear_value, *buffer.allocation, *uid(ID3D12Resource_UUID), xx *buffer.resource);

        if FAILED(hr) {
            log_error("D3D12MA::Allocator::CreateResource failed.");
            return false;
        }

        buffer.memory_type = memory_type;
        buffer.size = size;
        buffer.state = initial_state;

        return true;
    }

    deinit_buffer :: (using buffer: *Buffer) {
        release_resource(buffer);
        memset(buffer, 0, size_of(Buffer));
    }

    map :: (using b: *Buffer) -> *void {
        ptr: *void;
        read_range: D3D12_RANGE = { 0, 0 }; // No read.
        hr := ID3D12Resource_Map(resource, 0, *read_range, *ptr);
        if FAILED(hr) {
            log_error("ID3D12Resource::Map failed.");
            return null;
        }
        return ptr;
    }

    unmap :: (using b: *Buffer) {
        written_range: D3D12_RANGE = { 0, size };
        ID3D12Resource_Unmap(resource, 0, *written_range);
    }

    init_buffer_view :: (device: *Device, buffer: *Buffer, view: *Buffer_View, offset: int, size: int, writable: bool) {
        // No structured/constant buffer view. Everything's raw. Bad perf? I dunno.
        // Worth taking a look at https://github.com/sebbbi/perftest @Study

        assert(offset % 4 == 0 && size % 4 == 0);

        offset_index := cast(u64) offset / 4;
        count        := cast(u32) size / 4;

        view.descriptor = alloc_descriptor(*device.resource_heap);

        if writable {
            desc := D3D12_UNORDERED_ACCESS_VIEW_DESC.{
                Format                     = .R32_TYPELESS,
                ViewDimension              = .BUFFER,

                Buffer = {
                    FirstElement         = offset_index,
                    NumElements          = count,
                    StructureByteStride  = 0,
                    CounterOffsetInBytes = 0,
                    Flags                = .RAW
                }
            };
            ID3D12Device_CreateUnorderedAccessView(device.device_0, buffer.resource, null, *desc, view.descriptor.cpu_handle);
        } else {
            desc := D3D12_SHADER_RESOURCE_VIEW_DESC.{
                Format                     = .R32_TYPELESS,
                ViewDimension              = .BUFFER,
                Shader4ComponentMapping    = D3D12_DEFAULT_SHADER_4_COMPONENT_MAPPING,

                Buffer = {
                    FirstElement        = offset_index,
                    NumElements         = count,
                    StructureByteStride = 0,
                    Flags               = .RAW
                }
            };
            ID3D12Device_CreateShaderResourceView(device.device_0, buffer.resource, *desc, view.descriptor.cpu_handle);
        }

        view.offset   = offset;
        view.size     = size;
        view.writable = writable;
    }

    deinit_buffer_view :: (using view: *Buffer_View) {
        dealloc_descriptor(*descriptor);
        memset(view, 0, size_of(Buffer_View));
    }


    init_texture :: (device:      *Device, 
                     allocator:   *Memory_Allocator,
                     use_own_heap: bool,
                     texture:     *Texture,
                     using desc:   Texture_Desc, 
                     clear_op:    *Clear_Op = null) -> bool {

        resource_desc := D3D12_RESOURCE_DESC.{
            Dimension        = to_d3d12_dimension(dimension),
            Alignment        = 0,
            Width            = width,
            Height           = height,
            DepthOrArraySize = depth,
            MipLevels        = mip_levels,
            Format           = to_dxgi_format(format),
            SampleDesc       = .{1,0},
            Layout           = .UNKNOWN,
            Flags            = to_d3d12_resource_flags(usage_flags)
        };

        if usage_flags & .COLOR_ATTACHMENT || usage_flags & .DEPTH_STENCIL_ATTACHMENT {
            if allocator.kind != .RT_DS_TEXTURES {
                log_error("Allocator kind mismatch: expected '.RT_DS_TEXTURES'.");
                return false;
            }
        } else if (allocator.kind != .NON_RT_DS_TEXTURES) {
            log_error("Allocator kind mismatch: expected '.NON_RT_DS_TEXTURES'.");
            return false;
        }

        clear_value: D3D12_CLEAR_VALUE;
        if clear_op {
            using clear_op;
            using clear_value;

            Format = resource_desc.Format;

            if clear_depth_stencil {
                DepthStencil.Depth   = depth;
                DepthStencil.Stencil = stencil;
            } else {
                Color = color;
            }
        }
   

        alloc_desc: D3D12MA.ALLOCATION_DESC;
        {
            using alloc_desc;

            Flags |= D3D12MA.ALLOCATION_FLAGS.STRATEGY_MIN_MEMORY;

            if use_own_heap { 
                Flags |= D3D12MA.ALLOCATION_FLAGS.COMMITTED;
            }

            CustomPool = allocator.pool;
        }

        initial_state := D3D12_RESOURCE_STATES.COMMON;

        hr := D3D12MA.Allocator.CreateResource(device.d3d12ma, *alloc_desc, *resource_desc, initial_state, ifx clear_op then *clear_value else null, *texture.allocation, *uid(ID3D12Resource_UUID), xx *texture.resource);

        if FAILED(hr) {
            log_error("D3D12MA::Allocator::CreateResource failed.");
            return false;
        }

        texture.state = initial_state;

        return true;
    }

    deinit_texture :: (using texture: *Texture) {
        release_resource(texture);
        memset(texture, 0, size_of(Texture));
    }

    init_texture_view :: (device: *Device, texture: *Texture, view: *Texture_View) {
        // @Todo
        desc := to_srv(texture);
        ID3D12Device_CreateShaderResourceView(device.device_10, texture.resource, *desc, view.descriptor.cpu_handle);
    }

    deinit_texture_view :: (view: *Texture_View) {
        dealloc_descriptor(*view.descriptor);
        memset(view, 0, size_of(Texture_View));
    }


    copy_buffer_to_buffer :: (encoder: *Command_Encoder, dst: *Buffer, dst_offset: u64, src: *Buffer, src_offset: u64, size: u64) {
        ID3D12GraphicsCommandList_CopyBufferRegion(encoder.list_7, dst.resource, dst_offset, src.resource, src_offset, size);
    }





    #scope_file


    D3D12_DEFAULT_SHADER_4_COMPONENT_MAPPING :: 5768; // @Robustness
    MAX_32BIT_PUSH_CONSTANTS :: 32;


    #if DEBUG {
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
    }

    release_resource :: (using r: *Resource) {
        safe_release(resource);
        safe_release(allocation);
    }

    safe_release :: (pptr: $T) {
        // @Robustness: my gut tells me I could check if it is a pointer or double pointer in Jai.
        if (pptr && pptr.*) {
            IUnknown_Release(pptr.*);
            pptr.* = null;
        }
    }

    to_d3d12_filter :: (filter: Texture_Filter, compare: bool) -> D3D12_FILTER {
        if #complete filter == {
            case .LINEAR;
                if compare then return .COMPARISON_MIN_MAG_MIP_LINEAR;
                           else return .MIN_MAG_MIP_LINEAR;
            case .NEAREST;
                if compare then return .COMPARISON_MIN_MAG_MIP_POINT;
                           else return .MIN_MAG_MIP_POINT;
            case .ANISOTROPIC;
                if compare then return .COMPARISON_ANISOTROPIC;
                           else return .ANISOTROPIC;
        }
    }

    to_d3d12_address_mode :: (mode: Address_Mode) -> D3D12_TEXTURE_ADDRESS_MODE {
        if #complete mode == {
            case .REPEAT;  return .WRAP;
            case .MIRROR;  return .MIRROR;
            case .EDGE;    return .CLAMP;
            case .BORDER;  return .BORDER;
        }
    }

    to_d3d12_comparison_func :: (op: Compare_Op) -> D3D12_COMPARISON_FUNC {
        if #complete op == {
            case .ALWAYS;        return .ALWAYS;
            case .NEVER;         return .NEVER;
            case .EQUAL;         return .EQUAL;
            case .NOT_EQUAL;     return .NOT_EQUAL;
            case .LESS;          return .LESS;
            case .LESS_EQUAL;    return .LESS_EQUAL;
            case .GREATER;       return .GREATER;
            case .GREATER_EQUAL; return .GREATER_EQUAL;
        }
    }

    to_d3d12_command_type :: (type: Command_Type) -> D3D12_COMMAND_LIST_TYPE {
        if #complete type == {
            case .GRAPHICS;  return .DIRECT;
            case .COMPUTE;   return .COMPUTE;
            case .TRANSFER;  return .COPY;
        }
    }

    to_d3d12_heap_type :: (type: Memory_Type) -> D3D12_HEAP_TYPE {
        if #complete type == {
            case .GPU_ONLY;  return .DEFAULT;
            case .UPLOAD;    return .UPLOAD;
            case .READBACK;  return .READBACK;
        }
    }

    to_d3d12_dimension :: (d: Dimension) -> D3D12_RESOURCE_DIMENSION {
        if #complete d == {
            case ._1D;       return .TEXTURE1D;
            case ._2D;       return .TEXTURE2D;
            case ._2D_ARRAY; return .TEXTURE2D;
            case ._3D;       return .TEXTURE3D;
            case .CUBE;      return .TEXTURE2D;
        }
    }

    to_d3d12_resource_flags :: (using usage: Usage_Flags) -> D3D12_RESOURCE_FLAGS {
        flags: D3D12_RESOURCE_FLAGS;
        if usage & .UNORDERED_ACCESS          flags |= .ALLOW_UNORDERED_ACCESS;
        if usage & .COLOR_ATTACHMENT          flags |= .ALLOW_RENDER_TARGET;
        if usage & .DEPTH_STENCIL_ATTACHMENT  flags |= .ALLOW_DEPTH_STENCIL;
        return flags;
    }

    to_dxgi_format :: (format: Format) -> DXGI_FORMAT {
        if #complete format == {
            case .UNKNOWN;             return .UNKNOWN;       

            case .R8_UNORM;            return .R8_UNORM;                                      
            case .RG8_UNORM;           return .R8G8_UNORM;                       
            case .RGBA8_UNORM;         return .R8G8B8A8_UNORM;                       
            case .BGRA8_UNORM;         return .B8G8R8A8_UNORM;                       
            case .RGBA8_UNORM_SRGB;    return .R8G8B8A8_UNORM_SRGB;                        
            case .BGRA8_UNORM_SRGB;    return .B8G8R8A8_UNORM_SRGB;                        

            case .R16_UNORM;           return .R16_UNORM;                       
            case .RG16_UNORM;          return .R16G16_UNORM;                       
            case .RGBA16_UNORM;        return .R16G16B16A16_UNORM;                       

            case .R16F;                return .R16_FLOAT;
            case .RG16F;               return .R16G16_FLOAT;
            case .RGBA16F;             return .R16G16B16A16_FLOAT;

            case .R32F;                return .R32_FLOAT;
            case .RG32F;               return .R32G32_FLOAT;
            case .RGBA32F;             return .R32G32B32A32_FLOAT;

            case .D32F;                return .D32_FLOAT;

            case .BC1_UNORM;           return .BC1_UNORM;                       
            case .BC1_UNORM_SRGB;      return .BC1_UNORM_SRGB;                       
            case .BC3_UNORM;           return .BC3_UNORM;                       
            case .BC3_UNORM_SRGB;      return .BC3_UNORM_SRGB;                       
            case .BC4_UNORM;           return .BC4_UNORM;                       
            case .BC5_UNORM;           return .BC5_UNORM;                       
            case .BC6H_UFLOAT;         return .BC6H_UF16;                       
            case .BC7_UNORM;           return .BC7_UNORM;                       
            case .BC7_UNORM_SRGB;      return .BC7_UNORM_SRGB;                       
        }
    }

    to_srv :: (using texture: *Texture) -> D3D12_SHADER_RESOURCE_VIEW_DESC {
        using result := D3D12_SHADER_RESOURCE_VIEW_DESC.{
            Format                  = to_dxgi_format(texture.format),
            Shader4ComponentMapping = D3D12_DEFAULT_SHADER_4_COMPONENT_MAPPING,
        };

        if #complete dimension == {
            case ._1D;
                ViewDimension = .TEXTURE1D;
                Texture1D = .{
                    MostDetailedMip = 0,
                    MipLevels       = mip_levels,
                };
            case ._2D; 
                ViewDimension = .TEXTURE2D;
                Texture2D = .{
                    MostDetailedMip = 0,
                    MipLevels       = mip_levels,
                };
            case ._2D_ARRAY;
                ViewDimension = .TEXTURE2DARRAY;
                Texture2DArray = .{
                    MostDetailedMip = 0,
                    MipLevels       = mip_levels,
                    FirstArraySlice = 0,
                    ArraySize       = depth,
                };
            case ._3D;
                ViewDimension = .TEXTURE3D;
                Texture3D = .{
                    MostDetailedMip = 0,
                    MipLevels       = mip_levels
                };
            case .CUBE;
                ViewDimension = .TEXTURECUBE;
                TextureCube = .{
                    MostDetailedMip = 0,
                    MipLevels       = mip_levels
                };
        }

        return result;
    }

    to_uav :: (using texture: *Texture) -> D3D12_UNORDERED_ACCESS_VIEW_DESC {
        using result := D3D12_UNORDERED_ACCESS_VIEW_DESC.{
            Format = to_dxgi_format(texture.format),
        };

        if #complete dimension == {
            case ._1D;
                ViewDimension = .TEXTURE1D;
                Texture1D = .{
                    MipSlice = 0
                };

            case ._2D; 
                ViewDimension = .TEXTURE2D;
                Texture2D = .{
                    MipSlice   = 0,
                    PlaneSlice = 0
                };

            case ._2D_ARRAY; #through;
            case .CUBE;
                ViewDimension = .TEXTURE2DARRAY;
                Texture2DArray = .{
                    MipSlice        = 0,
                    FirstArraySlice = 0,
                    ArraySize       = depth,
                    PlaneSlice      = 0,
                };

            case ._3D;
                // @Study: Unsure of WSlice and WSize.
                ViewDimension = .TEXTURE3D;
                Texture3D = .{
                    MipSlice    = 0,
                    FirstWSlice = 0,
                    WSize       = depth
                };
        }

        return result;
    }

    to_rtv :: (using texture: *Texture) -> D3D12_RENDER_TARGET_VIEW_DESC {
        using result := D3D12_RENDER_TARGET_VIEW_DESC.{
            Format = to_dxgi_format(texture.format),
        };

        if #complete dimension == {
            case ._1D;
                ViewDimension = .TEXTURE1D;
                Texture1D = .{
                    MipSlice = 0
                };

            case ._2D; 
                ViewDimension = .TEXTURE2D;
                Texture2D = .{
                    MipSlice   = 0,
                    PlaneSlice = 0
                };

            case ._2D_ARRAY; #through;
            case .CUBE;
                ViewDimension = .TEXTURE2DARRAY;
                Texture2DArray = .{
                    MipSlice        = 0,
                    FirstArraySlice = 0,
                    ArraySize       = depth,
                    PlaneSlice      = 0
                };

            case ._3D;
                // @Study: Unsure of WSlice and WSize.
                ViewDimension = .TEXTURE3D;
                Texture3D = .{
                    MipSlice    = 0,
                    FirstWSlice = 0,
                    WSize       = depth
                };
        }

        return result;
    }

    to_dsv :: (using texture: *Texture) -> D3D12_DEPTH_STENCIL_VIEW_DESC {
        using result := D3D12_DEPTH_STENCIL_VIEW_DESC.{
            Format = to_dxgi_format(texture.format),
        };

        if #complete dimension == {
            case ._1D;
                ViewDimension = .TEXTURE1D;
                Texture1D = .{
                    MipSlice = 0
                };

            case ._2D; 
                ViewDimension = .TEXTURE2D;
                Texture2D = .{
                    MipSlice   = 0,
                };

            case ._2D_ARRAY;
                ViewDimension = .TEXTURE2DARRAY;
                Texture2DArray = .{
                    MipSlice        = 0,
                    FirstArraySlice = 0,
                    ArraySize       = depth
                };

            case .CUBE; #through;
            case ._3D;
                assert(false, "Invalid texture view type for depth stencil target.");
        }

        return result;
    }

    init_command_queue :: (device: *Device, queue: *Command_Queue, type: D3D12_COMMAND_LIST_TYPE) -> bool {
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

    init_descriptor_heap :: (device: *Device, 
                             heap:   *Descriptor_Heap,
                             type:    D3D12_DESCRIPTOR_HEAP_TYPE, 
                             count:   int) -> bool {
        heap.type = type;

        remember_allocators(heap,, device.allocator);

        flags: D3D12_DESCRIPTOR_HEAP_FLAGS = .NONE;

        if is_shader_visible(type)  flags = .SHADER_VISIBLE;

        heap.allocated = align_forward(count, 64);

        heap_desc : D3D12_DESCRIPTOR_HEAP_DESC = .{
            Type           = type,
            NumDescriptors = cast(u32) heap.allocated,
            Flags          = flags,
        };

        hr := ID3D12Device_CreateDescriptorHeap(device.device_0, *heap_desc, *uid(ID3D12DescriptorHeap_UUID), xx *heap.heap_0);
        if FAILED(hr) {
            log_error("ID3D12Device_CreateDescriptorHeap failed.");
            return false;
        }

        // Get base CPU and GPU handle.
        heap.base_cpu_handle = ID3D12DescriptorHeap_GetCPUDescriptorHandleForHeapStart(heap.heap_0);
        if flags & .SHADER_VISIBLE {
            heap.base_gpu_handle = ID3D12DescriptorHeap_GetGPUDescriptorHandleForHeapStart(heap.heap_0);
        }

        // Get descriptor size.
        heap.descriptor_size = ID3D12Device_GetDescriptorHandleIncrementSize(device.device_0, type);


        // Make a free list
        {
            node_count := heap.allocated / 64;
            sz := size_of(u64) * node_count;

            heap.node_count = node_count;
            heap.free_list  = alloc(sz);

            memset(heap.free_list, 0xff, sz); // fill with 1s
        }

        return true;
    }

    deinit_descriptor_heap :: (heap: *Descriptor_Heap) {
        safe_release(*heap.heap_0);
    }

    is_shader_visible :: (type: D3D12_DESCRIPTOR_HEAP_TYPE) -> bool {
        return type == .CBV_SRV_UAV || type == .SAMPLER;
    }
}
