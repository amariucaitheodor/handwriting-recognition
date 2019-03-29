function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
% Output:
%   Ypreds : N-by-L matrix (uint8) of predicted labels for Xtest

% distance between each test point and each training observation
% NOTE: we need the ’square_dist’ function from previous labs

testLen = size(Xtest, 1);
trainLen = size(Xtrain, 1);
distances = zeros(testLen, trainLen);

for point=1:size(Xtest)
    distances(point, :) = square_dist(Xtrain, Xtest(point,:));
end

Ypreds = zeros(size(Ks, 2), testLen);
for knns=1:size(Ks, 2)
    
    for point=1:testLen
        % Sort the distances in ascending order
        [dist,idx] = sort(distances(point, :), 2, 'ascend');

        % K nearest neighbors, e.g. Knn = 3
        Knn = Ks(knns); 

        % keep the first ’Knn’ distances
        dist = dist(1:Knn); 

        % keep the first ’Knn’ indexes
        idx = idx(1:Knn);

        % majority vote only on those ’Knn’ indexes
        Ypreds(knns, point) = mode(Ytrain(idx));
    end
    
end

end
