distancedata=[3,1,1;4,1,2;5,1,3];
%trig functions for figuring out location of points
for pan=1:3;
    for tilt=1:1;
    % if both are 90
    X=0;
    Y=0;
    Z=0;
    while tilt<90;
        %if pan is 90 and tilt is less then 90
        X=0;
        Y=distancedata(tilt*pan,3)*sin(distancedata(tilt*pan,2));
        Z=distancedata(tilt*pan,3)*cos(distancedata(tilt*pan,2));
    end
    while tilt>90
        %if pan is 90 and tilt is greater then 90
        X=0;
        Y=-distancedata(tilt*pan,3)*sin(180-distancedata(tilt*pan,2));
        Z=-distancedata(tilt*pan,3)*cos(180-distancedata(tilt*pan,2));
    end
    while pan<90;
        %if pan is less then 90
            %if pan is less then 90 and tilt is 90
            X=distancedata(tilt*pan,3)*cos(distancedata(tilt*pan,1));
            Y=distancedata(tilt*pan,3)*sin(distancedata(tilt*pan,1));
            Z=0;
            while tilt<90;
                % if pan and tilt are less then 90
                X=distancedata(tilt*pan,3)*cos(distancedata(tilt*pan,1));
                Y=distancedata(tilt*pan,3)*sin(distancedata(tilt*pan,1));
                Z=distancedata(tilt*pan,3)*cos(distancedata(tilt*pan,2));
            end
            while tilt>90
                %if pan is less then 90 and tilt is greater then 90
                X=distancedata(tilt*pan,3)*cos(distancedata(tilt*pan,1));
                Y=distancedata(tilt*pan,3)*sin(distancedata(tilt*pan,1));
                Z=distancedata(tilt*pan,3)*cos(180-distancedata(tilt*pan,2));
            end
    end
    while pan>90;
        %if pan is greater then 90
            %if pan is greater then 90 and tilt is 90
            X=-distancedata(tilt*pan,3)*cos(distancedata(180-tilt*pan,1));
            Y=-distancedata(tilt*pan,3)*sin(distancedata(180-tilt*pan,1));
            Z=0;
            while tilt<90;
                %if pan is greater then 90 and tilt is less then 90
                X=-distancedata(tilt*pan,3)*cos(180-distancedata(tilt*pan,1));
                Y=-distancedata(tilt*pan,3)*sin(180-distancedata(tilt*pan,1));
                Z=distancedata(tilt*pan,3)*cos(distancedata(tilt*pan,2));
            end
            while tilt>90
                %if both are greater then 90
                X=-distancedata(tilt*pan,3)*cos(180-distancedata(tilt*pan,1));
                Y=-distancedata(tilt*pan,3)*sin(180-distancedata(tilt*pan,1));
                Z=-distancedata(tilt*pan,3)*cos(180-distancedata(tilt*pan,2));
            end
    end
end
end

%Correcting for error in axis placement
for i=1:180
    for num=1:180000
    %while pan is 90
    d=.043;
    X=0;
    Y=Y+d;
    while i<90
        %if pan is less then 90
        X=X+(d*arccos(distancedata(num,1)));
        Y=Y+(d*arcsin(distancedata(num,1)));
    end
    while i>90
        %if pan is greater then 90
        X=X+(d*cos(180-distancedata(num,1)));
        Y=Y+(d*sin(180-distancedata(num,1)));
    end
    end
end

%plotting the data
%surf(X,Y,Z);