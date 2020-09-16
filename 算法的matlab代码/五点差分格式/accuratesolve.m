function g=accuratesolve(x1,x2,y1,y2,M,N)
m=M-1;
n=N-1;
x=x1+(x2-x1)*(0:M)/M;    %x,y向量表示横纵坐标
y=y1+(y2-y1)*(0:N)/N; 
for i=1:m
    for j=1:n
        u1(i+(j-1)*m)=f1(x(i+1),y(j+1));
    end
end
g=u1;