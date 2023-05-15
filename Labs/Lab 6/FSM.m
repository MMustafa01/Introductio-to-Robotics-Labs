function error = FSM(pick, place)
    %calculating the joint angles
    
    
    idle = [0 0 0 0];
    

    epsilon = 0.05;
    arb = Arbotix('port','COM5', 'nservos',5);
    %  pick/place = [x, y, z, phi]
    


    
    %Initialiing the state variables
    verify = 0;
    stateVariable = 'Idle';
    error = 0; %if error is zero no error has occured 
    
    % Verify the place location
    % Given the constraint, i.e phi = -pi/2 and z = -1;
    a2 = 10.8; a3 = 10.8;
    r = a2 + a3;
    
    rPlace = sqrt(place(1)^2+place(2)^2);
    if (rPlace <= r)
        verify = 1;
        fprintf('The place location is verified');
    end
    disp('The robot is now in idle state')
    disp(stateVariable)
    while verify
        curr_pos = arb.getpos();
        fprintf('The robot is now at %s \n', stateVariable );
        % Starting from the idle state.
        if str_comp(stateVariable, 'Idle')
            setPosition(arb, idle)
            pause(5)
            stateVariable = 'Pick1';
            % Apply a condition to see if the robot is in the idle state,
            % given a tolerance of epsilon to the sum.
%             while  ~(sum(curr_pos) <= sum(idle)+ epsilon && sum(curr_pos) >= sum(idle) - epsilon)
%                 curr_pos = arb.getpos();
%                 fprintf("The current pos is  [%d, %d, %d, %d]", curr_pos(1), curr_pos(2), curr_pos(3),curr_pos(4))
%                 stateVariable = 'Pick1';
%             end
        elseif str_comp(stateVariable,'Pick1') 
        % In this state the end effector will be at z + 5, z coordinates.
            pick1_angles = findOptimalSolution(arb,[pick(1), pick(2), pick(3) + 5, pick(4)]);
            
            setPosition(arb, pick1_angles);
            pause(5);
%             while ~(sum(curr_pos) <= sum(pick1_angles)+ epsilon && sum(curr_pos) >= sum(pick1_angles) - epsilon)
%                 curr_pos = arb.getpos();
%                 %Waiting condition
%             end
            stateVariable = 'Pick2';
        elseif str_comp(stateVariable,'Pick2') 
            pick2_angles = findOptimalSolution(arb, [pick(1), pick(2), pick(3), pick(4)]); 
            
            setPosition(arb, pick2_angles);
            arb.setpos(5, 1.25,64);
            pause(5);
%             while ~ (sum(curr_pos) <= sum([pick2_angles 1.25])+ epsilon && sum(curr_pos) >= sum([pick2_angles 1.25]) - epsilon)
%                 curr_pos = arb.getpos();
%                 % Waiting Condition
%             end
            stateVariable = 'Place1';
        elseif str_comp(stateVariable, 'Place1')
            place1_angles = findOptimalSolution(arb,[place(1), place(2), place(3) + 5, place(4)]);
            
            setPosition(arb, place1_angles)
            pause(5);
%             while ~(sum(curr_pos) <= sum(place1_angles)+ epsilon && sum(curr_pos) >= sum(place1_angles) - epsilon)
%                 curr_pos = arb.getpos();
%                 %waiting_condition
%             end
            stateVariable = 'Place2';
        elseif str_comp(stateVariable, 'Place2')
            place2_angles = findOptimalSolution(arb,[place(1), place(2), place(3), place(4)]);
            
            setPosition(arb, place2_angles)
            arb.setpos(5,0,64)
            pause(5);
            place2_angles = findOptimalSolution(arb,[place(1), place(2), place(3)+5, place(4)]);
            
            pause(5);
            setPosition(arb, place2_angles)
%             while ~ (sum(curr_pos) <= sum(place2_angles)+ epsilon && sum(curr_pos) >= sum(place2_angles) - epsilon)
%                 curr_pos = arb.getpos();
%             end
            stateVariable = 'End';
        elseif str_comp(stateVariable, 'End')
            setPosition(arb, idle)
            pause(5);
            arb.relax()
%             while ~(sum(curr_pos) <= sum(idle)+ epsilon && sum(curr_pos) >= sum(idle) - epsilon)
%                 curr_pos = arb.getpos();
%             end
            verify = 0;
            
        
        end
    end 
end
