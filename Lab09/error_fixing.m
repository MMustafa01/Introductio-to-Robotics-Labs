function xy_fake  = error_fixing(x,y)
    if (x<0 && y<0)
        %Fixing x
        angle = atan2(-y,-x);angle_2 = rad2deg(angle/(pi/2)*2*pi)
        x_correction_factor = 1*sin((angle/(pi/2))*2*pi-37.5*pi/180)
         x = x + x_correction_factor
        %Fixing y
        y_correction_factor = 0
        if (y < -15)
            y_correction_factor = 0
        elseif ( -15 < y && y < -10)
            y_correction_factor = 1
        elseif (y > -10)
            y_correction_factor = 1.5
        end
        y = y + y_correction_factor
    elseif (x<0 && y>0)
        x = 1.1*x;
        y = 1.2*y;
    elseif (x>0 && y<0)
        
    end
    xy_fake = [x,y];
end