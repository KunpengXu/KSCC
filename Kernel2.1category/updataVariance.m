%更新簇K的方差Vk
function [ newVk ] = updataVariance(k, newCk,resultLabel,data )
newVk=[];
for i=1:k
    
    tempData=[];

    for j=1:size(resultLabel,1)
    
        if(resultLabel(j,1)==i)

            tempData=[tempData;data(j,:)];
   
        end
    end
    Vkt=[];
    Vk=0;
    for t=1:size(tempData,1)
        
        Vkt=calculateVkt(tempData(t,:),newCk(i,:),data);
        Vkt1=Vkt/size(tempData,1);
        Vk=Vk+Vkt1;
    end
    newVk=[newVk;Vk];

%newCenters(ii,:)=mode(tempData);%mode()计算矩阵出每列频率最大值的行向量
end
end