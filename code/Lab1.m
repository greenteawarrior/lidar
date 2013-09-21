arduino=serial('/dev/ttyACM0');
fopen(arduino);
data=fscanf(arduino,'%s');
disp(data);
fclose(arduino);

