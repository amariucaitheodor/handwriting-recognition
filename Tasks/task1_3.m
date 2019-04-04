%
%
function [EVecs, EVals, CumVar, MinDims] = task1_3(X)
% Input:
%  X : M-by-D data matrix (double)
% Output:
%  EVecs, Evals: same as in comp_pca.m
%  CumVar  : D-by-1 vector (double) of cumulative variance
%  MinDims : 4-by-1 vector (integer) of the minimum number of PCA dimensions
%            to cover 70%, 80%, 90%, and 95% of the total variance.

[EVecs, EVals] = comp_pca(X);
CumVar = cumsum(EVals);
figure
plot((0:783),CumVar);
xlabel('# of principal components');
ylabel('Cumulative variance');
%print(figure(1), '-bestfit', '/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task3/task1_3_graph.pdf', '-dpdf');

CumVarPercent = CumVar/sum(EVals);
MinDims = zeros(4,1);
for i=1:size(CumVarPercent,1)
    if CumVarPercent(i)>=0.7*CumVarPercent(size(CumVarPercent,1)) && MinDims(1)==0
        MinDims(1) = i;
    end
    
    if CumVarPercent(i)>=0.8*CumVarPercent(size(CumVarPercent,1)) && MinDims(2)==0
        MinDims(2) = i;
    end
    
    if CumVarPercent(i)>=0.9*CumVarPercent(size(CumVarPercent,1)) && MinDims(3)==0
        MinDims(3) = i;
    end
    
    if CumVarPercent(i)>=0.95*CumVarPercent(size(CumVarPercent,1)) && MinDims(4)==0
        MinDims(4) = i;
    end 
end

end
