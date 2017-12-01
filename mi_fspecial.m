function k=mi_fspecial(tipo,n,sigma)

if nargin==1
    n=3;
    sigma=0.5;
elseif nargin==2
    sigma=0.5;
end

switch(tipo)
    case 1 'average'
        k=ones(n)/n^2;
        
    case 2 'gaussian'
        lim=(n-1)/2;
        [x,y]=meshgrid(-lim:lim,-lim:lim);
        k=(1/(2*pi*sigma^2))*exp(-(x.^2+y.^2)/(2*sigma^2))
        k=k./ sum(k(:)');
        
end