function real = pixel_coo_to_real(pixel) 
    fx = 1407.1;fy = 1407.1;
%     u0 = 932;
    u0 = 1920/2;
%     v0 = 526;
    v0 = 1080/2;
s = 0;K = [fx s u0 ; 0 fy v0 ; 0 0 1 ];
%     coo = inv(K)*[(pixel(1)-22)/ ((602-22) / 1920); (pixel(2)-76)/ ((417-76) / 1080); 1;] * 696;
%     coo = inv(K)*[(pixel(1)-17)/ ((610-17) / 1920); (pixel(2)-70)/ ((426-70) / 1080); 1;] * 696; % try this
%     coo = inv(K)*[(pixel(1)-1)/ ((582-1) / 1920); (pixel(2)-63)/ ((428-63) / 1080); 1;] * 696; % try this
    coo = inv(K)*[pixel(1);pixel(2);1;]*696;
    coo =[coo;1];
    zc = 696;
    R_T_W = [1 0 0 0;
                 0 -1 0 0;
                 0 0 -1 zc;
                 0 0 0 1];
    final = R_T_W*coo;
    real=[final(1) final(2)];
end