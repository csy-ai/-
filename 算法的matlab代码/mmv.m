function[y]=mmv(b)
%实现矩阵A和向量b的乘积
A=importdata('sy.mat');  %给定m*n维A矩阵
m=size(A,1);       %A的行数
n=size(A,2);       %A的列数
y=zeros(m,1);      %预分配向量y的内存 
%判断向量b的行数，要实现两者相乘，必须保证A的列数与b的行数相等
brows=size(b,1);   %b的行数 
if brows==n
    for i=1:m
       y(i,1)=A(i,:)*b;
    end
else
    display('Input error!');
end
    