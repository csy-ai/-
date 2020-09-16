function [D,U0,z,y] = Jacobi(L0,U,x,p)
%��ʼ��
n=size(L0,2);%����L0������
z=zeros(n,1);
y=zeros(n,1);
D=diag(diag(U));
U0=U-D;

for k=1:p
    z=x-L0*z;
end

for k=1:p
    y=(D^(-1))*z-(D^(-1))*U0*y;
end
end