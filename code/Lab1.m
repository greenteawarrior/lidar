arduino=serial('COM3');
fopen(arduino);
datamatrix = [];
data = 0;

try    
    while data ~= -6;
        data=fscanf(arduino,'%d');
        disp(data);
        datamatrix(end+1) = data;
    end
    
catch
    fclose(arduino);
end
fclose(arduino);