function [A] = createA(a,alpha,d,theta)
% The function creates a symbolic transformation matrix based on DH
% parameters passed as arguments to the function. 
%   A = [cosd(theta), -sind(theta)cosd(alpha), sind(theta)sind(alpha), a cosd(theta);
%        sind(theta), cosd(theta)cosd(alpha), -cosd(theta)sind(alpha), a sind(theta);
%        0,          sind(alpha),            cosd(alpha),           d;
%        0,          0,                     0,                    1];

theta=sym(theta);
d=sym(d);
a=sym(a);
alpha=sym(alpha);

A = [cosd(theta), -sind(theta)*cosd(alpha), sind(theta)*sind(alpha), a*cosd(theta);
    sind(theta), cosd(theta)*cosd(alpha), -cosd(theta)*sind(alpha), a*sind(theta);
    0, sind(alpha), cosd(alpha), d;
    0, 0, 0, 1];

end

