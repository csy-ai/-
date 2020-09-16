function [C] = mmm(A,B)
%实现矩阵相乘
ma=size(A,1);       %A的行数
na=size(A,2);       %A的列数
mb=size(B,1);       %B的行数
nb=size(B,2);       %B的列数
C=zeros(ma,nb);     %预分配矩阵C的内存 
if(na==mb)
    for i=1:ma
        for j=1:nb
            C(i,j)=C(i,j)+A(i,j)*B(j,i);
        end
    end
else
    display('Input error!');
end
end

