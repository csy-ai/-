function [C] = mmm(A,B)
%ʵ�־������
ma=size(A,1);       %A������
na=size(A,2);       %A������
mb=size(B,1);       %B������
nb=size(B,2);       %B������
C=zeros(ma,nb);     %Ԥ�������C���ڴ� 
if(na==mb)
    for i=1:ma
        for j=1:nb
            C(i,j)=C(i,j)+A(i,j)*B(j,i);
        end
    end
else
    display('Input error!');
end
end

