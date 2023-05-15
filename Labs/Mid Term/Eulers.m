function R = Eulers(Phi, ksi, theta)
    R = [cosd(Phi)*cosd(theta)*cosd(ksi)-sind(Phi)*sind(ksi), -cosd(Phi)*cosd(theta)*sind(ksi)-sind(Phi)*cosd(ksi), cosd(Phi)*sind(theta);
         sind(Phi)*cosd(theta)*cosd(ksi)+sind(Phi)*sind(ksi), -sind(Phi)*cosd(theta)*cosd(ksi)+sind(Phi)*sind(ksi), sind(Phi)*sind(theta);
         -sind(theta)*cosd(ksi), sind(theta)*sin(ksi), cos(theta)];
end