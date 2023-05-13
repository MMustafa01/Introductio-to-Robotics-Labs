function success = PickandPlace(x1,y1,z1,x2, y2, z2)
%the function is defined in such a way that it takes 6 inputs from the
%users where x1, y1,z1 are the pick coordinates whereas the x2, y2,z2 are
%the place coordinates. We fix phi in both cases to be -pi/2

    %Idle State Defined 

    idle = [pi/4 pi/4 pi/4 pi/4];  
    arb = Arbotix('port','COM5', 'nservos',5);
    last = 0;
    
    success = false; % Fix variable initialization and change to boolean type
    state = 0; %here state 0 refers to the idle state 
    a2 = 10.5; a3 = 10.5; %specified in cms -> also we have made a correction from Lab 5 
    r = a2 + a3;

    %according to our fsm we need to verify if the coordinates entered by
    %the user are valid so we run a check 
    place_r = sqrt(x2^2 + y2^2) ;
    pick_r = sqrt(x1^2 + y1^2) ;

    %Check Coordinate State 
    if (place_r <= r) 
        disp('Coordinates are Verified');
        success = true; % Use boolean type for success

    else 
        disp('blabla')
    end



    while success 

        curr_pos = arb.getpos(); %get current position 
        if (state == 0)
            setPos(arb, idle)
            pause(3)
            arb.setpos(5,0,65);
            pause(5)
            state = 1; %here we change the state to go to Approach State 
            if (last == 1)
                 setPos(arb, idle)
                 pause(1); 
                 %arb.relax() 
                 disp('im done')
                 success = false;
               
            end 

        %Approach State Defined 
        elseif (state == 1) % Use elseif instead of else if
            angles = findOptSolution([x1, y1, z1 + 5, -pi/2]); %in this point we add offset - so this is the add offset state 
            setPos(arb, angles); %setPos was defined in Lab 4 where we incorporated offset according to the real world 
            pause(3);
            state = 2; %changing the state to Grasp State

        %Grasp State defined 
        elseif (state == 2) % Use elseif instead of else if
            angles_grasp = findOptSolution([x1, y1, z1, -pi/2]); %if you observe we have the coordinates just that now we are using inverse kinematics to find the position without the z-offset 
            setPos(arb, angles_grasp); %we were just above the point and now we reach downwards
            arb.setpos(5, 1.56,64); %here we open the grasper to grasp the object
            pause(3);
            state = 3; 

        %Place States defined 
        elseif (state == 3) % Use elseif instead of else if
            angles_place = findOptSolution([x2, y2, z2 + 5, -pi/2]);%in this point we add offset to place objects - so this is the add offset state 
            setPos(arb, angles_place);
            pause(3);
            state = 4; 

         %Release Object State defined 
        elseif (state == 4) % Use elseif instead of else if
            angles_release = findOptSolution([x2, y2, z2, -pi/2]); %offset removed from place coordinates 
            setPos(arb, angles_release)
             arb.setpos(5,0,64)
             pause(1)
              %we return back and state in idle state 
             state = 0;
             last = 1; 

%         elseif (last == 1)
%      
%             setPos(arb, idle)
%             pause(5);
%             arb.relax()
%             disp('im done')
%             success = false;
%          

       


       

        end 

    end 


end