function[y]=mmv(b)
%ʵ�־���A������b�ĳ˻�
A=importdata('sy.mat');  %����m*nάA����
m=size(A,1);       %A������
n=size(A,2);       %A������
y=zeros(m,1);      %Ԥ��������y���ڴ� 
%�ж�����b��������Ҫʵ��������ˣ����뱣֤A��������b���������
brows=size(b,1);   %b������ 
if brows==n
    for i=1:m
       y(i,1)=A(i,:)*b;
    end
else
    display('Input error!');
end
    