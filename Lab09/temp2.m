x = -2.1
y = -17.6
angle = atan2(-y,-x);angle_2 = rad2deg(angle/(pi/2)*2*pi)
x_correction_factor = 1*sin((angle/(pi/2))*2*pi-37.5*pi/180)
x = x + x_correction_factor