%更新簇k的d维中心点
function [newCk]=updataCenters(k,resultLabel,data)

   for i=1:k
 
    
    tempData=[];
  Vk1=0;
    for j=1:size(resultLabel,1)
    
        if(resultLabel(j,1)==i)

            tempData=[tempData;data(j,:)];
   
        end
       
    end
    
    for d=1:size(data,2)
   
    Ckd=[];
    Cd=[];
    vkd=0;
    wkd=0;
   Od=unique(data(:,d));
   
   od1=size(Od,1);%od1=numel(Od);
   
   
   for m=1:od1
 
       n=numel(find(tempData(:,d)==Od(m,1)))/size(tempData,1);
  
       Ckd=[Ckd;n];
   
   end
   newCk{i,d}=Ckd;
    
  % newVk=zeros(k,size(data,2));
 % newVk={};
 
     end
   
     
   

%newCenters(ii,:)=mode(tempData);%mode()计算矩阵出每列频率最大值的行向量
   end
end