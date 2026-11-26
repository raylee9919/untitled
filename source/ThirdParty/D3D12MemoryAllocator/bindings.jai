//
// This file was auto-generated using the following command:
//
// jai generate_bindings.jai
//



D3D12MA_ATOMIC_UINT32 :: MyAtomicU32;
D3D12MA_ATOMIC_UINT64 :: MyAtomicU64;
D3D12MA_DXGI_1_4 :: 1;

D3D12MA_CREATE_NOT_ZEROED_AVAILABLE :: 1;

D3D12MA_USE_SMALL_RESOURCE_PLACEMENT_ALIGNMENT :: 1;

FACILITY_D3D12MA :: 3542;

MyAtomicU32 :: struct {
    v: s32;

    Constructor :: (this: *MyAtomicU32, x: u32 = 0) -> void #cpp_method #foreign d3d12ma "??0MyAtomicU32@@QEAA@I@Z";

    load :: (this: *MyAtomicU32) -> u32 #cpp_method #foreign d3d12ma "?load@MyAtomicU32@@QEBAIXZ";
    store :: (this: *MyAtomicU32, x: u32) -> void #cpp_method #foreign d3d12ma "?store@MyAtomicU32@@QEAAXI@Z";
}

// Operator forms, since the library may use ++x, x += n, x = 0, and so on
operator_plus_plus :: (this: *MyAtomicU32) -> u32 #cpp_method #foreign d3d12ma "??EMyAtomicU32@@QEAAIXZ";
operator_plus_plus :: (this: MyAtomicU32) -> u32 #no_context {
    return operator_plus_plus(*this);
}
operator_minus_minus :: (this: *MyAtomicU32) -> u32 #cpp_method #foreign d3d12ma "??FMyAtomicU32@@QEAAIXZ";
operator_minus_minus :: (this: MyAtomicU32) -> u32 #no_context {
    return operator_minus_minus(*this);
}

operator_assign :: (this: *MyAtomicU32, x: u32) -> u32 #cpp_method #foreign d3d12ma "??4MyAtomicU32@@QEAAII@Z";

MyAtomicU64 :: struct {
    v: s64;

    Constructor :: (this: *MyAtomicU64, x: u64 = 0) -> void #cpp_method #foreign d3d12ma "??0MyAtomicU64@@QEAA@_K@Z";

    load :: (this: *MyAtomicU64) -> u64 #cpp_method #foreign d3d12ma "?load@MyAtomicU64@@QEBA_KXZ";

    fetch_add :: (this: *MyAtomicU64, x: u64) -> u64 #cpp_method #foreign d3d12ma "?fetch_add@MyAtomicU64@@QEAA_K_K@Z";
    fetch_sub :: (this: *MyAtomicU64, x: u64) -> u64 #cpp_method #foreign d3d12ma "?fetch_sub@MyAtomicU64@@QEAA_K_K@Z";
}

operator+= :: (this: *MyAtomicU64, x: u64) -> u64 #cpp_method #foreign d3d12ma "??YMyAtomicU64@@QEAA_K_K@Z";
operator-= :: (this: *MyAtomicU64, x: u64) -> u64 #cpp_method #foreign d3d12ma "??ZMyAtomicU64@@QEAA_K_K@Z";

/// \endcond
D3D12MA :: struct {
    IUnknownImpl :: struct {
        #as using,except(vtable) iunknown: IUnknown;

        m_RefCount:   MyAtomicU32 = {1};

        #overlay (iunknown) vtable: *IUnknownImpl_VTable; // Overlay parent's vtable with IUnknownImpl’s vtable

        // Virtual functions:
        // Normally you should call them via the vtable.
        // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
        // or need to create a vtable yourself.

        virtual_Destructor :: (this: *IUnknownImpl, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign d3d12ma "??1IUnknownImpl@D3D12MA@@UEAA@XZ";
        virtual_QueryInterface :: (this: *IUnknownImpl, riid: *IID, ppvObject: **void) -> HRESULT #cpp_method #foreign d3d12ma "?QueryInterface@IUnknownImpl@D3D12MA@@UEAAJAEBU_GUID@@PEAPEAX@Z";
        virtual_AddRef :: (this: *IUnknownImpl) -> u32 #cpp_method #foreign d3d12ma "?AddRef@IUnknownImpl@D3D12MA@@UEAAKXZ";
        virtual_Release :: (this: *IUnknownImpl) -> u32 #cpp_method #foreign d3d12ma "?Release@IUnknownImpl@D3D12MA@@UEAAKXZ";

        virtual_ReleaseThis :: (this: *IUnknownImpl) -> void #cpp_method #foreign d3d12ma "?ReleaseThis@IUnknownImpl@D3D12MA@@MEAAXXZ";
    }
    IUnknownImpl_VTable :: struct #type_info_none {
        using vtable: IUnknown_VTable;

        Destructor:   #type (this: *D3D12MA.IUnknownImpl, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method;

        ReleaseThis:  #type (this: *D3D12MA.IUnknownImpl) -> void #cpp_method;
    }
    IUnknownImpl_Destructor :: inline (this: *IUnknownImpl, flags: Msvc_Destructor_Flags = .NONE) { this.vtable.Destructor(this, flags); }

    IUnknownImpl_ReleaseThis :: inline (this: *IUnknownImpl) { this.vtable.ReleaseThis(this); }

    vtable :: (obj: *IUnknownImpl) -> *IUnknownImpl_VTable { return obj.vtable; }


    /// \cond INTERNAL
    DefragmentationContextPimpl :: struct {}
    AllocatorPimpl :: struct {}
    PoolPimpl :: struct {}
    NormalBlock :: struct {}
    BlockVector :: struct {}
    CommittedAllocationList :: struct {}
    JsonWriter :: struct {}
    VirtualBlockPimpl :: struct {}

    /// \brief Unique identifier of single allocation done inside the memory heap.
    AllocHandle :: u64;

    /// Pointer to custom callback function that allocates CPU memory.
    ALLOCATE_FUNC_PTR :: #type (Size: u64, Alignment: u64, pPrivateData: *void) -> *void #c_call;

    /**
    \brief Pointer to custom callback function that deallocates CPU memory.
    
    `pMemory = null` should be accepted and ignored.
    */
    FREE_FUNC_PTR :: #type (pMemory: *void, pPrivateData: *void) -> void #c_call;

    /// Custom callbacks to CPU memory allocation functions.
    ALLOCATION_CALLBACKS :: struct {
        /// %Allocation function.
        pAllocate:    ALLOCATE_FUNC_PTR;

        /// Dellocation function.
        pFree:        FREE_FUNC_PTR;

        /// Custom data that will be passed to allocation and deallocation functions as `pUserData` parameter.
        pPrivateData: *void;
    }

    /// \brief Bit flags to be used with ALLOCATION_DESC::Flags.
    ALLOCATION_FLAGS :: enum s32 {
        NONE                :: 0;

        COMMITTED           :: 1;

        NEVER_ALLOCATE      :: 2;

        WITHIN_BUDGET       :: 4;

        UPPER_ADDRESS       :: 8;

        CAN_ALIAS           :: 16;

        STRATEGY_MIN_MEMORY :: 65536;

        STRATEGY_MIN_TIME   :: 131072;

        STRATEGY_MIN_OFFSET :: 16384;

        STRATEGY_BEST_FIT   :: 65536;

        STRATEGY_FIRST_FIT  :: 131072;

        STRATEGY_MASK       :: 212992;

        ALLOCATION_FLAG_NONE                :: NONE;

        ALLOCATION_FLAG_COMMITTED           :: COMMITTED;

        ALLOCATION_FLAG_NEVER_ALLOCATE      :: NEVER_ALLOCATE;

        ALLOCATION_FLAG_WITHIN_BUDGET       :: WITHIN_BUDGET;

        ALLOCATION_FLAG_UPPER_ADDRESS       :: UPPER_ADDRESS;

        ALLOCATION_FLAG_CAN_ALIAS           :: CAN_ALIAS;

        ALLOCATION_FLAG_STRATEGY_MIN_MEMORY :: STRATEGY_MIN_MEMORY;

        ALLOCATION_FLAG_STRATEGY_MIN_TIME   :: STRATEGY_MIN_TIME;

        ALLOCATION_FLAG_STRATEGY_MIN_OFFSET :: STRATEGY_MIN_OFFSET;

        ALLOCATION_FLAG_STRATEGY_BEST_FIT   :: STRATEGY_BEST_FIT;

        ALLOCATION_FLAG_STRATEGY_FIRST_FIT  :: STRATEGY_FIRST_FIT;

        ALLOCATION_FLAG_STRATEGY_MASK       :: STRATEGY_MASK;
    }

    /// \brief Parameters of created D3D12MA::Allocation object. To be used with Allocator::CreateResource.
    ALLOCATION_DESC :: struct {
        /// Flags for the allocation.
        Flags:          ALLOCATION_FLAGS;

        /** \brief The type of memory heap where the new allocation should be placed.
        
        It must be one of: `D3D12_HEAP_TYPE_DEFAULT`, `D3D12_HEAP_TYPE_UPLOAD`, `D3D12_HEAP_TYPE_READBACK`.
        
        When D3D12MA::ALLOCATION_DESC::CustomPool != NULL this member is ignored.
        */
        HeapType:       D3D12_HEAP_TYPE;

        /** \brief Additional heap flags to be used when allocating memory.
        
        In most cases it can be 0.
        
        - If you use D3D12MA::Allocator::CreateResource(), you don't need to care.
        Necessary flag `D3D12_HEAP_FLAG_ALLOW_ONLY_BUFFERS`, `D3D12_HEAP_FLAG_ALLOW_ONLY_NON_RT_DS_TEXTURES`,
        or `D3D12_HEAP_FLAG_ALLOW_ONLY_RT_DS_TEXTURES` is added automatically.
        - If you use D3D12MA::Allocator::AllocateMemory(), you should specify one of those `ALLOW_ONLY` flags.
        Except when you validate that D3D12MA::Allocator::GetD3D12Options()`.ResourceHeapTier == D3D12_RESOURCE_HEAP_TIER_1` -
        then you can leave it 0.
        - You can specify additional flags if needed. Then the memory will always be allocated as
        separate block using `D3D12Device::CreateCommittedResource` or `CreateHeap`, not as part of an existing larget block.
        
        When D3D12MA::ALLOCATION_DESC::CustomPool != NULL this member is ignored.
        */
        ExtraHeapFlags: D3D12_HEAP_FLAGS;

        /** \brief Custom pool to place the new resource in. Optional.
        
        When not null, the resource will be created inside specified custom pool.
        Members `HeapType`, `ExtraHeapFlags` are then ignored.
        */
        CustomPool:     *Pool;

        /// Custom general-purpose pointer that will be stored in D3D12MA::Allocation.
        pPrivateData:   *void;
    }

    /** \brief Calculated statistics of memory usage e.g. in a specific memory heap type,
    memory segment group, custom pool, or total.
    
    These are fast to calculate.
    See functions: D3D12MA::Allocator::GetBudget(), D3D12MA::Pool::GetStatistics().
    */
    Statistics :: struct {
        /** \brief Number of D3D12 memory blocks allocated - `ID3D12Heap` objects and committed resources.
        */
        BlockCount:      u32;

        /** \brief Number of D3D12MA::Allocation objects allocated.
        
        Committed allocations have their own blocks, so each one adds 1 to `AllocationCount` as well as `BlockCount`.
        */
        AllocationCount: u32;

        /** \brief Number of bytes allocated in memory blocks.
        */
        BlockBytes:      u64;

        /** \brief Total number of bytes occupied by all D3D12MA::Allocation objects.
        
        Always less or equal than `BlockBytes`.
        Difference `(BlockBytes - AllocationBytes)` is the amount of memory allocated from D3D12
        but unused by any D3D12MA::Allocation.
        */
        AllocationBytes: u64;
    }

    /** \brief More detailed statistics than D3D12MA::Statistics.
    
    These are slower to calculate. Use for debugging purposes.
    See functions: D3D12MA::Allocator::CalculateStatistics(), D3D12MA::Pool::CalculateStatistics().
    
    Averages are not provided because they can be easily calculated as:
    
    \code
    UINT64 AllocationSizeAvg = DetailedStats.Statistics.AllocationBytes / detailedStats.Statistics.AllocationCount;
    UINT64 UnusedBytes = DetailedStats.Statistics.BlockBytes - DetailedStats.Statistics.AllocationBytes;
    UINT64 UnusedRangeSizeAvg = UnusedBytes / DetailedStats.UnusedRangeCount;
    \endcode
    */
    DetailedStatistics :: struct {
        /// Basic statistics.
        Stats:              Statistics;

        /// Number of free ranges of memory between allocations.
        UnusedRangeCount:   u32;

        /// Smallest allocation size. `UINT64_MAX` if there are 0 allocations.
        AllocationSizeMin:  u64;

        /// Largest allocation size. 0 if there are 0 allocations.
        AllocationSizeMax:  u64;

        /// Smallest empty range size. `UINT64_MAX` if there are 0 empty ranges.
        UnusedRangeSizeMin: u64;

        /// Largest empty range size. 0 if there are 0 empty ranges.
        UnusedRangeSizeMax: u64;
    }

    /** \brief  General statistics from current state of the allocator -
    total memory usage across all memory heaps and segments.
    
    These are slower to calculate. Use for debugging purposes.
    See function D3D12MA::Allocator::CalculateStatistics().
    */
    TotalStatistics :: struct {
        /** \brief One element for each type of heap located at the following indices:
        
        - 0 = `D3D12_HEAP_TYPE_DEFAULT`
        - 1 = `D3D12_HEAP_TYPE_UPLOAD`
        - 2 = `D3D12_HEAP_TYPE_READBACK`
        - 3 = `D3D12_HEAP_TYPE_CUSTOM`
        - 4 = `D3D12_HEAP_TYPE_GPU_UPLOAD`
        */
        HeapType:           [5] DetailedStatistics;

        /** \brief One element for each memory segment group located at the following indices:
        
        - 0 = `DXGI_MEMORY_SEGMENT_GROUP_LOCAL`
        - 1 = `DXGI_MEMORY_SEGMENT_GROUP_NON_LOCAL`
        
        Meaning of these segment groups is:
        
        - When `IsUMA() == FALSE` (discrete graphics card):
        - `DXGI_MEMORY_SEGMENT_GROUP_LOCAL` (index 0) represents GPU memory
        (resources allocated in `D3D12_HEAP_TYPE_DEFAULT`, `D3D12_HEAP_TYPE_GPU_UPLOAD` or `D3D12_MEMORY_POOL_L1`).
        - `DXGI_MEMORY_SEGMENT_GROUP_NON_LOCAL` (index 1) represents system memory
        (resources allocated in `D3D12_HEAP_TYPE_UPLOAD`, `D3D12_HEAP_TYPE_READBACK`, or `D3D12_MEMORY_POOL_L0`).
        - When `IsUMA() == TRUE` (integrated graphics chip):
        - `DXGI_MEMORY_SEGMENT_GROUP_LOCAL` = (index 0) represents memory shared for all the resources.
        - `DXGI_MEMORY_SEGMENT_GROUP_NON_LOCAL` = (index 1) is unused and always 0.
        */
        MemorySegmentGroup: [2] DetailedStatistics;

        /// Total statistics from all memory allocated from D3D12.
        Total:              DetailedStatistics;
    }

    /** \brief %Statistics of current memory usage and available budget for a specific memory segment group.
    
    These are fast to calculate. See function D3D12MA::Allocator::GetBudget().
    */
    Budget :: struct {
        /** \brief %Statistics fetched from the library.
        */
        Stats:       Statistics;

        /** \brief Estimated current memory usage of the program.
        
        Fetched from system using `IDXGIAdapter3::QueryVideoMemoryInfo` if possible.
        
        It might be different than `BlockBytes` (usually higher) due to additional implicit objects
        also occupying the memory, like swapchain, pipeline state objects, descriptor heaps, command lists, or
        heaps and resources allocated outside of this library, if any.
        */
        UsageBytes:  u64;

        /** \brief Estimated amount of memory available to the program.
        
        Fetched from system using `IDXGIAdapter3::QueryVideoMemoryInfo` if possible.
        
        It might be different (most probably smaller) than memory capacity returned
        by D3D12MA::Allocator::GetMemoryCapacity() due to factors
        external to the program, decided by the operating system.
        Difference `BudgetBytes - UsageBytes` is the amount of additional memory that can probably
        be allocated without problems. Exceeding the budget may result in various problems.
        */
        BudgetBytes: u64;
    }

    /// \brief Represents single memory allocation done inside VirtualBlock.
    VirtualAllocation :: struct {
        /// \brief Unique idenitfier of current allocation. 0 means null/invalid.
        AllocHandle_: AllocHandle;
    }

    /** \brief Represents single memory allocation.
    
    It may be either implicit memory heap dedicated to a single resource or a
    specific region of a bigger heap plus unique offset.
    
    To create such object, fill structure D3D12MA::ALLOCATION_DESC and call function
    Allocator::CreateResource.
    
    The object remembers size and some other information.
    To retrieve this information, use methods of this class.
    
    The object also remembers `ID3D12Resource` and "owns" a reference to it,
    so it calls `%Release()` on the resource when destroyed.
    */
    Allocation :: struct {
        #as using iunknownimpl: IUnknownImpl;

        /** \brief Returns offset in bytes from the start of memory heap.
        
        You usually don't need to use this offset. If you create a buffer or a texture together with the allocation using function
        D3D12MA::Allocator::CreateResource, functions that operate on that resource refer to the beginning of the resource,
        not entire memory heap.
        
        If the Allocation represents committed resource with implicit heap, returns 0.
        */
        GetOffset :: (this: *Allocation) -> u64 #cpp_method #foreign d3d12ma "?GetOffset@Allocation@D3D12MA@@QEBA_KXZ";

        /// Returns alignment that resource was created with.
        GetAlignment :: (this: *Allocation) -> u64 #cpp_method #foreign d3d12ma "?GetAlignment@Allocation@D3D12MA@@QEBA_KXZ";

        /** \brief Returns size in bytes of the allocation.
        
        - If you created a buffer or a texture together with the allocation using function D3D12MA::Allocator::CreateResource,
        this is the size of the resource returned by `ID3D12Device::GetResourceAllocationInfo`.
        - For allocations made out of bigger memory blocks, this also is the size of the memory region assigned exclusively to this allocation.
        - For resources created as committed, this value may not be accurate. DirectX implementation may optimize memory usage internally
        so that you may even observe regions of `ID3D12Resource::GetGPUVirtualAddress()` + Allocation::GetSize() to overlap in memory and still work correctly.
        */
        GetSize :: (this: *Allocation) -> u64 #cpp_method #foreign d3d12ma "?GetSize@Allocation@D3D12MA@@QEBA_KXZ";

        /** \brief Releases the resource currently pointed by the allocation (if not null), sets it to new one, incrementing its reference counter (if not null).
        
        \warning
        This is an advanced feature that should be used only in special cases, e.g. during \subpage defragmentation.
        Typically, an allocation object should reference the resource that was created together with it.
        If you swap it to another resource of different size, \subpage statistics and budgets can be calculated incorrectly.
        */
        SetResource :: (this: *Allocation, pResource: *ID3D12Resource) -> void #cpp_method #foreign d3d12ma "?SetResource@Allocation@D3D12MA@@QEAAXPEAUID3D12Resource@@@Z";

        /** \brief Returns memory heap that the resource is created in.
        
        If the Allocation represents committed resource with implicit heap, returns NULL.
        */
        GetHeap :: (this: *Allocation) -> *ID3D12Heap #cpp_method #foreign d3d12ma "?GetHeap@Allocation@D3D12MA@@QEBAPEAUID3D12Heap@@XZ";

        /// Changes custom pointer for an allocation to a new value.
        SetPrivateData :: (this: *Allocation, pPrivateData: *void) -> void #cpp_method #foreign d3d12ma "?SetPrivateData@Allocation@D3D12MA@@QEAAXPEAX@Z";

        /// Get custom pointer associated with the allocation.
        GetPrivateData :: (this: *Allocation) -> *void #cpp_method #foreign d3d12ma "?GetPrivateData@Allocation@D3D12MA@@QEBAPEAXXZ";

        /** \brief Associates a name with the allocation object. This name is for use in debug diagnostics and tools.
        
        Internal copy of the string is made, so the memory pointed by the argument can be
        changed of freed immediately after this call.
        
        `Name` can be null.
        */
        SetName :: (this: *Allocation, Name: *s16) -> void #cpp_method #foreign d3d12ma "?SetName@Allocation@D3D12MA@@QEAAXPEB_W@Z";

        /** \brief Returns the name associated with the allocation object.
        
        Returned string points to an internal copy.
        
        If no name was associated with the allocation, returns null.
        */
        GetName :: (this: *Allocation) -> *s16 #cpp_method #foreign d3d12ma "?GetName@Allocation@D3D12MA@@QEBAPEB_WXZ";

        Type :: enum s32 {
            COMMITTED :: 0;
            PLACED    :: 1;
            HEAP      :: 2;
            COUNT     :: 3;

            TYPE_COMMITTED :: COMMITTED;
            TYPE_PLACED    :: PLACED;
            TYPE_HEAP      :: HEAP;
            TYPE_COUNT     :: COUNT;
        }

        m_Allocator:            *AllocatorPimpl;
        m_Size:                 u64;
        m_Alignment:            u64;
        m_Resource:             *ID3D12Resource;
        m_pPrivateData:         *void;
        m_Name:                 *s16;

        struct {
            m_Heap: struct {
                // Beginning must be compatible with m_Committed.
                list: *CommittedAllocationList;
                prev: *Allocation;
                next: *Allocation;
                heap: *ID3D12Heap;
            }; // largest member, moved to the start of the struct/union to support #overlay.

            #overlay (m_Heap) m_Committed: struct {
                list: *CommittedAllocationList;
                prev: *Allocation;
                next: *Allocation;
            };
            #overlay (m_Heap) m_Placed:    struct {
                allocHandle: AllocHandle;
                block:       *NormalBlock;
            };
        }

        PackedData :: struct {
            Constructor :: (this: *PackedData) -> void #cpp_method #foreign d3d12ma "??0PackedData@Allocation@D3D12MA@@QEAA@XZ";

            GetType :: (this: *PackedData) -> Type #cpp_method #foreign d3d12ma "?GetType@PackedData@Allocation@D3D12MA@@QEBA?AW4Type@23@XZ";
            GetResourceDimension :: (this: *PackedData) -> D3D12_RESOURCE_DIMENSION #cpp_method #foreign d3d12ma "?GetResourceDimension@PackedData@Allocation@D3D12MA@@QEBA?AW4D3D12_RESOURCE_DIMENSION@@XZ";
            GetResourceFlags :: (this: *PackedData) -> D3D12_RESOURCE_FLAGS #cpp_method #foreign d3d12ma "?GetResourceFlags@PackedData@Allocation@D3D12MA@@QEBA?AW4D3D12_RESOURCE_FLAGS@@XZ";
            GetTextureLayout :: (this: *PackedData) -> D3D12_TEXTURE_LAYOUT #cpp_method #foreign d3d12ma "?GetTextureLayout@PackedData@Allocation@D3D12MA@@QEBA?AW4D3D12_TEXTURE_LAYOUT@@XZ";

            SetType :: (this: *PackedData, type: Type) -> void #cpp_method #foreign d3d12ma "?SetType@PackedData@Allocation@D3D12MA@@QEAAXW4Type@23@@Z";
            SetResourceDimension :: (this: *PackedData, resourceDimension: D3D12_RESOURCE_DIMENSION) -> void #cpp_method #foreign d3d12ma "?SetResourceDimension@PackedData@Allocation@D3D12MA@@QEAAXW4D3D12_RESOURCE_DIMENSION@@@Z";
            SetResourceFlags :: (this: *PackedData, resourceFlags: D3D12_RESOURCE_FLAGS) -> void #cpp_method #foreign d3d12ma "?SetResourceFlags@PackedData@Allocation@D3D12MA@@QEAAXW4D3D12_RESOURCE_FLAGS@@@Z";
            SetTextureLayout :: (this: *PackedData, textureLayout: D3D12_TEXTURE_LAYOUT) -> void #cpp_method #foreign d3d12ma "?SetTextureLayout@PackedData@Allocation@D3D12MA@@QEAAXW4D3D12_TEXTURE_LAYOUT@@@Z";

            __bitfield: [6] u8;
            /* 
                m_Type: u32; /* 2 bits */ // enum Type
                m_ResourceDimension: u32; /* 3 bits */ // enum D3D12_RESOURCE_DIMENSION
                m_ResourceFlags: u32; /* 24 bits */ // flags D3D12_RESOURCE_FLAGS
                m_TextureLayout: u32; /* 9 bits */ // enum D3D12_TEXTURE_LAYOUT;
            */

            _:          [0] u32; // Force PackedData alignment to match the C/C++ equivalent
        }

        set_m_Type :: (fields: *PackedData, value: u32) {
            MASK0: u8 : 0b11;
            fields.__bitfield[0] = (fields.__bitfield[0] & ~MASK0) | ((cast,no_check(u8) value) & MASK0);
        }
        get_m_Type :: (fields: PackedData) -> u32 {
            return (cast,no_check(u32) (fields.__bitfield[0] & 0b11));
        }

        set_m_ResourceDimension :: (fields: *PackedData, value: u32) {
            MASK0: u8 : (0b111 << 2);
            fields.__bitfield[0] = (fields.__bitfield[0] & ~MASK0) | (((cast,no_check(u8) value) << 2) & MASK0);
        }
        get_m_ResourceDimension :: (fields: PackedData) -> u32 {
            return (cast,no_check(u32) ((fields.__bitfield[0] & (0b111 << 2)) >> 2));
        }

        set_m_ResourceFlags :: (fields: *PackedData, value: u32) {
            MASK0: u8 : (0b111 << 5);
            fields.__bitfield[0] = (fields.__bitfield[0] & ~MASK0) | (((cast,no_check(u8) value) << 5) & MASK0);
            MASK1: u8 : 0b1111_1111;
            fields.__bitfield[1] = (fields.__bitfield[1] & ~MASK1) | ((cast,no_check(u8) (value >> 3)) & MASK1);
            MASK2: u8 : 0b1111_1111;
            fields.__bitfield[2] = (fields.__bitfield[2] & ~MASK2) | ((cast,no_check(u8) (value >> 11)) & MASK2);
            MASK3: u8 : 0b1_1111;
            fields.__bitfield[3] = (fields.__bitfield[3] & ~MASK3) | ((cast,no_check(u8) (value >> 19)) & MASK3);
        }
        get_m_ResourceFlags :: (fields: PackedData) -> u32 {
            return (cast,no_check(u32) ((fields.__bitfield[0] & (0b111 << 5)) >> 5)) | ((cast,no_check(u32) (fields.__bitfield[1] & 0b1111_1111)) << 3) | ((cast,no_check(u32) (fields.__bitfield[2] & 0b1111_1111)) << 11) | ((cast,no_check(u32) (fields.__bitfield[3] & 0b1_1111)) << 19);
        }

        set_m_TextureLayout :: (fields: *PackedData, value: u32) {
            MASK0: u8 : 0b1111_1111;
            fields.__bitfield[4] = (fields.__bitfield[4] & ~MASK0) | ((cast,no_check(u8) value) & MASK0);
            MASK1: u8 : 0b1;
            fields.__bitfield[5] = (fields.__bitfield[5] & ~MASK1) | ((cast,no_check(u8) (value >> 8)) & MASK1);
        }
        get_m_TextureLayout :: (fields: PackedData) -> u32 {
            return (cast,no_check(u32) (fields.__bitfield[4] & 0b1111_1111)) | ((cast,no_check(u32) (fields.__bitfield[5] & 0b1)) << 8);
        }


        m_PackedData:           PackedData;

        Constructor :: (this: *Allocation, allocator: *AllocatorPimpl, size: u64, alignment: u64) -> void #cpp_method #foreign d3d12ma "??0Allocation@D3D12MA@@AEAA@PEAVAllocatorPimpl@1@_K1@Z";

        InitCommitted :: (this: *Allocation, list: *CommittedAllocationList) -> void #cpp_method #foreign d3d12ma "?InitCommitted@Allocation@D3D12MA@@AEAAXPEAVCommittedAllocationList@2@@Z";
        InitPlaced :: (this: *Allocation, allocHandle: AllocHandle, block: *NormalBlock) -> void #cpp_method #foreign d3d12ma "?InitPlaced@Allocation@D3D12MA@@AEAAX_KPEAVNormalBlock@2@@Z";
        InitHeap :: (this: *Allocation, list: *CommittedAllocationList, heap: *ID3D12Heap) -> void #cpp_method #foreign d3d12ma "?InitHeap@Allocation@D3D12MA@@AEAAXPEAVCommittedAllocationList@2@PEAUID3D12Heap@@@Z";
        SwapBlockAllocation :: (this: *Allocation, allocation: *Allocation) -> void #cpp_method #foreign d3d12ma "?SwapBlockAllocation@Allocation@D3D12MA@@AEAAXPEAV12@@Z";

        // If the Allocation represents committed resource with implicit heap, returns UINT64_MAX.
        GetAllocHandle :: (this: *Allocation) -> AllocHandle #cpp_method #foreign d3d12ma "?GetAllocHandle@Allocation@D3D12MA@@AEBA_KXZ";
        GetBlock :: (this: *Allocation) -> *NormalBlock #cpp_method #foreign d3d12ma "?GetBlock@Allocation@D3D12MA@@AEAAPEAVNormalBlock@2@XZ";

        FreeName :: (this: *Allocation) -> void #cpp_method #foreign d3d12ma "?FreeName@Allocation@D3D12MA@@AEAAXXZ";

        // Virtual functions:
        // Normally you should call them via the vtable.
        // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
        // or need to create a vtable yourself.

        virtual_ReleaseThis :: (this: *Allocation) -> void #cpp_method #foreign d3d12ma "?ReleaseThis@Allocation@D3D12MA@@MEAAXXZ";

        //  Nothing here, everything already done in Release.
        virtual_Destructor :: (this: *Allocation, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign d3d12ma "??1Allocation@D3D12MA@@EEAA@XZ";
    }

    /// Flags to be passed as DEFRAGMENTATION_DESC::Flags.
    DEFRAGMENTATION_FLAGS :: enum s32 {
        FAST     :: 1;

        BALANCED :: 2;

        FULL     :: 4;

        MASK     :: 7;

        DEFRAGMENTATION_FLAG_ALGORITHM_FAST     :: FAST;

        DEFRAGMENTATION_FLAG_ALGORITHM_BALANCED :: BALANCED;

        DEFRAGMENTATION_FLAG_ALGORITHM_FULL     :: FULL;

        DEFRAGMENTATION_FLAG_ALGORITHM_MASK     :: MASK;
    }

    /** \brief Parameters for defragmentation.
    
    To be used with functions Allocator::BeginDefragmentation() and Pool::BeginDefragmentation().
    */
    DEFRAGMENTATION_DESC :: struct {
        /// Flags.
        Flags:                 DEFRAGMENTATION_FLAGS;

        /** \brief Maximum numbers of bytes that can be copied during single pass, while moving allocations to different places.
        
        0 means no limit.
        */
        MaxBytesPerPass:       u64;

        /** \brief Maximum number of allocations that can be moved during single pass to a different place.
        
        0 means no limit.
        */
        MaxAllocationsPerPass: u32;
    }

    /// Operation performed on single defragmentation move.
    DEFRAGMENTATION_MOVE_OPERATION :: enum s32 {
        COPY    :: 0;

        IGNORE  :: 1;

        DESTROY :: 2;

        DEFRAGMENTATION_MOVE_OPERATION_COPY    :: COPY;

        DEFRAGMENTATION_MOVE_OPERATION_IGNORE  :: IGNORE;

        DEFRAGMENTATION_MOVE_OPERATION_DESTROY :: DESTROY;
    }

    /// Single move of an allocation to be done for defragmentation.
    DEFRAGMENTATION_MOVE :: struct {
        /** \brief Operation to be performed on the allocation by DefragmentationContext::EndPass().
        Default value is #DEFRAGMENTATION_MOVE_OPERATION_COPY. You can modify it.
        */
        Operation:         DEFRAGMENTATION_MOVE_OPERATION;

        /// %Allocation that should be moved.
        pSrcAllocation:    *Allocation;

        /** \brief Temporary allocation pointing to destination memory that will replace `pSrcAllocation`.
        
        Use it to retrieve new `ID3D12Heap` and offset to create new `ID3D12Resource` and then store it here via Allocation::SetResource().
        
        \warning Do not store this allocation in your data structures! It exists only temporarily, for the duration of the defragmentation pass,
        to be used for storing newly created resource. DefragmentationContext::EndPass() will destroy it and make `pSrcAllocation` point to this memory.
        */
        pDstTmpAllocation: *Allocation;
    }

    /** \brief Parameters for incremental defragmentation steps.
    
    To be used with function DefragmentationContext::BeginPass().
    */
    DEFRAGMENTATION_PASS_MOVE_INFO :: struct {
        /// Number of elements in the `pMoves` array.
        MoveCount: u32;

        /** \brief Array of moves to be performed by the user in the current defragmentation pass.
        
        Pointer to an array of `MoveCount` elements, owned by %D3D12MA, created in DefragmentationContext::BeginPass(), destroyed in DefragmentationContext::EndPass().
        
        For each element, you should:
        
        1. Create a new resource in the place pointed by `pMoves[i].pDstTmpAllocation->GetHeap()` + `pMoves[i].pDstTmpAllocation->GetOffset()`.
        2. Store new resource in `pMoves[i].pDstTmpAllocation` by using Allocation::SetResource(). It will later replace old resource from `pMoves[i].pSrcAllocation`.
        3. Copy data from the `pMoves[i].pSrcAllocation` e.g. using `D3D12GraphicsCommandList::CopyResource`.
        4. Make sure these commands finished executing on the GPU.
        
        Only then you can finish defragmentation pass by calling DefragmentationContext::EndPass().
        After this call, the allocation will point to the new place in memory.
        
        Alternatively, if you cannot move specific allocation,
        you can set DEFRAGMENTATION_MOVE::Operation to D3D12MA::DEFRAGMENTATION_MOVE_OPERATION_IGNORE.
        
        Alternatively, if you decide you want to completely remove the allocation,
        set DEFRAGMENTATION_MOVE::Operation to D3D12MA::DEFRAGMENTATION_MOVE_OPERATION_DESTROY.
        Then, after DefragmentationContext::EndPass() the allocation will be released.
        */
        pMoves:    *DEFRAGMENTATION_MOVE;
    }

    /// %Statistics returned for defragmentation process by function DefragmentationContext::GetStats().
    DEFRAGMENTATION_STATS :: struct {
        /// Total number of bytes that have been copied while moving allocations to different places.
        BytesMoved:       u64;

        /// Total number of bytes that have been released to the system by freeing empty heaps.
        BytesFreed:       u64;

        /// Number of allocations that have been moved to different places.
        AllocationsMoved: u32;

        /// Number of empty `ID3D12Heap` objects that have been released to the system.
        HeapsFreed:       u32;
    }

    /** \brief Represents defragmentation process in progress.
    
    You can create this object using Allocator::BeginDefragmentation (for default pools) or
    Pool::BeginDefragmentation (for a custom pool).
    */
    DefragmentationContext :: struct {
        #as using iunknownimpl: IUnknownImpl;

        /** \brief Starts single defragmentation pass.
        
        \param[out] pPassInfo Computed informations for current pass.
        \returns
        - `S_OK` if no more moves are possible. Then you can omit call to DefragmentationContext::EndPass() and simply end whole defragmentation.
        - `S_FALSE` if there are pending moves returned in `pPassInfo`. You need to perform them, call DefragmentationContext::EndPass(),
        and then preferably try another pass with DefragmentationContext::BeginPass().
        */
        BeginPass :: (this: *DefragmentationContext, pPassInfo: *DEFRAGMENTATION_PASS_MOVE_INFO) -> HRESULT #cpp_method #foreign d3d12ma "?BeginPass@DefragmentationContext@D3D12MA@@QEAAJPEAUDEFRAGMENTATION_PASS_MOVE_INFO@2@@Z";

        /** \brief Ends single defragmentation pass.
        
        \param pPassInfo Computed informations for current pass filled by DefragmentationContext::BeginPass() and possibly modified by you.
        \return Returns `S_OK` if no more moves are possible or `S_FALSE` if more defragmentations are possible.
        
        Ends incremental defragmentation pass and commits all defragmentation moves from `pPassInfo`.
        After this call:
        
        - %Allocation at `pPassInfo[i].pSrcAllocation` that had `pPassInfo[i].Operation ==` #DEFRAGMENTATION_MOVE_OPERATION_COPY
        (which is the default) will be pointing to the new destination place.
        - %Allocation at `pPassInfo[i].pSrcAllocation` that had `pPassInfo[i].operation ==` #DEFRAGMENTATION_MOVE_OPERATION_DESTROY
        will be released.
        
        If no more moves are possible you can end whole defragmentation.
        */
        EndPass :: (this: *DefragmentationContext, pPassInfo: *DEFRAGMENTATION_PASS_MOVE_INFO) -> HRESULT #cpp_method #foreign d3d12ma "?EndPass@DefragmentationContext@D3D12MA@@QEAAJPEAUDEFRAGMENTATION_PASS_MOVE_INFO@2@@Z";

        /** \brief Returns statistics of the defragmentation performed so far.
        */
        GetStats :: (this: *DefragmentationContext, pStats: *DEFRAGMENTATION_STATS) -> void #cpp_method #foreign d3d12ma "?GetStats@DefragmentationContext@D3D12MA@@QEAAXPEAUDEFRAGMENTATION_STATS@2@@Z";

        m_Pimpl:                *DefragmentationContextPimpl;

        Constructor :: (this: *DefragmentationContext, allocator: *AllocatorPimpl, desc: *DEFRAGMENTATION_DESC, poolVector: *BlockVector) -> void #cpp_method #foreign d3d12ma "??0DefragmentationContext@D3D12MA@@AEAA@PEAVAllocatorPimpl@1@AEBUDEFRAGMENTATION_DESC@1@PEAVBlockVector@1@@Z";
        Constructor :: (this: *DefragmentationContext, allocator: *AllocatorPimpl, desc: DEFRAGMENTATION_DESC, poolVector: *BlockVector) #no_context {
            Constructor(this, allocator, *desc, poolVector);
        }

        // Virtual functions:
        // Normally you should call them via the vtable.
        // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
        // or need to create a vtable yourself.

        virtual_ReleaseThis :: (this: *DefragmentationContext) -> void #cpp_method #foreign d3d12ma "?ReleaseThis@DefragmentationContext@D3D12MA@@MEAAXXZ";

        virtual_Destructor :: (this: *DefragmentationContext, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign d3d12ma "??1DefragmentationContext@D3D12MA@@EEAA@XZ";
    }

    /// \brief Bit flags to be used with POOL_DESC::Flags.
    POOL_FLAGS :: enum s32 {
        NONE                           :: 0;

        ALGORITHM_LINEAR               :: 1;

        MSAA_TEXTURES_ALWAYS_COMMITTED :: 2;

        ALWAYS_COMMITTED               :: 4;

        DONT_USE_TIGHT_ALIGNMENT       :: 8;

        ALGORITHM_MASK                 :: 1;

        POOL_FLAG_NONE                           :: NONE;

        POOL_FLAG_ALGORITHM_LINEAR               :: ALGORITHM_LINEAR;

        POOL_FLAG_MSAA_TEXTURES_ALWAYS_COMMITTED :: MSAA_TEXTURES_ALWAYS_COMMITTED;

        POOL_FLAG_ALWAYS_COMMITTED               :: ALWAYS_COMMITTED;

        POOL_FLAG_DONT_USE_TIGHT_ALIGNMENT       :: DONT_USE_TIGHT_ALIGNMENT;

        POOL_FLAG_ALGORITHM_MASK                 :: ALGORITHM_MASK;
    }

    /// \brief Parameters of created D3D12MA::Pool object. To be used with D3D12MA::Allocator::CreatePool.
    POOL_DESC :: struct {
        /** \brief Flags for the heap.
        
        It is recommended to use #D3D12MA_RECOMMENDED_HEAP_FLAGS.
        */
        Flags:                  POOL_FLAGS;

        /** \brief The parameters of memory heap where allocations of this pool should be placed.
        
        In the simplest case, just fill it with zeros and set `Type` to one of: `D3D12_HEAP_TYPE_DEFAULT`,
        `D3D12_HEAP_TYPE_UPLOAD`, `D3D12_HEAP_TYPE_READBACK`. Additional parameters can be used e.g. to utilize UMA.
        */
        HeapProperties:         D3D12_HEAP_PROPERTIES;

        /** \brief Heap flags to be used when allocating heaps of this pool.
        
        It should contain one of these values, depending on type of resources you are going to create in this heap:
        `D3D12_HEAP_FLAG_ALLOW_ONLY_BUFFERS`,
        `D3D12_HEAP_FLAG_ALLOW_ONLY_NON_RT_DS_TEXTURES`,
        `D3D12_HEAP_FLAG_ALLOW_ONLY_RT_DS_TEXTURES`.
        Except if ResourceHeapTier = 2, then it may be `D3D12_HEAP_FLAG_ALLOW_ALL_BUFFERS_AND_TEXTURES` = 0.
        
        It is recommended to also add #D3D12MA_RECOMMENDED_POOL_FLAGS.
        You can specify additional flags if needed.
        */
        HeapFlags:              D3D12_HEAP_FLAGS;

        /** \brief Size of a single heap (memory block) to be allocated as part of this pool, in bytes. Optional.
        
        Specify nonzero to set explicit, constant size of memory blocks used by this pool.
        Leave 0 to use default and let the library manage block sizes automatically.
        Then sizes of particular blocks may vary.
        
        You will be able to create committed resources out of this custom pool only when you set this member to 0.
        */
        BlockSize:              u64;

        /** \brief Minimum number of heaps (memory blocks) to be always allocated in this pool, even if they stay empty. Optional.
        
        Set to 0 to have no preallocated blocks and allow the pool be completely empty.
        */
        MinBlockCount:          u32;

        /** \brief Maximum number of heaps (memory blocks) that can be allocated in this pool. Optional.
        
        Set to 0 to use default, which is `UINT64_MAX`, which means no limit.
        
        Set to same value as D3D12MA::POOL_DESC::MinBlockCount to have fixed amount of memory allocated
        throughout whole lifetime of this pool.
        */
        MaxBlockCount:          u32;

        /** \brief Additional minimum alignment to be used for all allocations created from this pool. Can be 0.
        
        Leave 0 (default) not to impose any additional alignment. If not 0, it must be a power of two.
        */
        MinAllocationAlignment: u64;

        /** \brief Additional parameter allowing pool to create resources with passed protected session.
        
        If not null then all the heaps and committed resources will be created with this parameter.
        Valid only if ID3D12Device4 interface is present in current Windows SDK!
        */
        pProtectedSession:      *ID3D12ProtectedResourceSession;

        /** \brief Residency priority to be set for all allocations made in this pool. Optional.
        
        Set this parameter to one of the possible enum values e.g. `D3D12_RESIDENCY_PRIORITY_HIGH`
        to apply specific residency priority to all allocations made in this pool:
        `ID3D12Heap` memory blocks used to sub-allocate for placed resources, as well as
        committed resources or heaps created when D3D12MA::ALLOCATION_FLAG_COMMITTED is used.
        This can increase/decrease chance that the memory will be pushed out from VRAM
        to system RAM when the system runs out of memory, which is invisible to the developer
        using D3D12 API while it can degrade performance.
        
        Priority is set using function `ID3D12Device1::SetResidencyPriority`.
        It is performed only when `ID3D12Device1` interface is defined and successfully obtained.
        Otherwise, this parameter is ignored.
        
        This parameter is optional. If you set it to `D3D12_RESIDENCY_PRIORITY(0)`,
        residency priority will not be set for allocations made in this pool.
        
        There is no equivalent parameter for allocations made in default pools.
        If you want to set residency priority for such allocation, you need to do it manually:
        allocate with D3D12MA::ALLOCATION_FLAG_COMMITTED and call
        `ID3D12Device1::SetResidencyPriority`, passing `allocation->GetResource()`.
        */
        ResidencyPriority:      D3D12_RESIDENCY_PRIORITY;
    }

    /// \endcond
    Pool :: struct {
        #as using iunknownimpl: IUnknownImpl;

        /** \brief Returns copy of parameters of the pool.
        
        These are the same parameters as passed to D3D12MA::Allocator::CreatePool.
        */
        GetDesc :: (this: *Pool) -> POOL_DESC #cpp_method #foreign d3d12ma "?GetDesc@Pool@D3D12MA@@QEBA?AUPOOL_DESC@2@XZ";

        /** \brief Retrieves basic statistics of the custom pool that are fast to calculate.
        
        \param[out] pStats %Statistics of the current pool.
        */
        GetStatistics :: (this: *Pool, pStats: *Statistics) -> void #cpp_method #foreign d3d12ma "?GetStatistics@Pool@D3D12MA@@QEAAXPEAUStatistics@2@@Z";

        /** \brief Retrieves detailed statistics of the custom pool that are slower to calculate.
        
        \param[out] pStats %Statistics of the current pool.
        */
        CalculateStatistics :: (this: *Pool, pStats: *DetailedStatistics) -> void #cpp_method #foreign d3d12ma "?CalculateStatistics@Pool@D3D12MA@@QEAAXPEAUDetailedStatistics@2@@Z";

        /** \brief Associates a name with the pool. This name is for use in debug diagnostics and tools.
        
        Internal copy of the string is made, so the memory pointed by the argument can be
        changed of freed immediately after this call.
        
        `Name` can be NULL.
        */
        SetName :: (this: *Pool, Name: *s16) -> void #cpp_method #foreign d3d12ma "?SetName@Pool@D3D12MA@@QEAAXPEB_W@Z";

        /** \brief Returns the name associated with the pool object.
        
        Returned string points to an internal copy.
        
        If no name was associated with the allocation, returns NULL.
        */
        GetName :: (this: *Pool) -> *s16 #cpp_method #foreign d3d12ma "?GetName@Pool@D3D12MA@@QEBAPEB_WXZ";

        /** \brief Begins defragmentation process of the current pool.
        
        \param pDesc Structure filled with parameters of defragmentation.
        \param[out] ppContext Context object that will manage defragmentation.
        \returns
        - `S_OK` if defragmentation can begin.
        - `E_NOINTERFACE` if defragmentation is not supported.
        
        For more information about defragmentation, see documentation chapter:
        [Defragmentation](@ref defragmentation).
        */
        BeginDefragmentation :: (this: *Pool, pDesc: *DEFRAGMENTATION_DESC, ppContext: **DefragmentationContext) -> HRESULT #cpp_method #foreign d3d12ma "?BeginDefragmentation@Pool@D3D12MA@@QEAAJPEBUDEFRAGMENTATION_DESC@2@PEAPEAVDefragmentationContext@2@@Z";

        m_Pimpl:                *PoolPimpl;

        Constructor :: (this: *Pool, allocator: *Allocator, desc: *POOL_DESC) -> void #cpp_method #foreign d3d12ma "??0Pool@D3D12MA@@AEAA@PEAVAllocator@1@AEBUPOOL_DESC@1@@Z";
        Constructor :: (this: *Pool, allocator: *Allocator, desc: POOL_DESC) #no_context {
            Constructor(this, allocator, *desc);
        }

        // Virtual functions:
        // Normally you should call them via the vtable.
        // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
        // or need to create a vtable yourself.

        virtual_ReleaseThis :: (this: *Pool) -> void #cpp_method #foreign d3d12ma "?ReleaseThis@Pool@D3D12MA@@MEAAXXZ";

        virtual_Destructor :: (this: *Pool, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign d3d12ma "??1Pool@D3D12MA@@EEAA@XZ";
    }

    /// \brief Bit flags to be used with ALLOCATOR_DESC::Flags.
    ALLOCATOR_FLAGS :: enum s32 {
        NONE                                :: 0;

        SINGLETHREADED                      :: 1;

        ALWAYS_COMMITTED                    :: 2;

        DEFAULT_POOLS_NOT_ZEROED            :: 4;

        MSAA_TEXTURES_ALWAYS_COMMITTED      :: 8;

        DONT_PREFER_SMALL_BUFFERS_COMMITTED :: 16;

        DONT_USE_TIGHT_ALIGNMENT            :: 32;

        ALLOCATOR_FLAG_NONE                                :: NONE;

        ALLOCATOR_FLAG_SINGLETHREADED                      :: SINGLETHREADED;

        ALLOCATOR_FLAG_ALWAYS_COMMITTED                    :: ALWAYS_COMMITTED;

        ALLOCATOR_FLAG_DEFAULT_POOLS_NOT_ZEROED            :: DEFAULT_POOLS_NOT_ZEROED;

        ALLOCATOR_FLAG_MSAA_TEXTURES_ALWAYS_COMMITTED      :: MSAA_TEXTURES_ALWAYS_COMMITTED;

        ALLOCATOR_FLAG_DONT_PREFER_SMALL_BUFFERS_COMMITTED :: DONT_PREFER_SMALL_BUFFERS_COMMITTED;

        ALLOCATOR_FLAG_DONT_USE_TIGHT_ALIGNMENT            :: DONT_USE_TIGHT_ALIGNMENT;
    }

    /// \brief Parameters of created Allocator object. To be used with CreateAllocator().
    ALLOCATOR_DESC :: struct {
        /** \brief Flags for the entire allocator.
        
        It is recommended to use #D3D12MA_RECOMMENDED_ALLOCATOR_FLAGS.
        */
        Flags:                ALLOCATOR_FLAGS;

        /** Direct3D device object that the allocator should be attached to.
        
        Allocator is doing `AddRef`/`Release` on this object.
        */
        pDevice:              *ID3D12Device;

        /** \brief Preferred size of a single `ID3D12Heap` block to be allocated.
        
        Set to 0 to use default, which is currently 64 MiB.
        */
        PreferredBlockSize:   u64;

        /** \brief Custom CPU memory allocation callbacks. Optional.
        
        Optional, can be null. When specified, will be used for all CPU-side memory allocations.
        */
        pAllocationCallbacks: *ALLOCATION_CALLBACKS;

        /** DXGI Adapter object that you use for D3D12 and this allocator.
        
        Allocator is doing `AddRef`/`Release` on this object.
        */
        pAdapter:             *IDXGIAdapter;
    }

    /**
    \brief Represents main object of this library initialized for particular `ID3D12Device`.
    
    Fill structure D3D12MA::ALLOCATOR_DESC and call function CreateAllocator() to create it.
    Call method `Release()` to destroy it.
    
    It is recommended to create just one object of this type per `ID3D12Device` object,
    right after Direct3D 12 is initialized and keep it alive until before Direct3D device is destroyed.
    */
    Allocator :: struct {
        #as using iunknownimpl: IUnknownImpl;

        /// Returns cached options retrieved from D3D12 device.
        GetD3D12Options :: (this: *Allocator) -> *D3D12_FEATURE_DATA_D3D12_OPTIONS #cpp_method #foreign d3d12ma "?GetD3D12Options@Allocator@D3D12MA@@QEBAAEBUD3D12_FEATURE_DATA_D3D12_OPTIONS@@XZ";

        /** \brief Returns true if `D3D12_FEATURE_DATA_ARCHITECTURE1::UMA` was found to be true.
        
        For more information about how to use it, see articles in Microsoft Docs articles:
        
        - "UMA Optimizations: CPU Accessible Textures and Standard Swizzle"
        - "D3D12_FEATURE_DATA_ARCHITECTURE structure (d3d12.h)"
        - "ID3D12Device::GetCustomHeapProperties method (d3d12.h)"
        */
        IsUMA :: (this: *Allocator) -> BOOL #cpp_method #foreign d3d12ma "?IsUMA@Allocator@D3D12MA@@QEBAHXZ";

        /** \brief Returns true if `D3D12_FEATURE_DATA_ARCHITECTURE1::CacheCoherentUMA` was found to be true.
        
        For more information about how to use it, see articles in Microsoft Docs articles:
        
        - "UMA Optimizations: CPU Accessible Textures and Standard Swizzle"
        - "D3D12_FEATURE_DATA_ARCHITECTURE structure (d3d12.h)"
        - "ID3D12Device::GetCustomHeapProperties method (d3d12.h)"
        */
        IsCacheCoherentUMA :: (this: *Allocator) -> BOOL #cpp_method #foreign d3d12ma "?IsCacheCoherentUMA@Allocator@D3D12MA@@QEBAHXZ";

        /** \brief Returns true if GPU Upload Heaps are supported on the current system.
        
        When true, you can use `D3D12_HEAP_TYPE_GPU_UPLOAD`.
        
        This flag is fetched from `D3D12_FEATURE_D3D12_OPTIONS16::GPUUploadHeapSupported`.
        */
        IsGPUUploadHeapSupported :: (this: *Allocator) -> BOOL #cpp_method #foreign d3d12ma "?IsGPUUploadHeapSupported@Allocator@D3D12MA@@QEBAHXZ";

        /** \brief Returns true if resource tight alignment is supported on the current system.
        When supported, it is automatically used by the library, unless
        #ALLOCATOR_FLAG_DONT_USE_TIGHT_ALIGNMENT flag was specified on allocator creation.
        This flag is fetched from `D3D12_FEATURE_DATA_TIGHT_ALIGNMENT::SupportTier`.
        */
        IsTightAlignmentSupported :: (this: *Allocator) -> BOOL #cpp_method #foreign d3d12ma "?IsTightAlignmentSupported@Allocator@D3D12MA@@QEBAHXZ";

        /** \brief Returns total amount of memory of specific segment group, in bytes.
        
        \param memorySegmentGroup use `DXGI_MEMORY_SEGMENT_GROUP_LOCAL` or `DXGI_MEMORY_SEGMENT_GROUP_NON_LOCAL`.
        
        This information is taken from `DXGI_ADAPTER_DESC`.
        It is not recommended to use this number.
        You should preferably call GetBudget() and limit memory usage to D3D12MA::Budget::BudgetBytes instead.
        
        - When IsUMA() `== FALSE` (discrete graphics card):
        - `GetMemoryCapacity(DXGI_MEMORY_SEGMENT_GROUP_LOCAL)` returns the size of the video memory.
        - `GetMemoryCapacity(DXGI_MEMORY_SEGMENT_GROUP_NON_LOCAL)` returns the size of the system memory available for D3D12 resources.
        - When IsUMA() `== TRUE` (integrated graphics chip):
        - `GetMemoryCapacity(DXGI_MEMORY_SEGMENT_GROUP_LOCAL)` returns the size of the shared memory available for all D3D12 resources.
        All memory is considered "local".
        - `GetMemoryCapacity(DXGI_MEMORY_SEGMENT_GROUP_NON_LOCAL)` is not applicable and returns 0.
        */
        GetMemoryCapacity :: (this: *Allocator, memorySegmentGroup: u32) -> u64 #cpp_method #foreign d3d12ma "?GetMemoryCapacity@Allocator@D3D12MA@@QEBA_KI@Z";

        /** \brief Allocates memory and creates a D3D12 resource (buffer or texture). This is the main allocation function.
        
        The function is similar to `ID3D12Device::CreateCommittedResource`, but it may
        really call `ID3D12Device::CreatePlacedResource` to assign part of a larger,
        existing memory heap to the new resource, which is the main purpose of this
        whole library.
        
        If `ppvResource` is null, you receive only `ppAllocation` object from this function.
        It holds pointer to `ID3D12Resource` that can be queried using function D3D12MA::Allocation::GetResource().
        Reference count of the resource object is 1.
        It is automatically destroyed when you destroy the allocation object.
        
        If `ppvResource` is not null, you receive pointer to the resource next to allocation object.
        Reference count of the resource object is then increased by calling `QueryInterface`, so you need to manually `Release` it
        along with the allocation.
        
        \param pAllocDesc   Parameters of the allocation.
        \param pResourceDesc   Description of created resource.
        \param InitialResourceState   Initial resource state.
        \param pOptimizedClearValue   Optional. Either null or optimized clear value.
        \param[out] ppAllocation   Filled with pointer to new allocation object created.
        \param riidResource   IID of a resource to be returned via `ppvResource`.
        \param[out] ppvResource   Optional. If not null, filled with pointer to new resouce created.
        
        \note This function creates a new resource. Sub-allocation of parts of one large buffer,
        although recommended as a good practice, is out of scope of this library and could be implemented
        by the user as a higher-level logic on top of it, e.g. using the \ref virtual_allocator feature.
        */
        CreateResource :: (this: *Allocator, pAllocDesc: *ALLOCATION_DESC, pResourceDesc: *D3D12_RESOURCE_DESC, InitialResourceState: D3D12_RESOURCE_STATES, pOptimizedClearValue: *D3D12_CLEAR_VALUE, ppAllocation: **Allocation, riidResource: *IID, ppvResource: **void) -> HRESULT #cpp_method #foreign d3d12ma "?CreateResource@Allocator@D3D12MA@@QEAAJPEBUALLOCATION_DESC@2@PEBUD3D12_RESOURCE_DESC@@W4D3D12_RESOURCE_STATES@@PEBUD3D12_CLEAR_VALUE@@PEAPEAVAllocation@2@AEBU_GUID@@PEAPEAX@Z";
        CreateResource :: (this: *Allocator, pAllocDesc: *ALLOCATION_DESC, pResourceDesc: *D3D12_RESOURCE_DESC, InitialResourceState: D3D12_RESOURCE_STATES, pOptimizedClearValue: *D3D12_CLEAR_VALUE, ppAllocation: **Allocation, riidResource: IID, ppvResource: **void) -> HRESULT #no_context {
            return CreateResource(this, pAllocDesc, pResourceDesc, InitialResourceState, pOptimizedClearValue, ppAllocation, *riidResource, ppvResource);
        }

        /** \brief Similar to Allocator::CreateResource, but supports new structure `D3D12_RESOURCE_DESC1`.
        
        It internally uses `ID3D12Device8::CreateCommittedResource2` or `ID3D12Device8::CreatePlacedResource1`.
        
        To work correctly, `ID3D12Device8` interface must be available in the current system. Otherwise, `E_NOINTERFACE` is returned.
        */
        CreateResource2 :: (this: *Allocator, pAllocDesc: *ALLOCATION_DESC, pResourceDesc: *D3D12_RESOURCE_DESC1, InitialResourceState: D3D12_RESOURCE_STATES, pOptimizedClearValue: *D3D12_CLEAR_VALUE, ppAllocation: **Allocation, riidResource: *IID, ppvResource: **void) -> HRESULT #cpp_method #foreign d3d12ma "?CreateResource2@Allocator@D3D12MA@@QEAAJPEBUALLOCATION_DESC@2@PEBUD3D12_RESOURCE_DESC1@@W4D3D12_RESOURCE_STATES@@PEBUD3D12_CLEAR_VALUE@@PEAPEAVAllocation@2@AEBU_GUID@@PEAPEAX@Z";
        CreateResource2 :: (this: *Allocator, pAllocDesc: *ALLOCATION_DESC, pResourceDesc: *D3D12_RESOURCE_DESC1, InitialResourceState: D3D12_RESOURCE_STATES, pOptimizedClearValue: *D3D12_CLEAR_VALUE, ppAllocation: **Allocation, riidResource: IID, ppvResource: **void) -> HRESULT #no_context {
            return CreateResource2(this, pAllocDesc, pResourceDesc, InitialResourceState, pOptimizedClearValue, ppAllocation, *riidResource, ppvResource);
        }

        /** \brief Similar to Allocator::CreateResource2, but there are initial layout instead of state and
        castable formats list
        
        It internally uses `ID3D12Device10::CreateCommittedResource3` or `ID3D12Device10::CreatePlacedResource2`.
        
        To work correctly, `ID3D12Device10` interface must be available in the current system. Otherwise, `E_NOINTERFACE` is returned.
        If you use `pCastableFormats`, `ID3D12Device12` must albo be available.
        */
        CreateResource3 :: (this: *Allocator, pAllocDesc: *ALLOCATION_DESC, pResourceDesc: *D3D12_RESOURCE_DESC1, InitialLayout: D3D12_BARRIER_LAYOUT, pOptimizedClearValue: *D3D12_CLEAR_VALUE, NumCastableFormats: u32, pCastableFormats: *DXGI_FORMAT, ppAllocation: **Allocation, riidResource: *IID, ppvResource: **void) -> HRESULT #cpp_method #foreign d3d12ma "?CreateResource3@Allocator@D3D12MA@@QEAAJPEBUALLOCATION_DESC@2@PEBUD3D12_RESOURCE_DESC1@@W4D3D12_BARRIER_LAYOUT@@PEBUD3D12_CLEAR_VALUE@@IPEBW4DXGI_FORMAT@@PEAPEAVAllocation@2@AEBU_GUID@@PEAPEAX@Z";
        CreateResource3 :: (this: *Allocator, pAllocDesc: *ALLOCATION_DESC, pResourceDesc: *D3D12_RESOURCE_DESC1, InitialLayout: D3D12_BARRIER_LAYOUT, pOptimizedClearValue: *D3D12_CLEAR_VALUE, NumCastableFormats: u32, pCastableFormats: *DXGI_FORMAT, ppAllocation: **Allocation, riidResource: IID, ppvResource: **void) -> HRESULT #no_context {
            return CreateResource3(this, pAllocDesc, pResourceDesc, InitialLayout, pOptimizedClearValue, NumCastableFormats, pCastableFormats, ppAllocation, *riidResource, ppvResource);
        }

        /** \brief Allocates memory without creating any resource placed in it.
        
        This function is similar to `ID3D12Device::CreateHeap`, but it may really assign
        part of a larger, existing heap to the allocation.
        
        `pAllocDesc->ExtraHeapFlags` should contain one of these values, depending on type of resources you are going to create in this memory:
        `D3D12_HEAP_FLAG_ALLOW_ONLY_BUFFERS`,
        `D3D12_HEAP_FLAG_ALLOW_ONLY_NON_RT_DS_TEXTURES`,
        `D3D12_HEAP_FLAG_ALLOW_ONLY_RT_DS_TEXTURES`.
        Except if you validate that ResourceHeapTier = 2 - then `heapFlags`
        may be `D3D12_HEAP_FLAG_ALLOW_ALL_BUFFERS_AND_TEXTURES` = 0.
        Additional flags in `heapFlags` are allowed as well.
        
        `pAllocInfo->SizeInBytes` must cover the resources to be placed within the allocation, including any padding
        required between them. Use `ID3D12Device::GetResourceAllocationInfo` to determine their
        required sizes and alignments. Allocation sizes smaller than 64 KB are accepted.
        
        `pAllocInfo->Alignment` must be a non-zero power of two specifying the required alignment
        of the allocation's offset within the heap. Smaller resource alignments are accepted,
        such as 4 KB for small textures or 256 B for tight-alignment buffers.
        When a separate heap is created, its alignment is calculated independently:
        64 KB for buffer-only heaps or 4 MB when textures are permitted.
        
        If you use D3D12MA::ALLOCATION_FLAG_COMMITTED you will get a separate memory block -
        a heap that always has offset 0.
        
        */
        AllocateMemory :: (this: *Allocator, pAllocDesc: *ALLOCATION_DESC, pAllocInfo: *D3D12_RESOURCE_ALLOCATION_INFO, ppAllocation: **Allocation) -> HRESULT #cpp_method #foreign d3d12ma "?AllocateMemory@Allocator@D3D12MA@@QEAAJPEBUALLOCATION_DESC@2@PEBUD3D12_RESOURCE_ALLOCATION_INFO@@PEAPEAVAllocation@2@@Z";

        /** \brief Creates a new resource in place of an existing allocation. This is useful for memory aliasing.
        
        \param pAllocation Existing allocation indicating the memory where the new resource should be created.
        It can be created using D3D12MA::Allocator::CreateResource and already have a resource bound to it,
        or can be a raw memory allocated with D3D12MA::Allocator::AllocateMemory.
        It must not be created as committed so that `ID3D12Heap` is available and not implicit.
        \param AllocationLocalOffset Additional offset in bytes to be applied when allocating the resource.
        Local from the start of `pAllocation`, not the beginning of the whole `ID3D12Heap`!
        If the new resource should start from the beginning of the `pAllocation` it should be 0.
        \param pResourceDesc Description of the new resource to be created.
        \param InitialResourceState
        \param pOptimizedClearValue
        \param riidResource
        \param[out] ppvResource Returns pointer to the new resource.
        The resource is not bound with `pAllocation`.
        This pointer must not be null - you must get the resource pointer and `Release` it when no longer needed.
        
        Memory requirements of the new resource are checked for validation.
        If its size exceeds the end of `pAllocation` or required alignment is not fulfilled
        considering `pAllocation->GetOffset() + AllocationLocalOffset`, the function
        returns `E_INVALIDARG`.
        */
        CreateAliasingResource :: (this: *Allocator, pAllocation: *Allocation, AllocationLocalOffset: u64, pResourceDesc: *D3D12_RESOURCE_DESC, InitialResourceState: D3D12_RESOURCE_STATES, pOptimizedClearValue: *D3D12_CLEAR_VALUE, riidResource: *IID, ppvResource: **void) -> HRESULT #cpp_method #foreign d3d12ma "?CreateAliasingResource@Allocator@D3D12MA@@QEAAJPEAVAllocation@2@_KPEBUD3D12_RESOURCE_DESC@@W4D3D12_RESOURCE_STATES@@PEBUD3D12_CLEAR_VALUE@@AEBU_GUID@@PEAPEAX@Z";
        CreateAliasingResource :: (this: *Allocator, pAllocation: *Allocation, AllocationLocalOffset: u64, pResourceDesc: *D3D12_RESOURCE_DESC, InitialResourceState: D3D12_RESOURCE_STATES, pOptimizedClearValue: *D3D12_CLEAR_VALUE, riidResource: IID, ppvResource: **void) -> HRESULT #no_context {
            return CreateAliasingResource(this, pAllocation, AllocationLocalOffset, pResourceDesc, InitialResourceState, pOptimizedClearValue, *riidResource, ppvResource);
        }

        /** \brief Similar to Allocator::CreateAliasingResource, but supports new structure `D3D12_RESOURCE_DESC1`.
        
        It internally uses `ID3D12Device8::CreatePlacedResource1`.
        
        To work correctly, `ID3D12Device8` interface must be available in the current system. Otherwise, `E_NOINTERFACE` is returned.
        */
        CreateAliasingResource1 :: (this: *Allocator, pAllocation: *Allocation, AllocationLocalOffset: u64, pResourceDesc: *D3D12_RESOURCE_DESC1, InitialResourceState: D3D12_RESOURCE_STATES, pOptimizedClearValue: *D3D12_CLEAR_VALUE, riidResource: *IID, ppvResource: **void) -> HRESULT #cpp_method #foreign d3d12ma "?CreateAliasingResource1@Allocator@D3D12MA@@QEAAJPEAVAllocation@2@_KPEBUD3D12_RESOURCE_DESC1@@W4D3D12_RESOURCE_STATES@@PEBUD3D12_CLEAR_VALUE@@AEBU_GUID@@PEAPEAX@Z";
        CreateAliasingResource1 :: (this: *Allocator, pAllocation: *Allocation, AllocationLocalOffset: u64, pResourceDesc: *D3D12_RESOURCE_DESC1, InitialResourceState: D3D12_RESOURCE_STATES, pOptimizedClearValue: *D3D12_CLEAR_VALUE, riidResource: IID, ppvResource: **void) -> HRESULT #no_context {
            return CreateAliasingResource1(this, pAllocation, AllocationLocalOffset, pResourceDesc, InitialResourceState, pOptimizedClearValue, *riidResource, ppvResource);
        }

        /** \brief Similar to Allocator::CreateAliasingResource1, but there are initial layout instead of state and
        castable formats list.
        
        It internally uses `ID3D12Device10::CreatePlacedResource2`.
        
        To work correctly, `ID3D12Device10` interface must be available in the current system. Otherwise, `E_NOINTERFACE` is returned.
        If you use `pCastableFormats`, `ID3D12Device12` must albo be available.
        */
        CreateAliasingResource2 :: (this: *Allocator, pAllocation: *Allocation, AllocationLocalOffset: u64, pResourceDesc: *D3D12_RESOURCE_DESC1, InitialLayout: D3D12_BARRIER_LAYOUT, pOptimizedClearValue: *D3D12_CLEAR_VALUE, NumCastableFormats: u32, pCastableFormats: *DXGI_FORMAT, riidResource: *IID, ppvResource: **void) -> HRESULT #cpp_method #foreign d3d12ma "?CreateAliasingResource2@Allocator@D3D12MA@@QEAAJPEAVAllocation@2@_KPEBUD3D12_RESOURCE_DESC1@@W4D3D12_BARRIER_LAYOUT@@PEBUD3D12_CLEAR_VALUE@@IPEBW4DXGI_FORMAT@@AEBU_GUID@@PEAPEAX@Z";
        CreateAliasingResource2 :: (this: *Allocator, pAllocation: *Allocation, AllocationLocalOffset: u64, pResourceDesc: *D3D12_RESOURCE_DESC1, InitialLayout: D3D12_BARRIER_LAYOUT, pOptimizedClearValue: *D3D12_CLEAR_VALUE, NumCastableFormats: u32, pCastableFormats: *DXGI_FORMAT, riidResource: IID, ppvResource: **void) -> HRESULT #no_context {
            return CreateAliasingResource2(this, pAllocation, AllocationLocalOffset, pResourceDesc, InitialLayout, pOptimizedClearValue, NumCastableFormats, pCastableFormats, *riidResource, ppvResource);
        }

        /** \brief Creates custom pool.
        */
        CreatePool :: (this: *Allocator, pPoolDesc: *POOL_DESC, ppPool: **Pool) -> HRESULT #cpp_method #foreign d3d12ma "?CreatePool@Allocator@D3D12MA@@QEAAJPEBUPOOL_DESC@2@PEAPEAVPool@2@@Z";

        /** \brief Sets the index of the current frame.
        
        This function is used to set the frame index in the allocator when a new game frame begins.
        */
        SetCurrentFrameIndex :: (this: *Allocator, frameIndex: u32) -> void #cpp_method #foreign d3d12ma "?SetCurrentFrameIndex@Allocator@D3D12MA@@QEAAXI@Z";

        /** \brief Retrieves information about current memory usage and budget.
        
        \param[out] pLocalBudget Optional, can be null.
        \param[out] pNonLocalBudget Optional, can be null.
        
        - When IsUMA() `== FALSE` (discrete graphics card):
        - `pLocalBudget` returns the budget of the video memory.
        - `pNonLocalBudget` returns the budget of the system memory available for D3D12 resources.
        - When IsUMA() `== TRUE` (integrated graphics chip):
        - `pLocalBudget` returns the budget of the shared memory available for all D3D12 resources.
        All memory is considered "local".
        - `pNonLocalBudget` is not applicable and returns zeros.
        
        This function is called "get" not "calculate" because it is very fast, suitable to be called
        every frame or every allocation. For more detailed statistics use CalculateStatistics().
        
        Note that when using allocator from multiple threads, returned information may immediately
        become outdated.
        */
        GetBudget :: (this: *Allocator, pLocalBudget: *Budget, pNonLocalBudget: *Budget) -> void #cpp_method #foreign d3d12ma "?GetBudget@Allocator@D3D12MA@@QEAAXPEAUBudget@2@0@Z";

        /** \brief Retrieves statistics from current state of the allocator.
        
        This function is called "calculate" not "get" because it has to traverse all
        internal data structures, so it may be quite slow. Use it for debugging purposes.
        For faster but more brief statistics suitable to be called every frame or every allocation,
        use GetBudget().
        
        Note that when using allocator from multiple threads, returned information may immediately
        become outdated.
        */
        CalculateStatistics :: (this: *Allocator, pStats: *TotalStatistics) -> void #cpp_method #foreign d3d12ma "?CalculateStatistics@Allocator@D3D12MA@@QEAAXPEAUTotalStatistics@2@@Z";

        /** \brief Builds and returns statistics as a string in JSON format.
        *
        @param[out] ppStatsString Must be freed using Allocator::FreeStatsString.
        @param DetailedMap `TRUE` to include full list of allocations (can make the string quite long), `FALSE` to only return statistics.
        */
        BuildStatsString :: (this: *Allocator, ppStatsString: **s16, DetailedMap: BOOL) -> void #cpp_method #foreign d3d12ma "?BuildStatsString@Allocator@D3D12MA@@QEBAXPEAPEA_WH@Z";

        /// Frees memory of a string returned from Allocator::BuildStatsString.
        FreeStatsString :: (this: *Allocator, pStatsString: *s16) -> void #cpp_method #foreign d3d12ma "?FreeStatsString@Allocator@D3D12MA@@QEBAXPEA_W@Z";

        /** \brief Begins defragmentation process of the default pools.
        
        \param pDesc Structure filled with parameters of defragmentation.
        \param[out] ppContext Context object that will manage defragmentation.
        
        For more information about defragmentation, see documentation chapter:
        [Defragmentation](@ref defragmentation).
        */
        BeginDefragmentation :: (this: *Allocator, pDesc: *DEFRAGMENTATION_DESC, ppContext: **DefragmentationContext) -> void #cpp_method #foreign d3d12ma "?BeginDefragmentation@Allocator@D3D12MA@@QEAAXPEBUDEFRAGMENTATION_DESC@2@PEAPEAVDefragmentationContext@2@@Z";

        Constructor :: (this: *Allocator, allocationCallbacks: *ALLOCATION_CALLBACKS, desc: *ALLOCATOR_DESC) -> void #cpp_method #foreign d3d12ma "??0Allocator@D3D12MA@@AEAA@AEBUALLOCATION_CALLBACKS@1@AEBUALLOCATOR_DESC@1@@Z";
        Constructor :: (this: *Allocator, allocationCallbacks: ALLOCATION_CALLBACKS, desc: ALLOCATOR_DESC) #no_context {
            Constructor(this, *allocationCallbacks, *desc);
        }

        m_Pimpl:                *AllocatorPimpl;

        // Virtual functions:
        // Normally you should call them via the vtable.
        // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
        // or need to create a vtable yourself.

        virtual_ReleaseThis :: (this: *Allocator) -> void #cpp_method #foreign d3d12ma "?ReleaseThis@Allocator@D3D12MA@@MEAAXXZ";

        virtual_Destructor :: (this: *Allocator, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign d3d12ma "??1Allocator@D3D12MA@@EEAA@XZ";
    }

    /// \brief Bit flags to be used with VIRTUAL_BLOCK_DESC::Flags.
    VIRTUAL_BLOCK_FLAGS :: enum s32 {
        NONE             :: 0;

        ALGORITHM_LINEAR :: 1;

        ALGORITHM_MASK   :: 1;

        VIRTUAL_BLOCK_FLAG_NONE             :: NONE;

        VIRTUAL_BLOCK_FLAG_ALGORITHM_LINEAR :: ALGORITHM_LINEAR;

        VIRTUAL_BLOCK_FLAG_ALGORITHM_MASK   :: ALGORITHM_MASK;
    }

    /// Parameters of created D3D12MA::VirtualBlock object to be passed to CreateVirtualBlock().
    VIRTUAL_BLOCK_DESC :: struct {
        /// Flags.
        Flags:                VIRTUAL_BLOCK_FLAGS;

        /** \brief Total size of the block.
        
        Sizes can be expressed in bytes or any units you want as long as you are consistent in using them.
        For example, if you allocate from some array of structures, 1 can mean single instance of entire structure.
        */
        Size:                 u64;

        /** \brief Custom CPU memory allocation callbacks. Optional.
        
        Optional, can be null. When specified, will be used for all CPU-side memory allocations.
        */
        pAllocationCallbacks: *ALLOCATION_CALLBACKS;
    }

    /// \brief Bit flags to be used with VIRTUAL_ALLOCATION_DESC::Flags.
    VIRTUAL_ALLOCATION_FLAGS :: enum s32 {
        NONE                :: 0;

        UPPER_ADDRESS       :: 8;

        STRATEGY_MIN_MEMORY :: 65536;

        STRATEGY_MIN_TIME   :: 131072;

        STRATEGY_MIN_OFFSET :: 16384;

        STRATEGY_MASK       :: 212992;

        VIRTUAL_ALLOCATION_FLAG_NONE                :: NONE;

        VIRTUAL_ALLOCATION_FLAG_UPPER_ADDRESS       :: UPPER_ADDRESS;

        VIRTUAL_ALLOCATION_FLAG_STRATEGY_MIN_MEMORY :: STRATEGY_MIN_MEMORY;

        VIRTUAL_ALLOCATION_FLAG_STRATEGY_MIN_TIME   :: STRATEGY_MIN_TIME;

        VIRTUAL_ALLOCATION_FLAG_STRATEGY_MIN_OFFSET :: STRATEGY_MIN_OFFSET;

        VIRTUAL_ALLOCATION_FLAG_STRATEGY_MASK       :: STRATEGY_MASK;
    }

    /// Parameters of created virtual allocation to be passed to VirtualBlock::Allocate().
    VIRTUAL_ALLOCATION_DESC :: struct {
        /// Flags for the virtual allocation.
        Flags:        VIRTUAL_ALLOCATION_FLAGS;

        /** \brief Size of the allocation.
        
        Cannot be zero.
        */
        Size:         u64;

        /** \brief Required alignment of the allocation.
        
        Must be power of two. Special value 0 has the same meaning as 1 - means no special alignment is required, so allocation can start at any offset.
        */
        Alignment:    u64;

        /** \brief Custom pointer to be associated with the allocation.
        
        It can be fetched or changed later.
        */
        pPrivateData: *void;
    }

    /// Parameters of an existing virtual allocation, returned by VirtualBlock::GetAllocationInfo().
    VIRTUAL_ALLOCATION_INFO :: struct {
        /// \brief Offset of the allocation.
        Offset:       u64;

        /** \brief Size of the allocation.
        
        Same value as passed in VIRTUAL_ALLOCATION_DESC::Size.
        */
        Size:         u64;

        /** \brief Custom pointer associated with the allocation.
        
        Same value as passed in VIRTUAL_ALLOCATION_DESC::pPrivateData or VirtualBlock::SetAllocationPrivateData().
        */
        pPrivateData: *void;
    }

    /** \brief Represents pure allocation algorithm and a data structure with allocations in some memory block, without actually allocating any GPU memory.
    
    This class allows to use the core algorithm of the library custom allocations e.g. CPU memory or
    sub-allocation regions inside a single GPU buffer.
    
    To create this object, fill in D3D12MA::VIRTUAL_BLOCK_DESC and call CreateVirtualBlock().
    To destroy it, call its method `VirtualBlock::Release()`.
    You need to free all the allocations within this block or call Clear() before destroying it.
    
    This object is not thread-safe - should not be used from multiple threads simultaneously, must be synchronized externally.
    */
    VirtualBlock :: struct {
        #as using iunknownimpl: IUnknownImpl;

        /** \brief Returns true if the block is empty - contains 0 allocations.
        */
        IsEmpty :: (this: *VirtualBlock) -> BOOL #cpp_method #foreign d3d12ma "?IsEmpty@VirtualBlock@D3D12MA@@QEBAHXZ";

        /** \brief Returns information about an allocation - its offset, size and custom pointer.
        */
        GetAllocationInfo :: (this: *VirtualBlock, allocation: VirtualAllocation, pInfo: *VIRTUAL_ALLOCATION_INFO) -> void #cpp_method #foreign d3d12ma "?GetAllocationInfo@VirtualBlock@D3D12MA@@QEBAXUVirtualAllocation@2@PEAUVIRTUAL_ALLOCATION_INFO@2@@Z";

        /** \brief Creates new allocation.
        \param pDesc
        \param[out] pAllocation Unique indentifier of the new allocation within single block.
        \param[out] pOffset Returned offset of the new allocation. Optional, can be null.
        \return `S_OK` if allocation succeeded, `E_OUTOFMEMORY` if it failed.
        
        If the allocation failed, `pAllocation->AllocHandle` is set to 0 and `pOffset`, if not null, is set to `UINT64_MAX`.
        */
        Allocate :: (this: *VirtualBlock, pDesc: *VIRTUAL_ALLOCATION_DESC, pAllocation: *VirtualAllocation, pOffset: *u64) -> HRESULT #cpp_method #foreign d3d12ma "?Allocate@VirtualBlock@D3D12MA@@QEAAJPEBUVIRTUAL_ALLOCATION_DESC@2@PEAUVirtualAllocation@2@PEA_K@Z";

        /** \brief Frees the allocation.
        
        Calling this function with `allocation.AllocHandle == 0` is correct and does nothing.
        */
        FreeAllocation :: (this: *VirtualBlock, allocation: VirtualAllocation) -> void #cpp_method #foreign d3d12ma "?FreeAllocation@VirtualBlock@D3D12MA@@QEAAXUVirtualAllocation@2@@Z";

        /** \brief Frees all the allocations.
        */
        Clear :: (this: *VirtualBlock) -> void #cpp_method #foreign d3d12ma "?Clear@VirtualBlock@D3D12MA@@QEAAXXZ";

        /** \brief Changes custom pointer for an allocation to a new value.
        */
        SetAllocationPrivateData :: (this: *VirtualBlock, allocation: VirtualAllocation, pPrivateData: *void) -> void #cpp_method #foreign d3d12ma "?SetAllocationPrivateData@VirtualBlock@D3D12MA@@QEAAXUVirtualAllocation@2@PEAX@Z";

        /** \brief Retrieves basic statistics of the virtual block that are fast to calculate.
        
        \param[out] pStats %Statistics of the virtual block.
        */
        GetStatistics :: (this: *VirtualBlock, pStats: *Statistics) -> void #cpp_method #foreign d3d12ma "?GetStatistics@VirtualBlock@D3D12MA@@QEBAXPEAUStatistics@2@@Z";

        /** \brief Retrieves detailed statistics of the virtual block that are slower to calculate.
        
        \param[out] pStats %Statistics of the virtual block.
        */
        CalculateStatistics :: (this: *VirtualBlock, pStats: *DetailedStatistics) -> void #cpp_method #foreign d3d12ma "?CalculateStatistics@VirtualBlock@D3D12MA@@QEBAXPEAUDetailedStatistics@2@@Z";

        /** \brief Builds and returns statistics as a string in JSON format, including the list of allocations with their parameters.
        @param[out] ppStatsString Must be freed using VirtualBlock::FreeStatsString.
        */
        BuildStatsString :: (this: *VirtualBlock, ppStatsString: **s16) -> void #cpp_method #foreign d3d12ma "?BuildStatsString@VirtualBlock@D3D12MA@@QEBAXPEAPEA_W@Z";

        /** \brief Frees memory of a string returned from VirtualBlock::BuildStatsString.
        */
        FreeStatsString :: (this: *VirtualBlock, pStatsString: *s16) -> void #cpp_method #foreign d3d12ma "?FreeStatsString@VirtualBlock@D3D12MA@@QEBAXPEA_W@Z";

        m_Pimpl:                *VirtualBlockPimpl;

        Constructor :: (this: *VirtualBlock, allocationCallbacks: *ALLOCATION_CALLBACKS, desc: *VIRTUAL_BLOCK_DESC) -> void #cpp_method #foreign d3d12ma "??0VirtualBlock@D3D12MA@@AEAA@AEBUALLOCATION_CALLBACKS@1@AEBUVIRTUAL_BLOCK_DESC@1@@Z";
        Constructor :: (this: *VirtualBlock, allocationCallbacks: ALLOCATION_CALLBACKS, desc: VIRTUAL_BLOCK_DESC) #no_context {
            Constructor(this, *allocationCallbacks, *desc);
        }

        // Virtual functions:
        // Normally you should call them via the vtable.
        // But these bindings can be useful if you need to call the parent implementation in a sub-struct’s overwritten method
        // or need to create a vtable yourself.

        virtual_ReleaseThis :: (this: *VirtualBlock) -> void #cpp_method #foreign d3d12ma "?ReleaseThis@VirtualBlock@D3D12MA@@MEAAXXZ";

        virtual_Destructor :: (this: *VirtualBlock, flags: Msvc_Destructor_Flags = .NONE) -> void #cpp_method #foreign d3d12ma "??1VirtualBlock@D3D12MA@@EEAA@XZ";
    }

    /** \brief Creates new main D3D12MA::Allocator object and returns it through `ppAllocator`.
    
    You normally only need to call it once and keep a single Allocator object for your `ID3D12Device`.
    */
    CreateAllocator :: (pDesc: *ALLOCATOR_DESC, ppAllocator: **Allocator) -> HRESULT #foreign d3d12ma "?CreateAllocator@D3D12MA@@YAJPEBUALLOCATOR_DESC@1@PEAPEAVAllocator@1@@Z";

    /** \brief Creates new D3D12MA::VirtualBlock object and returns it through `ppVirtualBlock`.
    
    Note you don't need to create D3D12MA::Allocator to use virtual blocks.
    */
    CreateVirtualBlock :: (pDesc: *VIRTUAL_BLOCK_DESC, ppVirtualBlock: **VirtualBlock) -> HRESULT #foreign d3d12ma "?CreateVirtualBlock@D3D12MA@@YAJPEBUVIRTUAL_BLOCK_DESC@1@PEAPEAVVirtualBlock@1@@Z";

    /** \brief Helper structure that helps with complete and conscise initialization of the D3D12MA::ALLOCATION_DESC structure.
    */
    CALLOCATION_DESC :: struct {
        #as using allocation_desc: ALLOCATION_DESC;
    }

    /** \brief Helper structure that helps with complete and conscise initialization of the D3D12MA::POOL_DESC structure.
    */
    CPOOL_DESC :: struct {
        #as using pool_desc: POOL_DESC;
    }

    /** \brief Helper structure that helps with complete and conscise initialization of the D3D12MA::VIRTUAL_BLOCK_DESC structure.
    */
    CVIRTUAL_BLOCK_DESC :: struct {
        #as using virtual_block_desc: VIRTUAL_BLOCK_DESC;
    }

    /** \brief Helper structure that helps with complete and conscise initialization of the D3D12MA::VIRTUAL_ALLOCATION_DESC structure.
    */
    CVIRTUAL_ALLOCATION_DESC :: struct {
        #as using virtual_allocation_desc: VIRTUAL_ALLOCATION_DESC;
    }
}

operator& :: (a: D3D12MA.ALLOCATION_FLAGS, b: D3D12MA.ALLOCATION_FLAGS) -> D3D12MA.ALLOCATION_FLAGS #foreign d3d12ma "??I@YA?AW4ALLOCATION_FLAGS@D3D12MA@@W401@0@Z";
operator& :: (a: D3D12MA.DEFRAGMENTATION_FLAGS, b: D3D12MA.DEFRAGMENTATION_FLAGS) -> D3D12MA.DEFRAGMENTATION_FLAGS #foreign d3d12ma "??I@YA?AW4DEFRAGMENTATION_FLAGS@D3D12MA@@W401@0@Z";
operator& :: (a: D3D12MA.ALLOCATOR_FLAGS, b: D3D12MA.ALLOCATOR_FLAGS) -> D3D12MA.ALLOCATOR_FLAGS #foreign d3d12ma "??I@YA?AW4ALLOCATOR_FLAGS@D3D12MA@@W401@0@Z";
operator& :: (a: D3D12MA.POOL_FLAGS, b: D3D12MA.POOL_FLAGS) -> D3D12MA.POOL_FLAGS #foreign d3d12ma "??I@YA?AW4POOL_FLAGS@D3D12MA@@W401@0@Z";
operator& :: (a: D3D12MA.VIRTUAL_BLOCK_FLAGS, b: D3D12MA.VIRTUAL_BLOCK_FLAGS) -> D3D12MA.VIRTUAL_BLOCK_FLAGS #foreign d3d12ma "??I@YA?AW4VIRTUAL_BLOCK_FLAGS@D3D12MA@@W401@0@Z";
operator& :: (a: D3D12MA.VIRTUAL_ALLOCATION_FLAGS, b: D3D12MA.VIRTUAL_ALLOCATION_FLAGS) -> D3D12MA.VIRTUAL_ALLOCATION_FLAGS #foreign d3d12ma "??I@YA?AW4VIRTUAL_ALLOCATION_FLAGS@D3D12MA@@W401@0@Z";

#scope_file

d3d12ma :: #library,no_dll "../../../lib/d3d12ma";
libcpmt :: #library,system,link_always "libcpmt";
uuid    :: #library,system,link_always "uuid";
