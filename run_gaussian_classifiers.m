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

for class = 1:10
    Ms(:,class) = myMean(Xtrain(Ytrain==class-1, :));
    Covs(:, :, class) = myCov(Xtrain(Ytrain==class-1, :)) + epsilon * eye(D); % normalized by N, biased
end

prior = [sum(Ytrain(:) == 0) sum(Ytrain(:) == 1) sum(Ytrain(:) == 2) sum(Ytrain(:) == 3) sum(Ytrain(:) == 4) sum(Ytrain(:) == 5) sum(Ytrain(:) == 6) sum(Ytrain(:) == 7) sum(Ytrain(:) == 8) sum(Ytrain(:) == 9)];
prior = prior ./ size(Xtrain,1);

% Compute posterior probabilities for the test samples, in the log domain
post_log = zeros(N, 10);
test_prob = zeros(N, 10);
for class = 1:10
    mu = Ms(:,class);
    sigma = Covs(:,:,class);
    diffMat = Xtest' - repmat(mu, 1, N);
    post_matrix = - 0.5 * diffMat' * inv(sigma) * diffMat - 0.5 * logdet(sigma);
    post_log(:,class) =  diag(post_matrix);
    
    % Adding the log of the prior to get the joint probability slightly
    % increases performance
    test_prob(:,class) = post_log(:,class) + log(prior(class));
end

% Assign each data point to the class with the highest probability, stores in variable class_pred
[~, Ypreds] = max(test_prob, [], 2);
Ypreds = Ypreds - ones(size(Ypreds, 1), size(Ypreds, 2)); % subtract 1 to obtain digits from classes

end
