function finalsol = findOptSolution(placement)
    x = placement(1); 
    y = placement(2);
    z = placement(3); 
    phi = placement(4); 
    solutions = fJointAngles(x, y, z, phi);
    finalsol = real(optimial_org(solutions,[x y])); 
end