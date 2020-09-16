function[QC,RC] = CIGS(A)
%生成矩阵A的施密特正交化的Q,R矩阵
%   由键盘来输入矩阵A的规模
n=size(A,2);
for j=1:n
    QC(:,j)=A(:,j);
    for i=1:j-1
     RC(i,j)=QC(:,i)'*A(:,j);
     QC(:,j)=QC(:,j)-RC(i,j)*QC(:,i);
    end
    RC(j,j)=norm(QC(:,j),2);
    QC(:,j)=QC(:,j)/RC(j,j);
end

