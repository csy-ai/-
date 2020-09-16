function [phi, gradPhi] = basis2D(p, p1, p2, p3)
m = size(p, 1);
phi=zeros(3, m);
gradPhi=zeros(3, m, 2);

  for i=1:m
    lambda1=triarea(p(i,:), p2, p3);
    lambda2=triarea(p1, p(i,:), p3);
    lambda3=triarea(p1, p2, p(i,:));
    lambda=triarea(p1, p2, p3);
    %基函数
    phi(1, i)=lambda1/lambda;
    phi(2, i)=lambda2/lambda;
    phi(3, i)=lambda3/lambda;
    %基函数梯度
    gradPhi(1, i, 1) = (p2(2)- p3(2))/lambda;
    gradPhi(1, i, 2) = (p3(1) - p2(1))/lambda;
    gradPhi(2, i, 1) = (p3(2) - p1(2))/lambda;
    gradPhi(2, i, 2) = (p1(1) - p3(1))/lambda;
    gradPhi(3, i, 1) = (p1(2) - p2(2))/lambda;
    gradPhi(3, i, 2) = (p2(1) - p1(1))/lambda;
  end
end


