function dataout=DataChange(data)
%data=[1,2,1,1,1,4,1,1];
len = length(data);
newdata=[0,0,0];
for i=1:4:len-1;
    A=[data(i),data(i+1),data(i+2)];
    newdata=[newdata;A];
end
dataout=newdata(2:end, 1:end);
end