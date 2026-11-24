// Copyright Seong Woo Lee. All Rights Reserved.

main :: () {
    device: RHI_Device;
    if !init_device(*device, temp) {
        debug_break();
    }
}

#import "Basic";
#import "Window_Creation";
#import "Input";
#import "Bit_Operations";
#load "rhi.jai";
