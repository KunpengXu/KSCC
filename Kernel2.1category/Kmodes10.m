function [ Fscore ] = Kmodes10(k,d)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
t1=clock;

Fscore1=[];
accuracy1=[];
for i=1:100
       disp(i)
[~,fscore,accuracy]=Kmodes(k,d);
Fscore1=[Fscore1;fscore];
accuracy1=[accuracy1;accuracy];
end
Fscore=sum(Fscore1)/100
accuracy=sum(accuracy1)/100
t2=clock;
time=etime(t2,t1)
end

