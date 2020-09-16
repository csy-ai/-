function [g,a,b] = fivepoints(x1,x2,y1,y2,M,N)%变步长法
h=(x2-x1)/M;    %横轴步长
k=(y2-y1)/N;    %纵轴步长
m=M-1;
n=N-1;
h1=h^2;
r=h1/(k^2);     %五点中的上下两个点的系数
t=2+2*r;        %五点中的中心点的系数
x=x1+(x2-x1)*(0:M)/M;    %x,y向量表示离散的横纵坐标
y=y1+(y2-y1)*(0:N)/N; 
a=zeros(m*n ,m*n);       %初始化a,b矩阵，其中a为系数矩阵
b=zeros(m*n ,1);
%内部的（m-2）*(n-2)个点
for i=2:m-1
    for j=2:n-1
        a(i+(j-1)*m,:)=[zeros(1,i-1+(j-2)*m) -r zeros(1,m-2) -1 t -1 zeros(1,m-2) -r zeros(1,(n-j)*m-i)]
        b(i+(j-1)*m)=h1*f(x(i+1),y(j+1));
    end
end
%下边缘
j=1;
for i=2:m-1
    a(i+(j-1)*m,:)=[zeros(1,i-2) -1 t -1 zeros(1,m-2) -r zeros(1,(n-j)*m-i)];
    b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+r*bottom(x(i+1));
end
%右边缘
i=m;
for j=2:n-1
    a(i+(j-1)*m,:)=[zeros(1,(j-1)*m-1) -r zeros(1,m-2) -1 t zeros(1,m-1) -r zeros(1,(n-j)*m-i)];
    b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+right(y(j+1));
end
%上边缘
j=n;
for i=2:m-1
    a(i+(j-1)*m,:)=[zeros(1,i-1+(j-2)*m) -r zeros(1,m-2) -1 t -1 zeros(1,m-i-1)];
    b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+r*top(x(i+1));
end
%左边缘
i=1;
for j=2:n-1
    a(i+(j-1)*m,:)=[zeros(1,i-1+(j-2)*m) -r zeros(1,m-1)  t -1 zeros(1,m-2) -r zeros(1,(n-j)*m-i)];
    b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+left(y(j+1));
end
%左下角的那个点
i=1;j=1;
a(1,:)=[t -1 zeros(1,m-2) -r zeros(1,(n-1)*m-1)];
b(1)=h1*f(x(2),y(2))+r*bottom(x(2))+left(y(2));
%右下角的那个点
i=m;j=1;
a(i+(j-1)*m,:)=[zeros(1,m-2) -1 t zeros(1,m-1) -r zeros(1,(n-2)*m)];
b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+r*bottom(x(i+1))+right(y(j+1));
%左上角的那个点
i=1;j=n;
a(i+(j-1)*m,:)=[zeros(1,(n-2)*m) -r zeros(1,(m-1))  t -1 zeros(1,m-2)];
b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+r*top(x(i+1))+left(y(j+1));
%右上角的那个点
i=m;j=n;
a(i+(j-1)*m,:)=[zeros(1,(n-1)*m-1) -r zeros(1,(m-2)) -1 t];
b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+r*top(x(i+1))+right(y(j+1));
u=a\b;
g=u;            
end

