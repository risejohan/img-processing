%% imclose
function H=mi_imclose(I)

G=mi_strel('cross',3)
Y=imdilate(I,G);
H=mi_strel('cross',19)
X=imerode(Y,H);
 

figure(10)
imshow(X)
title('Imagen Closing')

figure(6)
imshow(I)
title('Imagen original')
end