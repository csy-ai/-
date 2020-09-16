%��������
xmin=-1.0;
xmax=1.0;
ymin=-1.0;
ymax=1.0;
%�ʷֹ���
Nx=2;
Ny=2;
%��������
[pxy,ele,pBnd] = TriMesh(xmin , xmax , ymin , ymax , Nx, Ny);
%���õ���ֵ��
uh = Poisson2d(pxy, ele, pBnd , @f2D);
%��������L2
L2Err=CalculateL2Error(pxy, ele, uh, @u2D);
fprintf('L2Err=%f\n', L2Err);

%������ͼ
n_pnt=size(pxy, 1);
for i=1:n_pnt
    x(i)=pxy(i,1);
    y(i)=pxy(i,2);
end
figure(1);
triplot(ele,x,y,'black');
title('Mesh');
%��ֵ����ͼ
figure(2);
n_ele=size(ele, 1);
for j=1:n_ele
    x=zeros(3,1);
    y=zeros(3,1);
    z=zeros(3,1);
    for i=1:3
        x(i)=pxy(ele(j, i),1);
        y(i)=pxy(ele(j, i),2);
        z(i)=uh(ele(j, i));
    end
    trisurf([1 2 3],x,y,z,'facecolor','interp');
    hold on
end
title('Numerical solution');
%������ͼ
figure(3);
n_ele=size(ele, 1);
for j=1:n_ele
    x=zeros(3,1);
    y=zeros(3,1);
    err=zeros(3,1);
    for i=1:3
        x(i)=pxy(ele(j, i),1);
        y(i)=pxy(ele(j, i),2);
        err(i)=uh(ele(j, i))-u2D(pxy(ele(j, i),:));
    end
    trisurf([1 2 3],x,y,err,'facecolor','interp');
    hold on
end
title('Error');
