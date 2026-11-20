// Copyright Seong Woo Lee. All Rights Reserved.

main :: () {
    device: RHI_Device;
    if !init_device(*device) {
        debug_break();
    }

    foo(,, allocator=temp);
}

foo :: () { 
    print("Hello\n");
}


#import "Basic";
#load "rhi.jai";
