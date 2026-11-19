// Copyright Seong Woo Lee. All Rights Reserved.

main :: () {
    print("Hello, Sailor!\n");
}


#import "Basic";

#if OS == .WINDOWS {
    #import "Windows";
    #import "dxgi";
    #import "d3d12"()(INCLUDE_DEBUG_BINDINGS = __DEBUG);
    #load "RHI/d3d12.jai";
}
