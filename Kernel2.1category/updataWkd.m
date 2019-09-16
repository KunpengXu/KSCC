%更新簇k的d维中心点
function [newWkd]=updataWkd(k,resultLabel,data,theta,newCk,Vk)

   for i=1:k
 
    
    tempData=[];
wkd2=0;
    for j=1:size(resultLabel,1)
    
        if(resultLabel(j,1)==i)

            tempData=[tempData;data(j,:)];
   
        end
       
    end
    for d=1:size(data,2)
     Wkt2=0;
   Od=unique(data(:,d));
   
   od1=size(Od,1);%od1=numel(Od);
   
   
   for t=1:size(tempData,1)
         Xd=[];
     
     for m1=1:od1
         
     if(tempData(t,d)==Od(m1,1))
         
         n=1;
     else
         
         n=0;
         
     end
     Xd=[Xd;n];
     end
   if(Vk~=0)
      Wkt=sum((Xd-newCk{i,d}).^2);
   else
       Wkt=sum((Xd-newCk{i,d}).^2);
   end
      Wkt2=Wkt2+Wkt;
        
   end
     wkd=(2*Vk/Wkt2)*log(Wkt2/(2*Vk));
         newWkd{i,d}=wkd;
        
    end
   
  % newVk=zeros(k,size(data,2));
 % newVk={};

    
   

%newCenters(ii,:)=mode(tempData);%mode()计算矩阵出每列频率最大值的行向量
   end
   end
