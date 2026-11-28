// Copyright Seong Woo Lee. All Rights Reserved.

WIDTH  :: 1920;
HEIGHT :: 1080;
should_quit := false;


main :: () {
    window := create_window(WIDTH, HEIGHT, "untitled");

    device: Device;
    assert(init_device(*device, temp));
    defer deinit_device(*device);

    swapchain: Swapchain;
    assert(init_swapchain(*device, *swapchain, window, WIDTH, HEIGHT, 3));
    defer deinit_swapchain(*swapchain);

    a: Memory_Allocator;
    assert(init_allocator(*device, *a, .GPU_ONLY, .BUFFER, .NORMAL, false));
    defer deinit_allocator(*a);

    texture_allocator: Memory_Allocator;
    assert(init_allocator(*device, *texture_allocator, .GPU_ONLY, .NON_RT_DS_TEXTURES, .NORMAL, false));
    defer deinit_allocator(*texture_allocator);

    buf: Buffer;
    assert(init_buffer(*device, *buf, *a, .GPU_ONLY, 1024*1024, false));
    defer deinit_buffer(*buf);

    view: Buffer_View;
    init_buffer_view(*device, *buf, *view, 0, 1024*1024, true);
    defer deinit_buffer_view(*view);

    tex: Texture;
    assert(init_texture(*device, *texture_allocator, false, *tex, .{
        dimension   = ._2D,
        format      = .RGBA8_UNORM,
        usage_flags = .SAMPLED,
        name        = "foo",
        width       = 1024,
        height      = 1024,
        mip_levels  = 1, 
        depth       = 1,
    }, null));


    while !should_quit {
        reset_temporary_storage();

        update_window_events();
    }
}

#import "Basic";
#import "Window_Creation";
#import "Input";
#import "Bit_Operations";
#import "Random";
#load "rhi.jai";

#if OS == .WINDOWS {
    #import     "Windows";
    #import     "Windows_Utf8";
}
