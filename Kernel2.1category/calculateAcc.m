%º∆À„Accuracy
function[accuracy]=calculateAcc(Label,resultLabel)

        Od=unique(Label(:,1)); 
        
        d=0;
        
        for i=1:size(Od,1)
            
            tempData=[];
            
for j=1:size(Label,1)
    
    if(isequal(Label(j,1),Od(i,1)))
        
tempData=[tempData;resultLabel(j,:)];

    end
end
    a=unique(tempData);
    
    b=histc(tempData,a);
    
    c=max(b);
    
       d=d+c ;
        end
        accuracy=d/size(Label,1);
    end
