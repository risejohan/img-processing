function V=tamano(A)

R=A(:,:,1);
G1=mi_resize(R);

G=A(:,:,2);
G2=mi_resize(G);

B=A(:,:,3);
G3=mi_resize(B);



[filas columnas capas]=size(G1);
nueva=zeros(filas,columnas,capas);
nueva(:,:,1)=G1;
nueva(:,:,2)=G2;
nueva(:,:,3)=G3;
nueva(:,:,1)=G1;
V=uint8(nueva);
figure(2)
imshow(V)
end