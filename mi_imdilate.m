%%  funcion para dilatar la imagen %% 

function In=mi_imdilate(I)


Ig=rgb2gray(I);
T=graythresh(Ig);
bin=im2bw(Ig,T);

    G=mi_strel('cross',21);

    bw =imdilate(I,G);

Te=graythresh(bw);
bin2=im2bw(bw,Te);

figure(1)
imshow(bin)

figure(2)
imshow(bw)

figure(3)
imshow(bin2)


end
