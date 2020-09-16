function [uh] = Poisson2d(pxy, ele, pBnd , f) 
%% POISSON2D solve 2d Poisson equation by P1 linear element. 
N = size(pxy ,1); 
NT = size(ele ,1); 
Ndof = N; 
%% Assemble stiffness matrix and the right hand side 
A = zeros(Ndof , Ndof);
b = zeros(Ndof , 1); 
%得到标准单元上的积分点及权重
[qpnt , weight] = QuadPnt2D(2); 
nqpnt=size(qpnt , 1); 
%对单元循环
for k=1:NT 
    v1=ele(k, 1); 
    v2=ele(k, 2); 
    v3=ele(k, 3); 
    %从参考单元到真实单元的变换
    Bk=[pxy(v2, 1)-pxy(v1,1) pxy(v3 ,1)-pxy(v1,1); pxy(v2, 2)-pxy(v1, 2) pxy(v3,2)-pxy(v1 ,2)]; 
    Ck=[pxy(v1,1); pxy(v1,2)]; 
    Ak=zeros(3, 3); 
    bk=zeros(3, 1); 
    %计算单元刚度矩阵及单元载荷向量
 for q=1:nqpnt 
     quadP=Bk*qpnt(q, :)'+Ck; 
     [phi, gradPhi] = basis2D(quadP', pxy(v1, :), pxy( v2, :), pxy(v3, :)); 
     fval=f(quadP'); 
     for i=1:3 
         %单元载荷向量数值积分 
         bk(i)=bk(i)+weight(q)*det(Bk)*fval*phi(i) ; 
         
         %单元刚度矩阵数值积分
         for j=1:3 
             Ak(i, j)=Ak(i, j)+weight(q)*det( Bk)*(gradPhi(j, 1, 1)*gradPhi(i, 1, 1)+gradPhi(j, 1, 2)* gradPhi(i, 1, 2)); 
         end
     end
 end
 %组装 
 for i=1:3 
     b(ele(k,i))=b(ele(k,i))+bk(i); 
     for j=1:3 
         A(ele(k,i), ele(k,j))=A(ele(k,i), ele(k,j ))+Ak(i, j); 
     end
 end
end
save('A.mat','A')
%% deal the boundary condition 
for i=1:Ndof 
    if pBnd(i)==1 
        A(i, i)=1.0; 
        b(i)=0.0; 
        for j=1:Ndof 
            if j~=i 
                A(i, j)=0.0; 
            end
        end
        for j=1:Ndof 
            if j~=i 
                A(j, i)=0.0; 
            end
        end
end
end
%% solve 
uh = A\b;
a=A;
save('a.mat','a');

end







