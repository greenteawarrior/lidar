function res=DataChange(rawData)
len = length(rawData);
dataMatrix=[0,0,0];
for i=1:4:len-1;
    A=[rawData(i),rawData(i+1),rawData(i+2)];
    dataMatrix=[dataMatrix;A];
end
res=dataMatrix(2:end, 1:end);
end