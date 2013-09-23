function dataout=DataChange(rawData)
%data=[1,2,1,1,1,4,1,1];
len = length(rawData);
newdata=[0,0,0];
for i=1:4:len-1;
    A=[rawData(i),rawData(i+1),rawData(i+2)];
    newdata=[newdata;A];
end
dataout=newdata(2:end, 1:end);
end