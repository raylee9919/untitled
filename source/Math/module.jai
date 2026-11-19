// Copyright Seong Woo Lee. All Rights Reserved.

Vec2 :: struct {
    x, y: float;

    #overlay (x) components: [2] float;
};

Vec3 :: struct {
    x, y, z: float;

    #overlay (x) xy: Vec2;
    #overlay (y) yz: Vec2;

    #overlay (x) components: [3] float;
};

Vec4 :: struct {
    x, y, z, w: float;

    #overlay (x) xy: Vec2;
    #overlay (y) yz: Vec2;
    #overlay (z) zw: Vec2;

    #overlay (x) xyz: Vec3;
    #overlay (y) yzw: Vec3;

    #overlay (x) components: [4] float;
};

Quaternion :: struct {
    x, y, z: float;
    w       := 1.0;

    #overlay (x) xyz: Vec3;
    #overlay (x) components: [4] float;
};
