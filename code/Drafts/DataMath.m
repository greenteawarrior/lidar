function res=DataMath(data)
%2=pan
%3=tilt
len = length(data);
c=1;
b=1;
l=.43;
plotme=[0,0,0];
for num=1:len;
    if data(num,2)>90;
        data(num,2)=180-data(num,2);
        c=-1;
    end
    if data(num,3)>90;
        data(num,3)=180-data(num,3);
        b=-1;
    end
    d=data(num,1); %distance
    theta=data(num,2); %pan angle
    phi=data(num,3); %tilt angle
    s=d*cosd(phi); %triangulation helper
    X=(l+s)*cosd(theta)*c;
    Y=(l+s)*sind(theta);
    Z=d*sind(phi)*b;
    coordinates=[X,Y,Z];
    plotme = [plotme;coordinates];
    c=1;
    b=1;
end
res=plotme(2:end, 1:end);
end
