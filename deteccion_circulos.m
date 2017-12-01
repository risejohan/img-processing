%%  Figura para otro tipo de ojo, usando filtro imfilter.
I = imread('ojo.jpg');
figure(2)
subplot(1,2,1)
imshow(I)
title('Imagen original') 
k1=fspecial('laplacian');
% k=[-1 -1 -1; -1 8 -1 ;-1 -1 -1]
f1=imfilter(I,k1);  
figure(2)
subplot(1,2,2)
imshow(f1) 
title('Deteccion del ojo')

[centro1,radio1,metric1] = imfindcircles(I,[3 60],'ObjectPolarity','dark');
[centro2,radio2,metric2] = imfindcircles(I,[3 90],'ObjectPolarity','dark');
viscircles(centro1, radio1,'EdgeColor','b');
viscircles(centro2, radio2,'EdgeColor','r');

%% Figura para otro tipo de ojo, usando filtro media.
RGB = imread('ojazo.jpg');
figure(1) 
subplot(1,2,1)
imshow(RGB)
title('Imagen Original')
hold on
% % k=fspecial('laplacian'); en caso de imfilter
f=mi_medfilt2(RGB,[3 3]);
figure(1)
subplot(1,2,2)
imshow(f) 
title('Deteccion en el ojo')

[centro3,radio3,metric3] = imfindcircles(RGB,[10 28],'ObjectPolarity','dark');
[centro4,radio4,metric4] = imfindcircles(RGB,[4 18],'ObjectPolarity','dark');
viscircles(centro3, radio3,'EdgeColor','b');
viscircles(centro4, radio4,'EdgeColor','r');