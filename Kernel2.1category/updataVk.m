%更新簇k的d维中心点
function [Vk]=updataVk(data)


  Vk1=0;
    
    for d=1:size(data,2)
   
    Cd=[];
    vkd=0;
     Od=unique(data(:,d));
   
   od1=size(Od,1);%od1=numel(Od);
    for m=1:od1
         n=numel(find(data(:,d)==Od(m,1)))/size(data,1);
         Cd=[Cd;n];
   end
  
   
    for t=1:size(data,1)
         Xd=[];
     
     for m1=1:od1
     if(data(t,d)==Od(m1,1))
         
         s=1;
     else
         
         s=0;
         
     end
     Xd=[Xd;s];
     end
   
      Vkt=sum((Xd-Cd).^2);%/size(tempData,1);
      vkd=vkd+Vkt;
      Vkd=vkd/size(data,1);  
     end
  % newVk=zeros(k,size(data,2));
 % newVk={};
 Vk1=Vk1+Vkd;
     end
   Vk=Vk1/size(data,2);
     
   

%newCenters(ii,:)=mode(tempData);%mode()计算矩阵出每列频率最大值的行向量
end