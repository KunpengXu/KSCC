%���´�K�ķ���Vk
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

%newCenters(ii,:)=mode(tempData);%mode()��������ÿ��Ƶ�����ֵ��������
end
end