
close all; clear all; clc;
RGB = imread('manzana.jpg');


figure(1)
imshow(RGB)

figure(2)
gray=my_adjust(RGB,0,255,0,255,0.5);
imshow(gray)

