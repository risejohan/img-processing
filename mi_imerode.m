%%  funcion para erosionar la imagen %% 

function bin2=mi_imerode(I)
   
Ig=rgb2gray(I);
%T=graythresh(Ig);
bin=~im2bw(Ig,0.38);
[r c layer] = size(I);

se=mi_strel('cross',5);

[N M]= size(se);
se = logical(se);

ri = (N+1)/2;
ci = (M+1)/2;
lri = ri-1;
lci = ci-1;


for i = ri:r-ri-1
    for j= ci:c-ci-1
        P = bin(i-lri:i+lri,j-lci:j+lci);
        bin2(i,j) = (all(P(se)));
    end
end

figure(1)
imshow(bin) 
title('Imagen binarizada')


figure(2)
imshow(~bin2)
title('Imagen erosionada')

end

