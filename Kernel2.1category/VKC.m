function [ Vkc ] = VKC( k,d )

%----�����������----
%k �������
%d excel���ݼ� ���һ��Ϊ���ǩ
%----�����������----
%Fscore F-S���ྫ��


[num , txt ,raw]= xlsread(d);

dataS=cell2mat(raw(:,1:(size(raw,2)-1)));%��ȥ���ǩ�����ݼ�
Label=raw(:,end);%ֻ��ȡ���ǩ
[row , ~]=size(dataS); 

%���ÿ�ε�����Ŀ�꺯��
objValueVector=[]; 

%ѭ������
iteratorNum=0; 

t1=clock; 

%resultLabel=crossvalind('Kfold', length(dataS), k);

resultLabel=VKCKmodes(k,d);

%�������ĵ㣬������һ�λ���,ֱ��Ŀ�꺯������?
while(true)
        iteratorNum=iteratorNum+1;

%����updataCenters������ȡ�µ����ĵ�ͷ���
[newCk,newVkd]=updataCenters(k,resultLabel,dataS);

a=newVkd;
b=newCk;
for i=1:row
data1=dataS(i,:);
selectCluster=zeros(1,k);
for j=1:k

data2=newCk(j,:);
Vk=newVkd(j,:);
cc=data2{1,1};
%selectCluster(1,j)=KRcalculateSim(j,data1,data2,dataS,Vk,resultLabel);
selectCluster(1,j)=calculateSim(data1,data2,dataS,Vk);
end
[maxx, tlabel]=max(selectCluster);
resultLabel(i,1)=tlabel;
end
objValue=VKCcalculateObjectFunction(k,resultLabel,dataS,newCk,newVkd);


if((size(objValueVector,2)>0)&&(abs(objValue-objValueVector(1,size(objValueVector,2)))<=0.005));
   thet=objValue/(row-k)
   p=k*size(dataS,2);
   Vkc=(row+p-1)/(row-p-1)+log(thet)-k/row;
    break;
end
objValueVector=[objValueVector objValue];
end
t2=clock;
time=etime(t2,t1)
iterNum=iteratorNum;
end



