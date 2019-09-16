%计算kernel目标函数值
function [functionValue]=calculateObjectFunction(k,resultLabel,dataS,newCk,Vk,newWkd,theta)

functionValue=0;
n1=0;
for i=1:k
    n1=n1+1;
    n2=0;
centerData=newCk(i,:);

Wk=newWkd(i,:);
for j=1:size(dataS,1)
    
    if(resultLabel(j,1)==i)
        n2=n2+1;
        originalData=dataS(j,:);
        f=functionValue;
        centerData;
        %KRcalculateSim(i,originalData,centerData,dataS,Vk,resultLabel);
        %functionValue=functionValue+KRcalculateSim(i,originalData,centerData,dataS,Vk,resultLabel);
   functionValue=functionValue+calculateSim(originalData,centerData,dataS,Vk,Wk,theta);
    end
end
end
end