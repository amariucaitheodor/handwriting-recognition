function [Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar variable (double) for covariance regularisation
% Output:
%  Ypreds : N-by-1 matrix (uint8) of predicted labels for Xtest
%  Ms     : K-by-D matrix (double) of mean vectors
%  Covs   : K-by-D-by-D 3D array (double) of covariance matrices

%YourCode - Bayes classification with multivariate Gaussian distributions.

N=size(Xtest, 1);
D = size(Xtrain, 2);

% ML estimate of the parameters for Gaussians distribution
% Estimate means and covariances for each class k
Ms = zeros(D, 10);
Covs = zeros(D,D,10);

for k = 1:10
    Ms(:,k) = myMean(Xtrain(Ytrain==k-1, :));
    Covs(:, :, k) = myCov(Xtrain(Ytrain==k-1, :)) + epsilon * eye(D); % normalized by N, biased
end

% Compute posterior probabilities for the test samples, in the log domain
post_log = zeros(N, 10);
for k = 1:10
    mu = Ms(:,k);
    sigma = Covs(:,:,k);
    diffMat = Xtest' - repmat(mu, 1, N);
    post_matrix = - 0.5 * diffMat' * inv(sigma) * diffMat - 0.5 * logdet(sigma);
    post_log(:,k) =  diag(post_matrix);
end

% NB: No need to include the prior probability to compute the posterior
%     probability, since we assume a uniform prior distribution over
%     classes!

% Assign each data point to the class with the highest probability, stores in variable class_pred
[~, Ypreds] = max(post_log, [], 2);
Ypreds = Ypreds - ones(size(Ypreds, 1), size(Ypreds, 2)); % subtract 1 to obtain digits from classes

end
