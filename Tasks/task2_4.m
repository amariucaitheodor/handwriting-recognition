%
%
function [Corrs] = task2_4(Xtrain, Ytrain)
% Input:
%  Xtrain : M-by-D data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for X
% Output:
%  Corrs  : (K+1)-by-1 vector (double) of correlation $r_{12}$ 
%           for each class k = 1,...,K, and the last element holds the
%           correlation for the whole data, i.e. Xtrain.

[PC, ~] = comp_pca(Xtrain);
Corrs = zeros(11,1);
X = Xtrain * PC(:,1:2); % Transform X to the data in the 2D space spanned by the first two principal components.

for class=1:10
    % correlation between x's and y's for each class
   Corrs(class,1) = corr2(X(Ytrain==class-1, 1), X(Ytrain==class-1, 2)); 
end
Corrs(11,1) = corr2(X(:, 1), X(:, 2));

end
