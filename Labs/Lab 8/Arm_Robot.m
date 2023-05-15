classdef Arm_Robot
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here

    properties
        arb
        workspace
    end

    methods(Static)
        function arm = Create_Arm()
            %UNTITLED Construct an instance of this class
            %   The work space stores information on the radius of the arm
            %   with the constraint that phi should be +- 90
            arm.arb = Arbotix('port','COM10', 'nservos',5);
            a4 = 7.6; = 5.4; a2 = 10.8; a3 = 10.8;
            arm.workspace = (a2+a3+a4);
            

        end

        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
     

    end
    methods
        functino 
    end
end