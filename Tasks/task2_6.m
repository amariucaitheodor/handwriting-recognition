%
%
function Dmap = task2_6(X, Y, epsilon, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  X        : M-by-D data matrix (double)
%  Y        : M-by-1 label vector (uint8)
%  epsilon  : scalar (double) for covariance matrix regularisation
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec   : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) denoting the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

load(MAT_evals, 'EVals');
load(MAT_evecs, 'EVecs');

% we only need the first two eigenvectors (aka the new PCA basis)
EVecs = EVecs(:, 1:2); 

std_x = sqrt(EVals(1)); % std deviation is square root of variance, x is 1st principal component
std_y = sqrt(EVals(2)); % std deviation is square root of variance, y is 2nd principal component

Xplot = linspace(- 5 * std_x, 5 * std_x, nbins)';
Yplot = linspace(- 5 * std_y, 5 * std_y, nbins)';

% Obtain the grid vectors for the two dimensions

[Xv, Yv] = meshgrid(Xplot, Yplot);
gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point.

% X 40000x784 is PCA matrix of every point on grid, at the position specified by the position vector
T = (EVecs * gridX')' + posVec;

% gridX' 40000x2 has all the x coordinates on the first row, all the y coordinates on the
% second row. It is a 2D plot of points

% (EVecs * gridX') 784x40000 moves all points on the grid to new basis
% determined by 2 axes in 784 dimensions
% NB Now the matrix needs to be transposed, as points are now represented
% as columns

[Ypreds1, ~, ~] = run_gaussian_classifiers(X, Y, T(1:(size(T,1)/5), :), epsilon);
[Ypreds2, ~, ~] = run_gaussian_classifiers(X, Y, T((size(T,1)/5)+1:2*(size(T,1)/5), :), epsilon);
[Ypreds3, ~, ~] = run_gaussian_classifiers(X, Y, T(2*(size(T,1)/5)+1:3*(size(T,1)/5), :), epsilon);
[Ypreds4, ~, ~] = run_gaussian_classifiers(X, Y, T(3*(size(T,1)/5)+1:4*(size(T,1)/5), :), epsilon);
[Ypreds5, ~, ~] = run_gaussian_classifiers(X, Y, T(4*(size(T,1)/5)+1:5*(size(T,1)/5), :), epsilon);
Ypreds = cat(1, Ypreds1, Ypreds2, Ypreds3, Ypreds4, Ypreds5);
Dmap = reshape(Ypreds, nbins, nbins);
Xplot = linspace(5 * std_x, -5 * std_x, nbins)';
Yplot = linspace(5 * std_y, -5 * std_y, nbins)';

figure;
[~,h] = contourf(Xplot, Yplot, Dmap);
set(h,'LineColor','none');
end
