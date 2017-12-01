%%%low in= Emin----high in= Emax--- low out== Smin--- n= gama%%%%%

function J = my_adjust(I,low_in,high_in,low_out,high_out,n)

[filas,columnas,capas] = size(I);

li = isscalar(low_in);%% convierte el vector en un numero escalar%%
hi = isscalar(high_in);
lo = isscalar(low_out);
ho = isscalar(high_out);
nt = isscalar(n);
rgb = 0;
if capas > 1
    rgb = 1;
    if li == 0
        rli1 = low_in(:,1);
        rli2 = low_in(:,2);
        rli3 = low_in(:,3);
    else
        rli1 = low_in;
        rli2 = low_in;
        rli3 = low_in;
    end
    
    if hi == 0
        rhi1 = high_in(:,1);
        rhi2 = high_in(:,2);
        rhi3 = high_in(:,3);
    else
        rhi1 = high_in;
        rhi2 = high_in;
        rhi3 = high_in;
    end
    
    if lo == 0
        rlo1 = low_out(:,1);
        rlo2 = low_out(:,2);
        rlo3 = low_out(:,3);
    else
        rlo1 = low_out;
        rlo2 = low_out;
        rlo3 = low_out;
    end
    
    if ho == 0
        rho1 = high_out(:,1);
        rho2 = high_out(:,2);
        rho3 = high_out(:,3);
    else
        rho1 = high_out;
        rho2 = high_out;
        rho3 = high_out;
    end
    
    if nt == 0
        rn1 = n(:,1);
        rn2 = n(:,2);
        rn3 = n(:,3);
    else
        rn1 = n;
        rn2 = n;
        rn3 = n;
    end
    
    j1 = I(:,:,1);
    j2 = I(:,:,2);
    j3 = I(:,:,3);
end

Eminf = find(I <= low_in);
I(Eminf) = low_in;

Emaxf = find(I > high_in);
I(Emaxf) = high_in;

Sminf = find(I < low_out);
I(Sminf) = low_out;

Smaxf = find (I > high_out);
I(Smaxf) = high_out;


if rgb == 0 
    J = uint8(((high_out - low_out)/(high_in - low_in)^n)*((double(I)-low_in)).^n + low_out);
else
    k1 = uint8(((rho1 - rlo1)/(rhi1 - rli1)^rn1)*((double(j1)-rli1)).^rn1 + rlo1);
    k2 = uint8(((rho2 - rlo2)/(rhi2 - rli2)^rn2)*((double(j2)-rli2)).^rn2 + rlo2);
    k3 = uint8(((rho3 - rlo3)/(rhi3 - rli3)^rn3)*((double(j3)-rli3)).^rn3 + rlo3);
    
    J(:,:,1) = k1;
    J(:,:,2) = k2;
    J(:,:,3) = k3;
end
