function In2=mi_resize(A)

[Ri Ci layer]=size(A)
Sx=328/Ri;
Sy=944/Ci;

T=[Sx 0 0; 0 Sy 0; 0 0 1];

P=T*[Ri;Ci;layer];

Rf=floor(P(1)); %Se hizo un cambio, tenerlo en cuenta.
Cf=floor(P(2));
In=uint8(zeros(Rf,Cf,3));

for i=1:Rf
   for j=1:Cf
       Pn=inv(T)*[i;j;1];
       x=ceil(Pn(1));
       y=ceil(Pn(2));
       In2(i,j)=A(x,y);       
   end
end
In2=In2;
imshow(In2)
end