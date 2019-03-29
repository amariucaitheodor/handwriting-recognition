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
load(MAT_M, 'M')
load(MAT_evals, 'EVals');
load(MAT_evecs, 'EVecs');

sizeMean = size(M);

Mx = (M(sizeMean(1),:) - posVec) * EVecs(:,1);
My = (M(sizeMean(1),:) - posVec) * EVecs(:,2);

sizeC = size(C);
std_x = sqrt(EVals(1));
std_y = sqrt(EVals(2));

A = zeros(sizeC(1),2);
for c = 1:sizeC
    A(c,1) = C(c,:) * -1 * EVecs(:,1);
    A(c,2) = C(c,:) * -1 * EVecs(:,2);
end

Xplot = linspace(Mx - 5 * std_x, Mx + 5 * std_x, nbins)';
Yplot = linspace(My - 5 * std_y, My + 5 * std_y, nbins)';

% Obtain the grid vectors for the two dimensions

[Xv, Yv] = meshgrid(Xplot, Yplot);
gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point.
Dmap = length(Xv(:));

for i = 1:length(gridX) % Apply k-NN for each test point
    dists = square_dist(A, gridX(i, :))'; % Compute distances
    [~, I] = min(dists);
    Dmap(i) = I;
end

figure;
% This function will draw the decision boundaries
cmap = [0.80369089, 0.61814689, 0.46674357;
        0.81411766, 0.58274512, 0.54901962;
        0.58339103, 0.62000771, 0.79337179;
        0.83529413, 0.5584314 , 0.77098041;
        0.77493273, 0.69831605, 0.54108421;
        0.72078433, 0.84784315, 0.30039217;
        0.96988851, 0.85064207, 0.19683199;
        0.93882353, 0.80156864, 0.4219608;
        0.83652442, 0.74771243, 0.61853136;
        0.7019608 , 0.7019608 , 0.7019608];
[~,h] = contourf(Xplot(:), Yplot(:), reshape(Dmap, length(Xplot), length(Yplot)));
set(h,'LineColor','none');
colormap(cmap);

end