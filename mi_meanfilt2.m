%%%%%%%%%% filtro  %%%%%%%%%%%%%

function In=mi_meanfilt2(I,vecindad)

[r c layer] = size(I);


G = uint8(zeros(r,c));
N = vecindad;
M = vecindad;

ri = (N+1)/2;
ci = (M+1)/2;
lri = ri-1;
lci = ci-1;

for i = ri:r-ri-1
    for j= ci:c-ci-1
        V = I(i-lri:i+lri,j-lci:j+lci);
        G(i,j) =mean(V(:)');
    end
end
In = G;
imshow(G)
end