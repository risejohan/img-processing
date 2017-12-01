% radio
function res =mi_mask(m,n,r) 
[x y]=meshgrid(-m:m,-n:n);
mask= (x.^2)+(y.^2)<r;
imshow(mask)
end  