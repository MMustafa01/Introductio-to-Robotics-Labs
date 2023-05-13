function solution = optimial_org(allsolutions,xy)
%before this we have already add the mod with all the 4 solutions and if
%any of the 4 soltuions is not within the range of -150 to 150 it will be
%dropped 
 %position = arb.getpos();
    position = [pi/2 -pi/2 0 0];
    position(1) = position(1) - pi/2;
    position(2) = position(2) + pi/2;
    x = xy(1);
    y = xy(2);
    a = [];
    disp('what you are looking for')
    allsolutions
    % For negative negative quadrant
    ansor = 4;
    if (x<0 && y<0)
     base = allsolutions(1,:);
     for m = 1:size(base)
        if ((0 <= base(m)) && base(m) <= 2*0.7855 )
            ansor = m;
        end
     end
     solution = allsolutions(ansor,:);
    % for quadrant positive x negative y
    elseif (x>=0 && y<0)
        base = allsolutions(1,:);
     for m = 1:size(base)
        if ((1.57 <= base(m)) && base(m) <= 3.15 )
            ansor = m;
        end
     end
     solution = allsolutions(ansor,:);
    else
        for i=1:4
            error = abs(real(allsolutions(i,1))-position(1))+ abs(real(allsolutions(i,2))-position(2)) + abs(real(allsolutions(i,3))-position(3)) + abs(real(allsolutions(i,4))-position(4));
            a(i)=error;
        end
        
        perfect = find(min(a));
    
        solution = allsolutions(2,:);
    end

end