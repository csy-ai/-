function[QM,RM] = MGS(A)
%���ɾ���A��ʩ������������Q,R����
%   �ɼ������������A�Ĺ�ģ
n=size(A,2);
for j=1:n
    QM(:,j)=A(:,j);
    for i=1:j-1
     RM(i,j)=QM(:,i)'*QM(:,j);
     QM(:,j)=QM(:,j)-RM(i,j)*QM(:,i);
    end
    RM(j,j)=norm(QM(:,j),2);
    QM(:,j)=QM(:,j)/RM(j,j);
end