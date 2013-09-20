%Arduino Trial Code
%a=arduino('COM3');
%Sensor Position Variables:
X=0;
Y=0;
Z=0;

%Sensor Angle Variables:
pan=0;
tilt=0;

%Create Data Matrix
rawdata=[0,0,0];

%Add Servos
a.servoAttach(9);
a.servoWrite(9,1);
a.servoAttach(8);
a.servoWrite(8,1);

%Pan Loop
for pan=1:180;
    a.servoWrite(9,pan);
    pause(1); %pause for movement
    %Tilt Loop
    for tilt=1:180;
        a.servoWrite(8,tilt);
        pause(.2);
        distance = a.analogRead(1);
        newdata=[pan,tilt,distance];
        rawdata=[newdata;rawdata];
    end
end
