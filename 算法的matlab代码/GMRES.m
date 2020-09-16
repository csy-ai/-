function [x] = GMRES(A,b,x0,maxiter)
%GMRES(���弫С�в��㷨),����ǶԳ�
x=x0;
r=b-A*x;
beta=norm(r,2);
v=r/beta;
for j=1:maxiter
    w=A*v;
    for i=1:j
        h=v'*w;
        w=w-h*v;
    end
    h=norm(w,2);
    if h==0
        break 
    end
    v=w/h;
end
end

