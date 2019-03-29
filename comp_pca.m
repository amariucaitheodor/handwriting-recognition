function [EVecs, EVals] = comp_pca(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   EVecs: D-by-D matrix (double) contains all eigenvectors as columns
%       NB: follow the Task 1.3 specifications on eigenvectors.
%   EVals:
%       Eigenvalues in descending order, D x 1 vector (double)
%   (Note that the i-th columns of Evecs should corresponds to the i-th element in EVals)
  
[V,D] = eig(myCov(X));
for i=1:size(V,2)
    if V(1,i) < 0
        V(:,i) = (-1) * V(:,i);
    end
end
[~,ind] = sort(diag(D),'descend'); %ind is a vector indicating descendent indices in diagonal vector D
EVecs = V(:,ind);
EVals = diag(D(ind,ind));
end

