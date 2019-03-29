%
%
function Dmap = task2_2(Xtrain, Ytrain, k, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  X   : M-by-D data matrix (double)
%  k   : scalar (integer) - the number of nearest neighbours
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) - the number of bins for each PCA axis
% Output:
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

X = Xtrain;
N = length(X);

% Mean shift the original matrix
X = bsxfun(@minus, X, posVec);

% retreieve the eigenvectors and eigenvalues
% PC are the principal components, i.e. eigenvectors
% and V are the corresponding eigenvalues
PC = cell2mat(struct2cell(load(MAT_evecs)));
%V = cell2mat(struct2cell(load(MAT_evals)));

PC_X = X * PC;
A = PC_X(:, 1:2);

K = 10; % Number of classes
C = kmeans(A, K); % Class labels for each training point
Xplot = linspace(-10, 10, nbins)';
Yplot = linspace(-6, 6, nbins)';

% Obtain the grid vectors for the two dimensions
[Xv, Yv] = meshgrid(Xplot, Yplot);
gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point.

classes = length(Xv(:));
for i = 1:length(gridX) % Apply k-NN for each test point
dists = square_dist(A, gridX(i, :)); % Compute distances
[~, I] = sort(dists, 2, 'ascend');
classes(i) = mode(C(I(1:k)));
end

figure;
% This function will draw the decision boundaries
[CC,h] = contourf(Xplot(:), Yplot(:), reshape(classes, length(Xplot), length(Yplot)));
set(h,'LineColor','none');
end
