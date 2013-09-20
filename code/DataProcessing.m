
%Converting rawdata into distances
distancedata=rawdata;
for raw=1:180;
    distancedata(raw,3)=7.37*10^-5*(1./distancedata(raw,3))+.0004378; %taking the raw data and making it into acutal distance values - need some function
end

%trig functions for figuring out location of points
for num=1:180;
    X=distancedata(num,3)*arccos(distancedata(num,1));
    Y=distancedata(num,3)*arcsin(distancedata(num,1));
    Z=distancedata(nun,3)*arccos(distancedata(num,2));
end

%plotting the data
surf(X,Y,Z);