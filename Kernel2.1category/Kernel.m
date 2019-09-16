
function [Fscore,accuracy] = Kernel(k,d)
%----输入参数介绍----
%k 聚类簇数
%d excel数据集 最后一列为类标签
%----输出参数介绍----
%Fscore F-S聚类精度


[num , txt ,raw]= xlsread(d);

dataS=cell2mat(raw(:,1:(size(raw,2)-1)));%除去类标签的数据集
Label=raw(:,end);%只获取类标签
[row , ~]=size(dataS); 

%存放每次迭代的目标函数
objValueVector=[]; 

%循环次数
iteratorNum=0; 

t1=clock; 

%resultLabel=crossvalind('Kfold', length(dataS), k);

resultLabel=Kmodes(k,d);
theta=0.5;
%更新中心点，进行下一次划分,直到目标函数收敛?
while(true)
        iteratorNum=iteratorNum+1;

%调用updataCenters函数获取新的中心点和方差
[newCk]=updataCenters(k,resultLabel,dataS);
[Vk]=updataVk(dataS);
[newWkd]=updataWkd(k,resultLabel,dataS,theta,newCk,Vk);
a=Vk;
b=newCk;
for i=1:row
data1=dataS(i,:);
selectCluster=zeros(1,k);
for j=1:k

data2=newCk(j,:);
Wk=newWkd(j,:);
cc=data2{1,1};
%selectCluster(1,j)=KRcalculateSim(j,data1,data2,dataS,Vk,resultLabel);
selectCluster(1,j)=calculateSim(data1,data2,dataS,Vk,Wk,theta);
end
[maxx, tlabel]=max(selectCluster);
resultLabel(i,1)=tlabel;
end
objValue=calculateObjectFunction(k,resultLabel,dataS,newCk,Vk,newWkd,theta);


if((size(objValueVector,2)>0)&&(abs(objValue-objValueVector(1,size(objValueVector,2)))<=0.005));
   accuracy=calculateAcc(Label,resultLabel)
   Fscore=calculateFsc(k,Label,resultLabel);
    break;
end
objValueVector=[objValueVector objValue];
end
t2=clock;
time=etime(t2,t1)
iterNum=iteratorNum;
end


