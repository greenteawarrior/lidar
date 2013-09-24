arduino=serial('COM3');
fopen(arduino);
rawData = [];
data = 0;

try    
    while data ~= -6;
        data=fscanf(arduino,'%d');
        disp(data);
        rawData(end+1) = data;
    end
    
catch
    fclose(arduino);
end

fclose(arduino);

%After the data has been gathered, run DataChange, DataMath2, and lidarPlot
%to obtain the 3D representation of the diorama.