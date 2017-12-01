%% imopen
function H=mi_imopen(I)

G=mi_strel('cross',3)
Y=imerode(I,G);
H=mi_strel('cross',19)
X=imdilate(Y,H);


figure(10)
imshow(X)
title('Imagen opening')

figure(6)
imshow(I)
title('Imagen original')
end