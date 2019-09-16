function [ resultLabel,Fscore,accuracy] = Kmodes(k,d)
%KMODES?Summary?of?this?function?goes?here?
%???Detailed?explanation?goes?here??
%???----�����������----?
%???k?�������?
%???dataSet?�������ݾ������һ��Ϊ���ǩ��?
%???----�����������----?
%???resultLabel?���������ǩ
[num , txt ,raw]= xlsread(d);

dataS=cell2mat(raw(:,1:(size(raw,2)-1)));
%dataS=cell2mat(raw(:,1:(size(raw,2)-1)));

Label=raw(:,end);
[row , ~]=size(dataS); 

%���ÿ�ε�����Ŀ�꺯��

 

objValueVector=[]; 

%ѭ������

 

iteratorNum=0; 

 

%���ѡȡk����

 
%disp(row);
r=randperm(row); 
   
ran=r(1:k) ;

t1=clock; 

IC=ran ;

%���е�һ�λ���

 

resultLabel=zeros(row,1); 

for i=1:row 

    data1=dataS(i,:); 

    selectCluster=zeros(1,k); 

    for j=1:k 

        data2=dataS(IC(j),:); 

        

selectCluster(1,j)=calculateDis1(data1,data2); 

    end 

    [minx, tlabel]=min(selectCluster);  
resultLabel(i,1)=tlabel;
end
%�������ĵ㣬������һ�λ���,ֱ��Ŀ�꺯������?
while(true)
        iteratorNum=iteratorNum+1;
newcenter=updataCenters1(k,resultLabel,dataS);
for i=1:row
data1=dataS(i,:);
selectCluster=zeros(1,k);
for j=1:k
data2=newcenter(j,:);
selectCluster(1,j)=calculateDis1(data1,data2);
end
[minx, tlabel]=min(selectCluster);
resultLabel(i,1)=tlabel;
end
objValue=calculateObjectFunction1(k,resultLabel,dataS,newcenter);
if((size(objValueVector,2)>0)&&(objValue==objValueVector(1,size(objValueVector,2))));
    accuracy=calculateAcc(Label,resultLabel);
    Fscore=calculateFsc(k,Label,resultLabel);
    break;
end
objValueVector=[objValueVector objValue]; 
end
t2=clock;
time=etime(t2,t1);
iterNum=iteratorNum;
%����Fscore
function[Fscore]=calculateFsc(k,Label,resultLabel)
 %Od=unique(Label(:,1));
 %od1=histc(Label(:,1),Od);
 Od=tabulate(Label(:,1));
 
        dd=0;
        
         for ii=1:k
            
            

nk=Od{ii,2};
F=[];
for l=1:k
    nkl=0;
    
    c=numel(find(resultLabel(:,1)==l));
   for jj=1:size(Label,1)
   
   if(resultLabel(jj,1)==l)
       if(isequal(Label(jj,1),Od(ii,1)))
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
   
       dd=dd+(nk/size(Label,1))*F1;
       
         end
        
        Fscore=dd;
        
end
function[accuracy]=calculateAcc(Label,resultLabel)
        
        
        Od=unique(Label(:,1));
        dd=0;
        for ii=1:size(Od,1)
            tempData=[];
for jj=1:size(Label,1)
    if(isequal(Label(jj,1),Od(ii,1)))
tempData=[tempData;resultLabel(jj,:)];
    end
end
    a=unique(tempData);
    b=histc(tempData,a);
    
    c=max(b);
       dd=dd+c ;
        end
        accuracy=dd/size(Label,1);
    end
function [ dis ] = calculateDis1( p1,p2 )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
dis=0;
for ii=1:size(p1,2)
    if(p1(1,ii)~=p2(1,ii))
        dis=dis+1;
    end
end

end
%�������ĵ�?????
function [newCenters]=updataCenters1(k,resultLabel,data)
newCenters=zeros(k,size(data,2));
for ii=1:k
tempData=[];
for jj=1:size(resultLabel,1)
    if(resultLabel(jj,1)==ii)
tempData=[tempData;data(jj,:)];
    end
end
%for dd=1:size(data,2)
%    Od=unique(tempData(:,dd))
%end
newCenters(ii,:)=mode(tempData);%mode()��������ÿ��Ƶ�����ֵ��������
end
end
%����K-modesĿ�꺯��ֵ?????
function [functionValue]=calculateObjectFunction1(k,resultLabel,data,center)
functionValue=0;
for ii=1:k
centerData=center(ii,:);
for jj=1:size(data,1)
    if(resultLabel(jj,1)==ii)
        originalData=data(jj,:);
        functionValue=functionValue+calculateDis1(centerData,originalData);
    end
end
end
end
end



