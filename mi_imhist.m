%%Histograma%
function h=mi_imhist(R)
[filas,columnas]= size(R);
h=zeros(1,256);   

for i=1:filas
    for j=1:columnas
        h(R(i,j)+1) = h(R(i,j)+1)+1;
    end
end

h1=h/(filas*columnas);
bar([1:256],h1);
axis tight;
title('histograma')

end