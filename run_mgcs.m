function [Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar parameter for regularisation (double)
%   L      : scalar (integer) of the number of Gaussian distributions per class
% Output:
%  Ypreds : N-by-1 matrix of predicted labels for Xtest (integer)
%  MMs     : (L*K)-by-D matrix of mean vectors (double)
%  MCovs   : (L*K)-by-D-by-D 3D array of covariance matrices (double)

N=size(Xtest, 1);
D = size(Xtrain, 2);

% ML estimate of the parameters for Gaussians distribution
% Estimate means and covariances for each class k
MMs = zeros(D, L*10);
MCovs = zeros(D,D,L*10);

prior = [sum(Ytrain(:) == 0) sum(Ytrain(:) == 1) sum(Ytrain(:) == 2) sum(Ytrain(:) == 3) sum(Ytrain(:) == 4) sum(Ytrain(:) == 5) sum(Ytrain(:) == 6) sum(Ytrain(:) == 7) sum(Ytrain(:) == 8) sum(Ytrain(:) == 9)];
prior = prior ./ size(Xtrain,1);

% Compute posterior probabilities for the test samples, in the log domain
test_prob = zeros(N, 10*L); % ALL probabilities of the 10*L classes
for k = 1:10
    classSubset = Xtrain(Ytrain==k-1, :); 
    
    % divide class k in L groups 
    [~, Assignments, ~] = my_kMeansClustering(classSubset, L, classSubset(1:L, :));
    
    % find gaussian distribution for each group l of class k
    for l=1:L
        group = classSubset(Assignments==l, :);
        MMs(:, (k-1)*L+l) = myMean(group)';
        mu = MMs(:, (k-1)*L+l);
        MCovs(:, :, (k-1)*L+l) = myCov(group) + epsilon * eye(D);
        sigma = MCovs(:, :, (k-1)*L+l);
        diffMat = Xtest' - repmat(mu, 1, N);
        post_matrix = - 0.5 * diffMat' * inv(sigma) * diffMat - 0.5 * logdet(sigma);
        post_log =  diag(post_matrix);
        
        % Adding the log of the prior to get the joint probability slightly
        % increases performance
        test_prob(:,(k-1)*L+l) = post_log + log(prior(k));
    end

end

% Assign each data point to the class with the highest probability, stores in variable class_pred
[~, Ypreds] = max(test_prob, [], 2); % max value of each row
Ypreds = floor((Ypreds - 1) ./ L); % straight from classes k*L to digits 0-9

end
