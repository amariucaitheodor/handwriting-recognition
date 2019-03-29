function [Cov] = myCov(X)
M = bsxfun(@minus, X, myMean(X));
Cov = M'*M/(size(M,1)-1);
end