function [IAt,JAt,AAt] =sparse_transform(IA,JA,AA,m,n)
%实现稀疏矩阵的转置

nz=size(AA,2);  %稀疏矩阵非零元的个数

%初始化数组IAt,JAt,AAt
IAt=zeros(1,nz);
JAt=zeros(1,nz);
AAt=zeros(1,nz);

%统计矩阵A各列的非零元个数
for i=1:nz;
    k=JA(i);
    IAt(k+1)=IAt(k+1)+1;
end

%通过累加生成矩阵A'的行数组IAt
IAt(1)=1;
for i=1:n
    IAt(i+1)=IAt(i+1)+IAt(i);
end

%非零元素循环，生成A'的JAt和AAt数组
for i=1:m
    for j=IA(i):IA(i+1)-1
        k=JA(j);
        JAt(IAt(k))=i;
        AAt(IAt(k))=AA(j);
        IAt(k)=IAt(k)+1;
    end
end

%还原数组IAt
for i=n:-1:2
    IAt(i)=IAt(i-1);
end
IAt(1)=1;
end

