function img=mi_rgb2gray(RGB)

figure(1)
imshow(RGB)

R=RGB(:,:,1)*0.299;
G=RGB(:,:,1)*0.587;
B=RGB(:,:,1)*0.114;

img=uint8(R+G+B);
figure(2)
imshow(img)
end