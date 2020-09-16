function [x,k]= CG(A,b,x0,esp)
%共轭梯度法求线性方程组.矩阵要求对称正定
n=size(A,1);
x=x0;
r=b-A*x;
p=r;
for k=0:(n-1)
    alpha=(r'*r)/((A*p)'*p);
    x=x+alpha*p;
    r1=b-A*x;
    if((norm(r1)<=esp)||(k==n-1))
        x;
        break;
    end
    beta=norm(r1)^2/norm(r)^2;
    p=r1+beta*p
    r=r1;
end

