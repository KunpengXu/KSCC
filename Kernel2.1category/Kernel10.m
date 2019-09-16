function [ Fscore ] = Kernel10(k,d)

t1=clock;
Fscore1=[];
accuracy1=[];
for i=1:10
    disp(i)
[fscore,accuracy]=Kernel(k,d);
Fscore1=[Fscore1;fscore];
accuracy1=[accuracy1;accuracy];

end
Fscore=sum(Fscore1)/10
accuracy=sum(accuracy1)/10
t2=clock;
time=etime(t2,t1)
end

