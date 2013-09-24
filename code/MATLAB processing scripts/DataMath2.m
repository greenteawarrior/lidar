function res=DataMath2(dataMatrix)
len = length(dataMatrix);
c=1;
b=1;
l=.43;
plotme=[0,0,0];
for num=1:len;
    if dataMatrix(num,2)>90;
        dataMatrix(num,2)=180-dataMatrix(num,2);
        c=-1;
    end
    if dataMatrix(num,3)>90;
        dataMatrix(num,3)=180-dataMatrix(num,3);
        b=-1;
    end
    d=dataMatrix(num,1); %distance
    theta=dataMatrix(num,2); %pan angle
    phi=dataMatrix(num,3); %tilt angle
    s=d*sind(phi); %triangulation helper
    X=(l+s)*cosd(theta)*c;
    Y=(l+s)*sind(theta);
    Z=d*cosd(phi)*b*(-1);
    coordinates=[X,Y,Z];
    plotme = [plotme;coordinates];
    c=1;
    b=1;
end
res=plotme(2:end, 1:end);
end
