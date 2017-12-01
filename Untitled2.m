clc;clear all;close all;
A=imread('Prueba.jpg');
H=tamano(A);
Im=rgb2gray(A);
fftimg=fftshift(fft2(Im));
fftimgabs=abs(fftimg);
fftimgabsshift=abs(fft(fftimgabs));
imagesc(log10(1+fftimgabs))
E=log10(1+fftimgabsshift);
imagesc(E)
colormap(hot)
r=60;
r1=0;
m=471.5;
m1=471.5; 
n=163.5; 
n1=163.5;
[x y]=meshgrid(-m:m,-n:n);
mask= double((x.^2)+(y.^2)<r.^2);
[x1 y1]=meshgrid(-m1:m1,-n1:n1);
 mask2= double((x1.^2)+(y1.^2)<r1.^2);
 G=mask+(~mask2);
  
 w=mask.*fftimg;
inv=ifft2(w);
imshow(abs(inv),[])