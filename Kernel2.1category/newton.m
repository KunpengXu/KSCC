function [ x1 ] = newton( a )

N =1000;
x0=1;
b=1;
x1=log(b*x0*x0)-log(a)+a/x0;
E=1.0e-2;%f=x*x*x+4*x*x-10=0,f1为f=x*x*x+4*x*x-10的一阶导
k=1;
while(norm(x1-x0)>=E&k<N)
x0=x1;
f=log(b*x0*x0)-log(a)+a/x0;
f1=2/x0-a/(x0*x0);
if(f1~=0)
x1=x0-f/f1;
x1=abs(x1);
end
k=k+1;
end

end

