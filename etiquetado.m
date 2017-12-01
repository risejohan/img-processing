% Etiquetado, clasificacion,
I = imread('tools.jpg');
RGB=rgb2gray(I);
imshow(RGB)
 T=graythresh(RGB); %Para encontrar el umbral para convertir 0 o 1
bin=im2bw(RGB,T);
b=~bwareaopen(bin,250);  % Cambiar el fondo para hacer el fondo negro y encontrar los elementos.
figure(1)
imshow(b);

[etiquetas,N]=bwlabel(b,4);
figure(2)
imshow(etiquetas);   

l=label2rgb(etiquetas);
figure(3) 
imshow(l)

tool=2;
seleccion=etiquetas==tool;  
figure(4)
imshow(seleccion)

herramienta=I;
herramienta(:,:,1)=uint8(seleccion).*I(:,:,1);
herramienta(:,:,2)=uint8(seleccion).*I(:,:,2);  
herramienta(:,:,3)=uint8(seleccion).*I(:,:,3);
figure(5)
imshow(herramienta)


propiedad=regionprops(seleccion,'Area','Perimeter','EulerNumber','BoundingBox','Centroid','MajorAxisLength','MinorAxisLength','ConvexHull');
x0=round(propiedad.ConvexHull(:,1));
y0=round(propiedad.ConvexHull(:,2));
% w=round(propiedad.BoundingBox(3));
% h=round(propiedad.BoundingBox(4));
 hold on
% plot(x0,y0,'r+')
% rectangle('Position',round(propiedad.BoundingBox),'Edgecolor','red');
% 
loglog(x0,y0);

