// Copyright Seong Woo Lee. All Rights Reserved.

main :: () {
    device: Device;
    if !init_device(*device, temp) {
        debug_break();
    }

    s: Semaphore;
    init_semaphore(*device, *s);
    deinit_semaphore(*s);
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
