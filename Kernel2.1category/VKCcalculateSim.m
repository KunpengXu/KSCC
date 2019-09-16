%距离度量
function [ sim ] = VKCcalculateSim( p1,p2,data,Vk)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
sim2=0;

for i=1:size(p1,2)
    
     Od=unique(data(:,i));
     
     od1=size(Od,1);
     
     Xd=[];
     
     for m=1:od1
         
     if(p1(1,i)==Od(m,1))
         
         n=1;
     else
         
         n=0;
         
     end
     Xd=[Xd;n];
     
     c=p2{1,i};
     
     end
     
     q=Xd-p2{1,i};
  %  a=sum((Xd-p2{1,i}).^2)/Vk{1,i}(1,1);
   % Xkd=newton(a);
  %   sim1=exp(-(sum((Xd-p2{1,i}).^2)/2));
  if (sum(q.^2)==0)
      sim1=1;
  else
 sim1=1-exp(-(sum((Xd-p2{1,i}).^2)/(Vk{1,i}(1,1))));
  end
      sim2=sim2+sim1;
      sim=sim2/size(p1,2);
end
end