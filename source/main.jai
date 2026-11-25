// Copyright Seong Woo Lee. All Rights Reserved.

WIDTH  :: 1920;
HEIGHT :: 1080;
should_quit := false;

main :: () {
    device: Device;
    if !init_device(*device, temp) {
        debug_break();
    }

    swapchain: Swapchain;

    window := create_window(WIDTH, HEIGHT, "untitled");

    init_swapchain(*device, *swapchain, window, WIDTH, HEIGHT, 3);

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
