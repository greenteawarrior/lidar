%lidar [POE lab 1]
%Emily Wang and Claire Diehl
%Fall 2013

%Note before proceeding: This script is currently set to process data with 
%specific degree settings (angles). Please edit DataMath2.m if you decide 
%to run the lidar with different pan/tilt ranges and/or increments.

%Firstly, obtain data from the Arduino.
arduino=serial('COM3');
fopen(arduino);
rawData = [];
data = 0;

try    
    %Keep gathering data until the "-6" Serialprint indication from 
    %the Arduino says it's done with the lidar sweep trial.
    while data ~= -6;
        data=fscanf(arduino,'%d');
        disp(data);
        rawData(end+1) = data;
    end
    
catch
    fclose(arduino);
end

%Ensure the serial port was closed after attempting to gather data.
fclose(arduino); 

%After the data has been gathered, run DataChange, DataMath2, 
%and lidarPlot to obtain the 3D representation of the diorama.

dataMatrix = DataChange(rawData);
coordinateMatrix = DathaMath2(dataMatrix);
lidarPlot(coordinateMatrix);