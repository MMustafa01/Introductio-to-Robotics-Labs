function K = get_intrinsic(camera)
    obj = determineIntrinsic(camera);
    K = [obj.fx 0 obj.ppx;
        0 obj.fy obj.ppy;
        0 0 1];
end