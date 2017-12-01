function Peaks = mi_houghpeaks(P,NumP)
if (nargin==1)
     NumP=1;
    end
[Fils Cols]=size(P);
N=NumP;
Peaks=zeros(N,2);
% Peaks=zeros(N,3);
for k=1:N
    ValorA=0;
    for i=1:Fils
        for j=1:Cols
            ValorN=P(i,j);
                if (ValorN>ValorA)
                Peaks(k,1)=i;
                Peaks(k,2)=j;
%                 Peaks(k,3)=ValorN;
                ValorA=ValorN;
                end
        end
    end
    P(Peaks(k,1),Peaks(k,2))=0;
    end
end


