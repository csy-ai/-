function [qpnt , weight] = QuadPnt2D(order) 
switch order 
    case 1 
        npnt=1; 
        qpnt=zeros(npnt , 2); 
        weight=zeros(npnt ,1); 
        qpnt(1, 1)=1.0/3.0; 
        qpnt(1, 2)=1.0/3.0; 
        weight(1)=1.0/2.0; 
    case 2 
        npnt=3; 
        qpnt=zeros(npnt , 2); 
        weight=zeros(npnt ,1); 
        qpnt(1, 1)=2.0/3.0;
        qpnt(1, 2)=1.0/6.0; 
        qpnt(2, 1)=1.0/6.0; 
        qpnt(2, 2)=1.0/6.0; 
        qpnt(3, 1)=1.0/6.0; 
        qpnt(3, 2)=2.0/3.0; 
        weight(1)=1.0/6.0; 
        weight(2)=1.0/6.0; 
        weight(3)=1.0/6.0; 
    case 3 
        npnt=4; 
        qpnt=zeros(npnt , 2); 
        weight=zeros(npnt ,1); 
        qpnt(1, 1)=1.0/3.0; 
        qpnt(1, 2)=1.0/3.0;
        qpnt(2, 1)=3.0/5.0; 
        qpnt(2, 2)=1.0/5.0; 
        qpnt(3, 1)=1.0/5.0; 
        qpnt(3, 2)=1.0/5.0; 
        qpnt(4, 1)=1.0/5.0; 
        qpnt(4, 2)=3.0/5.0; 
        weight(1)=-27.0/96.0;
        weight(2)=25.0/96.0; 
        weight(3)=25.0/96.0; 
        weight(4)=25.0/96.0;
end
end


