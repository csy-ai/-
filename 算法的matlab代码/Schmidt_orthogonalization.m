function [QS,RS]=Schmidt_orthogonalization(A)
[m,n] = size(A);
if(m<n)
    error('��С���У��޷����㣬��ת�ú���������');
    return
end
b=zeros(m,n);
%������
b(:,1)=A(:,1);
for i=2:n
    for j=1:i-1
        b(:,i)=b(:,i)-dot(A(:,i),b(:,j))/dot(b(:,j),b(:,j))*b(:,j);
    end
    b(:,i)=b(:,i)+A(:,i);
end
%��λ��
for j=1:n
    length=norm(b(:,j));
    for i=1:m
    QS(i,j)=b(i,j)/length;
    RS=
    end
end




%��Ȩ����������ΪCSDN������Martin_Soaring����ԭ�����£���ѭ CC 4.0 BY-SA ��ȨЭ�飬ת���븽��ԭ�ĳ������Ӽ���������
%ԭ�����ӣ�https://blog.csdn.net/qq_27387809/article/details/82934569