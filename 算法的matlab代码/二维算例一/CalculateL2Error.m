function L2Err = CalculateL2Error(pxy, ele, uh, u)
%% Compuate the L2 error
%between the finite element approximation and the exact solution
NT = size(ele ,1);
[qpnt , weight] = QuadPnt2D(2);
nqpnt=size(qpnt , 1);
L2Err=0.0;
for k=1:NT
    v1=ele(k, 1);
    v2=ele(k, 2);
    v3=ele(k, 3);
    Bk=[pxy(v2, 1)-pxy(v1,1) pxy(v3 ,1)-pxy(v1,1); pxy(v2, 2)-pxy(v1, 2) pxy(v3,2)-pxy(v1 ,2)];
    Ck=[pxy(v1,1); pxy(v1,2)];
    for q=1:nqpnt
        quadP=Bk*qpnt(q, :)'+Ck;
        [phi, ~] = basis2D(quadP', pxy(v1, :), pxy(v2, :) , pxy(v3, :));
        uval=u(quadP');
        uhval=0.0;
        for i=1:3
            uhval=uhval+uh(ele(k, i))*phi(i);
        end
        L2Err=L2Err+weight(q)*det(Bk)*(uval -uhval)^2;
    end
end
L2Err=sqrt(L2Err);
end




