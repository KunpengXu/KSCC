%º∆À„Fscore
function[Fscore]=calculateFsc(k,Label,resultLabel)
 %Od=unique(Label(:,1));
 %od1=histc(Label(:,1),Od);
 Od=tabulate(Label(:,1));
 
        d=0;
        
         for i=1:k
            
            

nk=Od{i,2};
F=[];
for l=1:k
    nkl=0;
    
    c=numel(find(resultLabel(:,1)==l));
   for j=1:size(Label,1)
   
   if(resultLabel(j,1)==l)
       if(isequal(Label(j,1),Od(i,1)))
           nkl=nkl+1;
       end
   end
       
   end
     recall=nkl/nk;
     pre=nkl/c;
     f=(2*recall*pre)/(recall+pre);
     F=[F;f];
    
end
F1=max(F);
   
       d=d+(nk/size(Label,1))*F1;
       
         end
        
        Fscore=d;
        
end