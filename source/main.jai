// Copyright Seong Woo Lee. All Rights Reserved.

WIDTH  :: 1920;
HEIGHT :: 1080;
should_quit := false;

main :: () {
    window := create_window(WIDTH, HEIGHT, "untitled");

    device: Device;
    init_device(*device, temp);
    defer deinit_device(*device);

    swapchain: Swapchain;
    init_swapchain(*device, *swapchain, window, WIDTH, HEIGHT, 3);
    defer deinit_swapchain(*swapchain);

    a: Memory_Allocator;
    init_allocator(*device, *a, .GPU_ONLY, .BUFFER, .NORMAL, false);
    defer deinit_allocator(*a);

    buf: Buffer;
    init_buffer(*device, *buf, *a, .GPU_ONLY, 1024*1024, false, false);
    defer deinit_buffer(*buf);

    view: Buffer_View;
    init_buffer_view(*device, *buf, *view, 0, 1024*1024, true);
    defer deinit_buffer_view(*view);


    while !should_quit {
        reset_temporary_storage();

        update_window_events();
    }
}

#import "Basic";
#import "Window_Creation";
#import "Input";
#import "Bit_Operations";
#load "rhi.jai";

#if OS == .WINDOWS {
    #import     "Windows";
    #import     "Windows_Utf8";
    #import,dir "DXGI";
}
