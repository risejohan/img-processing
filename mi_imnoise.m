function Ir=mi_imnoise(I,tipo,n)

        switch lower(tipo)
%% Average    
            case 1
            [fils cols]=size(I);
            pixeles= fils*cols*n;
            graynoise=I;
                    for n=1: pixeles

                            x= randi([1 fils],1,1);
                            y= randi([1 cols],1,1);
                                if randi([0 1],1,1)==0
                                   graynoise(x,y)=0;
                                else
                                   graynoise(x,y)=255;
                                end
                               
                    end
                     Ir=graynoise;
%% gaussian       
            case 2 
                s=0.5;
                n=3;
                m=(n-1)/2;
                [x,y]=meshgrid(-m:m,-m:m);
                r=imnoise(I,'gaussian',5/255);
                z=(1/(2*pi*s^2))*exp(-(x.^2+y.^2)/(2*s^2));
                za=z./sum(z(:)');
                Ir=imfilter(r,za);    
                  
end