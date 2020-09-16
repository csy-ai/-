function [IAt,JAt,AAt] =sparse_transform(IA,JA,AA,m,n)
%ʵ��ϡ������ת��

nz=size(AA,2);  %ϡ��������Ԫ�ĸ���

%��ʼ������IAt,JAt,AAt
IAt=zeros(1,nz);
JAt=zeros(1,nz);
AAt=zeros(1,nz);

%ͳ�ƾ���A���еķ���Ԫ����
for i=1:nz;
    k=JA(i);
    IAt(k+1)=IAt(k+1)+1;
end

%ͨ���ۼ����ɾ���A'��������IAt
IAt(1)=1;
for i=1:n
    IAt(i+1)=IAt(i+1)+IAt(i);
end

%����Ԫ��ѭ��������A'��JAt��AAt����
for i=1:m
    for j=IA(i):IA(i+1)-1
        k=JA(j);
        JAt(IAt(k))=i;
        AAt(IAt(k))=AA(j);
        IAt(k)=IAt(k)+1;
    end
end

%��ԭ����IAt
for i=n:-1:2
    IAt(i)=IAt(i-1);
end
IAt(1)=1;
end

