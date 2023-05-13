function solutions = findJointAngles(x,y,z,phi) 
% x, y and z are the coordinates of the center of teh end-effector that is
% the 4th frame
theta_1_1 = atan2(y,x);
theta_1_2 = - pi + atan2(y,x);

d_1 = 141;
a_4 = 92;
a_3 = 103;
a_2 = 103;

r = sqrt(x^2 + y^2);
s = z - d_1;
r_2 = r - a_4*cos(phi);
s_2 = s - a_4*sin(phi);

alpha = acos((-(r_2^2 + s_2^2) + a_2^2 + a_3^2)/(2*a_2*a_3));
temp = (a_2^2 + s_2^2 + r_2^2 - a_3^2)/ (2 * a_2 * sqrt(s_2^2 + r_2^2));
beta = atan2(sqrt(1 - temp^2),temp);
gamma = atan2(s_2,r_2);

theta_2_1 = gamma - beta;
theta_2_2 = gamma + beta;

theta_3_1 = pi - alpha;
theta_3_2 = - pi + alpha;

theta_4_1 = phi - theta_3_1 - theta_2_1;
theta_4_2 = phi - theta_3_2 - theta_2_2;

solutions = [theta_1_1 theta_2_1 theta_3_1 theta_4_1; 
    theta_1_1 theta_2_2 theta_3_2 theta_4_2;
    theta_1_2 pi-theta_2_1 -theta_3_1 -theta_4_1; 
    theta_1_2 pi-theta_2_2 -theta_3_2 -theta_4_2];
end
