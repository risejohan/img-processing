function gray=mi_rgb2gray(RGB,metodo);
%Convierte imagen en escala de grises

[filas columnas capas] = size(RGB);
metodo=lower(metodo);
%%%% promedio%%%%%%
if metodo == 'p'
    gray = (RGB(:,:,1)+RGB(:,:,2)+RGB(:,:,3))/3;
end
%%%%maximos y minimos %%%%%%
if metodo == 't'
    for i=2:filas
        for j=1:columnas
            maximo(i,j)=max([RGB(i,j,1),RGB(i,j,2),RGB(i,j,3)]);
            minimo(i,j)=min([RGB(i,j,1),RGB(i,j,2),RGB(i,j,3)]);
        end
    end
    gray = (maximo+minimo)/2;
end

if metodo == 'l'    %%%%% luminancia %%%%

gray = uint8(0.299*RGB(:,:,1)+0.587*RGB(:,:,2)+0.114*RGB(:,:,3));

end
end
