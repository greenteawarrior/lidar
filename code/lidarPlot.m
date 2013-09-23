function res=lidarPlot(datamatrix)
tiltTotal = 13; %from 60 degrees to 120 degrees in 5 degree increments! 
panTotal = 19; %from 40 degrees to 130 degrees in 5 degree increments!

Xmatrix = zeros(tiltTotal, panTotal);
Xmatrix(:) = datamatrix(:,1);

Ymatrix = zeros(tiltTotal, panTotal);
Ymatrix(:) = datamatrix(:,2);

Zmatrix = zeros(tiltTotal, panTotal);
Zmatrix(:) = datamatrix(:,3);

surf(Xmatrix, Ymatrix, Zmatrix, Ymatrix);
end