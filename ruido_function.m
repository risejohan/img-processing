function Ir=imnoise(I,tipo;n)


disp(

else
    
    switch (lower(tipo))
        case ('salypimienta')
            puntos=file*cols*n;
            
            x=round(1+(file-1).*rand(puntos));
            y=round(1+(cols-1).*rand(puntos));
            In(x,y)=round(rand(1))*255;
            
        case('gaussiana')
         Ir=I+uint8(round(randn(file,cols)*n)   