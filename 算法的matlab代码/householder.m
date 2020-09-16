function [T, P] = householder(A)
% Formations: RA = T, where A is original matrix
% The implementation of Householder Reduction
% R is constructed as a product of elementary reflector
% T is upper triangular matrix

% Author: Zhenlin Du(Johnsondu)
% Email:  qlduzhlin@126.com
% Time:   2014-11-28 14:00

A = double(A)
[m, n] = size(A); % m- number of rows, n- number of columns

iter = 0;
if m > n
    iter = n;
else
    iter = m - 1;
end

T = A;
P = eye(m);

for i = 1 : iter
    % take the first column
    u = T(i:m, i);
    % construct identity matrix
    I = eye(m-i+1);
    e1 = I (:, 1);
    % u is elementary relector.
    u = u - norm(u) * e1;
    R11 = eye(m-i+1) - 2 * (u * u') / (u' * u);
    R1 = eye(m);
    for j = i: m
        R1(j, i: m) = R11(j-i+1, :);
    end
    T = R1 * T;
    P = R1 * P;
end
