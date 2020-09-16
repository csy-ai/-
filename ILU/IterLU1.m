function [L U] = IterLU1(A,p)
%LU�ֽ������
%���뱣֤�Խ���ĶԽ�Ԫ��ȫ��Ϊ0����Ȼ����ִ���
n=size(A,1); %����Aһ����һ������
L0=zeros(n);
U0=zeros(n);
D=zeros(n,1);

for k=1:p
    B=A-L0*U0;
    D=diag(B)
    U0=triu(B,1)
    L0=tril(B,-1);
    L0=L0*diag(D.^(-1))
end

L=L0+speye(n);
U=U0+diag(D);
end


