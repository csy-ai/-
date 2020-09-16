function [g,a,b] = fivepoints(x1,x2,y1,y2,M,N)%�䲽����
h=(x2-x1)/M;    %���Ჽ��
k=(y2-y1)/N;    %���Ჽ��
m=M-1;
n=N-1;
h1=h^2;
r=h1/(k^2);     %����е������������ϵ��
t=2+2*r;        %����е����ĵ��ϵ��
x=x1+(x2-x1)*(0:M)/M;    %x,y������ʾ��ɢ�ĺ�������
y=y1+(y2-y1)*(0:N)/N; 
a=zeros(m*n ,m*n);       %��ʼ��a,b��������aΪϵ������
b=zeros(m*n ,1);
%�ڲ��ģ�m-2��*(n-2)����
for i=2:m-1
    for j=2:n-1
        a(i+(j-1)*m,:)=[zeros(1,i-1+(j-2)*m) -r zeros(1,m-2) -1 t -1 zeros(1,m-2) -r zeros(1,(n-j)*m-i)]
        b(i+(j-1)*m)=h1*f(x(i+1),y(j+1));
    end
end
%�±�Ե
j=1;
for i=2:m-1
    a(i+(j-1)*m,:)=[zeros(1,i-2) -1 t -1 zeros(1,m-2) -r zeros(1,(n-j)*m-i)];
    b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+r*bottom(x(i+1));
end
%�ұ�Ե
i=m;
for j=2:n-1
    a(i+(j-1)*m,:)=[zeros(1,(j-1)*m-1) -r zeros(1,m-2) -1 t zeros(1,m-1) -r zeros(1,(n-j)*m-i)];
    b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+right(y(j+1));
end
%�ϱ�Ե
j=n;
for i=2:m-1
    a(i+(j-1)*m,:)=[zeros(1,i-1+(j-2)*m) -r zeros(1,m-2) -1 t -1 zeros(1,m-i-1)];
    b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+r*top(x(i+1));
end
%���Ե
i=1;
for j=2:n-1
    a(i+(j-1)*m,:)=[zeros(1,i-1+(j-2)*m) -r zeros(1,m-1)  t -1 zeros(1,m-2) -r zeros(1,(n-j)*m-i)];
    b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+left(y(j+1));
end
%���½ǵ��Ǹ���
i=1;j=1;
a(1,:)=[t -1 zeros(1,m-2) -r zeros(1,(n-1)*m-1)];
b(1)=h1*f(x(2),y(2))+r*bottom(x(2))+left(y(2));
%���½ǵ��Ǹ���
i=m;j=1;
a(i+(j-1)*m,:)=[zeros(1,m-2) -1 t zeros(1,m-1) -r zeros(1,(n-2)*m)];
b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+r*bottom(x(i+1))+right(y(j+1));
%���Ͻǵ��Ǹ���
i=1;j=n;
a(i+(j-1)*m,:)=[zeros(1,(n-2)*m) -r zeros(1,(m-1))  t -1 zeros(1,m-2)];
b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+r*top(x(i+1))+left(y(j+1));
%���Ͻǵ��Ǹ���
i=m;j=n;
a(i+(j-1)*m,:)=[zeros(1,(n-1)*m-1) -r zeros(1,(m-2)) -1 t];
b(i+(j-1)*m)=h1*f(x(i+1),y(j+1))+r*top(x(i+1))+right(y(j+1));
u=a\b;
g=u;            
end

