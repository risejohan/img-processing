% correlacion de una ventana con el tamaño de la imagen.

function T=mi_imfilter(gris,K)
% RGB=imread('pendulo.jpg');
% gray=rgb2gray(RGB);
% imshow(gray)
% figure(1)
% imshow(gray)
% 
% gris=rgb2gray(RGB);
T = gris;
[M N]=size(gris);
% sz=10;
% K=fspecial('average',5)% crea una matriz 5x5 y la divide por 1/25 es decir la matriz al cuadrado.
[m n]=size(K);
    for i=(m+1)/2:m:M-((m+1)/2)-1
        for j= ((n+1)/2):n:N-(((n+1)/2)-1)
    
            V=gris(i-(m-1)/2:i+(m-1)/2,j-(n-1)/2:j+(n-1)/2);
            S=double(V).*K;
            T(i,j)= sum(S(:)); 
            
        end
    end

end
