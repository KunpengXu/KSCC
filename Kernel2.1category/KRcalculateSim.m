function [ sim  ] = KRcalculateSim(j,p1,p2,data,Vk,resultLabel )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
sim=0;
tempData=[];

    for jj=1:size(resultLabel,1)
    
        if(resultLabel(jj,1)==j)

            tempData=[tempData;data(jj,:)];
   
        end
       
    end
     for d=1:size(data,2)
   
 
       n=numel(find(tempData(:,d)==p1(1,d)))/size(tempData,1);
  
      sim=sim+n;
   
     end


end