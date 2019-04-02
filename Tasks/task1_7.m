%
%
function Dmap = task1_7(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  MAT_ClusterCentres: MAT filename of cluster centre matrix
%  MAT_M     : MAT filename of mean vectors of (K+1)-by-D, where K is
%              the number of classes (which is 10 for the MNIST data)
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specify the position of the plane
%  nbins     : scalar (integer) to specify the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

load(MAT_ClusterCentres, 'C');
load(MAT_M, 'M');
load(MAT_evals, 'EVals');
load(MAT_evecs, 'EVecs');

% size is 11x784, M(11,:) is the mean of all digits
[sizeMean, ~] = size(M); 

% we only need the first two eigenvectors (aka the new PCA basis)
EVecs = EVecs(:, 1:2); 
 
Mx = (M(sizeMean,:) - posVec) * EVecs(:,1); % x is 1st principal component of the mean
My = (M(sizeMean,:) - posVec) * EVecs(:,2); % y is 2nd principal component of the mean

std_x = sqrt(EVals(1)); % std deviation is square root of variance, x is 1st principal component
std_y = sqrt(EVals(2)); % std deviation is square root of variance, y is 2nd principal component

Xplot = linspace(Mx - 5 * std_x, Mx + 5 * std_x, nbins)';
Yplot = linspace(My - 5 * std_y, My + 5 * std_y, nbins)';

% Obtain the grid vectors for the two dimensions

[Xv, Yv] = meshgrid(Xplot, Yplot);
gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point.

X = (EVecs * gridX')' + posVec; % X is PCA matrix of every point on grid, at the position specified by the position vector
% gridX' 40000x2 has all the x coordinates on the first row, all the y coordinates on the
% second row

% (EVecs * gridX') 784x40000 applies PCA to all points on the grid by moving all
% points to new basis determined by 2 axes (the 2 eigenvectors of the covariance matrix)
% NB Now the matrix needs to be transposed, as points are now represented
% as columns

Dist = zeros(size(C,1), size(X, 1));
for j = 1:size(C,1)
    Dist(j, :) = square_dist(X, C(j, :)); % distance from every point on grid to cluster j
end
[~, idx] = min(Dist);

if(size(idx, 2)~=1)
    Dmap = reshape(idx, nbins, nbins);
else
    Dmap = reshape(ones(size(Dist, 1), size(Dist, 2)), nbins, nbins); %only one centre
end

Xplot = linspace(Mx + 5 * std_x, Mx - 5 * std_x, nbins)';
Yplot = linspace(My + 5 * std_y, My - 5 * std_y, nbins)';

figure;
[~,h] = contourf(Xplot, Yplot, Dmap);
set(h,'LineColor','none');

end