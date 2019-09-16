%计算kernel目标函数值
function [functionValue]=VKCcalculateObjectFunction(k,resultLabel,dataS,newCk,newVkd)

functionValue=0;
n1=0;
for i=1:k
    n1=n1+1;
    n2=0;
centerData=newCk(i,:);
Vk=newVkd(i,:);
for j=1:size(dataS,1)
    
    if(resultLabel(j,1)==i)
        n2=n2+1;
        originalData=dataS(j,:);
        f=functionValue;
        centerData;
        %KRcalculateSim(i,originalData,centerData,dataS,Vk,resultLabel);
        %functionValue=functionValue+KRcalculateSim(i,originalData,centerData,dataS,Vk,resultLabel);
   functionValue=functionValue+VKCcalculateSim(originalData,centerData,dataS,Vk);
    end
end
end
end