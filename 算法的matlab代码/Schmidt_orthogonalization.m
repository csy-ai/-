function [QS,RS]=Schmidt_orthogonalization(A)
[m,n] = size(A);
if(m<n)
    error('行小于列，无法计算，请转置后重新输入');
    return
end
b=zeros(m,n);
%正交化
b(:,1)=A(:,1);
for i=2:n
    for j=1:i-1
        b(:,i)=b(:,i)-dot(A(:,i),b(:,j))/dot(b(:,j),b(:,j))*b(:,j);
    end
    b(:,i)=b(:,i)+A(:,i);
end
%单位化
for j=1:n
    length=norm(b(:,j));
    for i=1:m
    QS(i,j)=b(i,j)/length;
    RS=
    end
end




%版权声明：本文为CSDN博主「Martin_Soaring」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
%原文链接：https://blog.csdn.net/qq_27387809/article/details/82934569