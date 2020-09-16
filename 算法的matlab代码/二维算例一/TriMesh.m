function [pxy,ele,pBnd] = TriMesh(xmin , xmax , ymin , ymax , Nx, Ny)
% xmin , xmax , ymin , ymax: the domain Omega
% Nx: intervals in x direction
% Ny: intervals in y direction
dx = (xmax - xmin)/Nx;
dy = (ymax - ymin)/Ny;
npnt=(Nx + 1)*(Ny + 1);
nele=2*Nx*Ny;
pxy=zeros(npnt , 2);
pBnd=zeros(npnt ,1);
for i=1:Nx+1
    for j=1:Ny+1
        k=(i-1)*(Ny + 1) + j;
        pxy(k, 1)=xmin+(i-1)*dx; %顶点坐标x
        pxy(k, 2)=ymin+(j-1)*dy; %顶点坐标y
        if ((i-1)*(Nx+1 - i) == 0 || (j-1)*(Ny+1 - j) == 0)
            pBnd(k)=1; %边界点
        end
    end
end
ele=zeros(nele , 3); %单元信息，有哪三个顶点构成
for i=1:Nx
    for j=1:Ny
        k=(i-1)*Ny + j;
        ele(k, 1)=i*(Ny + 1)+j;
        ele(k, 2)=i*(Ny + 1)+j+1;
        ele(k, 3)=(i-1)*(Ny + 1)+j;
        ele(Nx*Ny+k, 1)=(i-1)*(Ny + 1)+j+1;
        ele(Nx*Ny+k, 2)=(i-1)*(Ny + 1)+j;
        ele(Nx*Ny+k, 3)=i*(Ny + 1)+j+1;
    end
end
end
