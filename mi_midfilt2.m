
function In=mi_midfilt2(I,vecindad)

[r c capas] = size(I);

In= uint8(zeros(r,c));
N = vecindad(1);
M = vecindad(2);

ri = (N+1)/2; 
ci = (M+1)/2;
lri = ri-1;
lci = ci-1;

for i = ri:r-ri-1
            for j= ci:c-ci-1
                V = I(i-lri:i+lri,j-lci:j+lci);
                for a=1:ri
                    for b=1:ci
                        maximo(a,b) = max(V(:)');
                        minimo(a,b) = min(V(:)');
                    end
                end
                G(i,j)=(maximo(a,b)+minimo(a,b))/2;
            end
        end
        In =G;
        figure(2)
        imshow(G) 
end