function [QH, RH] = QRhouseholder(A)
[m, n] = size(A); 

if m > n
    iter = n;
else
    iter = m-1;
end

RH = A;
QH = eye(m);

for i = 1 : iter
    u = RH(i:m, i);
    I = eye(m-i+1);
    e1 = I (:, 1);
    u = u - norm(u) * e1;
    h = eye(m-i+1) - 2 * (u * u') / (u' * u);
    H = eye(m);
    for j = i: m
        H(j, i: m) = h(j-i+1, :);
    end
    RH = H * RH;
    QH = QH* H ;
end
