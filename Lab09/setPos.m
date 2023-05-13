function errorCode = setPos( arb, jointAngles)
%     jointAngles = jointAngles * pi/180;
%     disp('The joint angles as expressed in radians are');
%     jointAngles
    new_theta = zeros(1,4); % Array for JointAngles Mapped to [−pi, pi]
    errorCode = 0; % 0 −> No error yet
    for i=1:4
        % Mapping each jointangle to [−pi,pi]
        new_theta(i) = mod(jointAngles(i)+pi, 2*pi) - pi;
        % Condition for invalid input angle
        if (new_theta(i) <= -pi*15/18 && new_theta(i) >= +pi*15/18)
            disp(strcat('Angle ', num2str(i), ' Out of range = ', num2str(new_theta(i))));
            % Error code = i −> ith Joint is out of range
            errorCode = i;
            
        end
    end
%     disp('the modded joint angles are')
%     new_theta
    % Passing the Joint Angles to Robot is no Error Occured
    if errorCode == 0
%         arb = Arbotix('port','COM5', 'nservos',5);

        % Mapping DH angles to Servo Angles
        map_theta = arb.getpos();
        map_theta(1) = (jointAngles(1) - pi/2);
        map_theta(2) = (jointAngles(2) - pi/2);
        map_theta(3) = jointAngles(3);
        map_theta(4) = jointAngles(4);
        % Connecting to Robot and passing the theta information
        % to Robot for execution with a certain speed (64 for every joint
        % in this case
        
%         disp('The map theeta is \n');
%         map_theta
        

        arb.setpos(map_theta, [64, 64, 64, 64, 64]);
    end    

        
   
end