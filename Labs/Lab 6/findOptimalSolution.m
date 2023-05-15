function lst = findOptimalSolution(arb, coordinates)
    x = coordinates(1); y = coordinates(2); z = coordinates(3); phi = coordinates(4);
    lst = [0 0 0];
    current_angles = arb.getpos();
    current_angles = current_angles(1,1:4); %This replaces the getCurrentPose function
    % current_angles = [-pi/3 -pi/4 pi/4 pi/4];
    current_angles(1) = current_angles(1) + pi/2;
    current_angles(2) = current_angles(2) + pi/2;
    current_angles = current_angles(:,1:4);
    IK_sol = findJointAngles(x, y, z, phi);
    IK_1 = real(IK_sol(1,:)); % Inverse Kinematic Solution 1
    IK_2 = real(IK_sol(2,:)); % Inverse Kinematic Solution 2
    IK_3 = real(IK_sol(3,:)); % Inverse Kinematic Solution 3
    IK_4 = real(IK_sol(4,:)); % Inverse Kinematic Solution 4
    d1 = sum(abs(current_angles - IK_1)); % Delta 1
    d2 = sum(abs(current_angles - IK_2)); % Delta 2
    d3 = sum(abs(current_angles - IK_3)); % Delta 3
    d4 = sum(abs(current_angles - IK_4)); % Delta 4
    d = min([d1, d2, d3, d4]); % Extract Min
    if d == d1 && checkJointLimits(IK_1) && isValid(IK_1)
        lst = IK_1;
    elseif d == d2 && checkJointLimits(IK_2) && isValid(IK_2)
        lst = IK_2;
    elseif d == d3 && checkJointLimits(IK_3) && isValid(IK_3)
        lst = IK_3;
    elseif d == d4 && checkJointLimits(IK_4) && isValid(IK_4)
        lst = IK_4;
    end
end