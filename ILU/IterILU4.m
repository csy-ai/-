function [L U] = IterILU4(A,p,m)
%不完全的LU分解迭代法
n=size(A,1);
L=sparse(n);U=L;
D=sparse(n,1);


for k=1:p
    B=L*U;
    B=A-B;
    D=diag(B);U=triu(B,1);L=tril(B,-1);
    L=L*diag(D.^(-1));
end

SP=(B~=0);%obtain the sparsity pattern SP,与B有完全相同的稀疏结构

for k=1:m
     B=L*U;
     B=A-B;
     % delete the entries out of the sparsity pattern SP.
     B=B.*SP;
     D=diag(B);U=triu(B,1);L=tril(B,-1);
     L=L*diag(D.^(-1));
end
L=L+speye(n);
U=U+diag(D);
end

