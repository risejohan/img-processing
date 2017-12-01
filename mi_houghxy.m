function [P Theta Rho] = mi_houghxy(Ibin,R1,R2)
    if nargin==1
     R1=-90;
     R2=89;
    end
    Lim1=R1;
    Lim2=R2;

    [Fils Cols]=size(Ibin);
    hipo=ceil(sqrt(Fils*Fils+Cols*Cols));
    Theta=Lim1:Lim2;
    Num=numel(Lim1:Lim2);
    ThetaRad=(pi/180).*Theta;
    P=zeros(Num,hipo+Fils);
    
    for i=1:Fils
        for j=1:Cols
         Punto=Ibin(i,j);
            if (Punto>0)
                for h=1:Num
                Rho=ceil(j*cos(ThetaRad(h))+i*sin(ThetaRad(h)));
                P(h,Rho+Fils)=P(h,Rho+Fils)+1;
                end 
            end
        end
    end
    P=flipud(P);
end

