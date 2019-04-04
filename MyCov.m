function [Cov] = MyCov(X)
M = bsxfun(@minus, X, MyMean(X));
Cov = M'*M/(size(M,1)-1);
end