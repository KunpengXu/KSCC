%º∆À„∑Ω≤Ó
function [ Vkt ] = calculateVkt( p1,p2,data )


Vkt=0;

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
    
     Vkt1=sum((Xd-p2{1,i}).^2);
     
   %if(p1(1,ii)~=p2(1,ii))
      %  dis=dis+1;
      Vkt=Vkt+Vkt1; 
end
end


