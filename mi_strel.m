%% funcion de strel   
%% creacion de elemento estructurante para la el filtro de la imagen ( cruz, disco,diamante,rombica,etc..)
function y = mi_strel(tipo,tamano)

switch tipo
    case 'square'
        y=ones(tamano);
    case 'lineV'
        y(1:tamano,1) = 1;
    case 'lineH'
        y(1,1:tamano) = 1;
    case 'cross'
        y =zeros(tamano);
        y(:,round(tamano/2)) = 1;
        y(round(tamano/2),:) = 1;
end
y=logical(y);
end
