// Copyright Seong Woo Lee. All Rights Reserved.

main :: () {
    device: RHI_Device;
    if !init_device(*device) {
        debug_break();
    }
}


#import "Basic";
#load "rhi.jai";
