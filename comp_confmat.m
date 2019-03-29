function [CM, acc] = comp_confmat(Ytrues, Ypreds, K)
% Input:
%   Ytrues : N-by-1 ground truth label vector
%   Ypreds : N-by-1 predicted label vector
% Output:
%   CM : K-by-K confusion matrix, where CM(i,j) is the number of samples whose target is the ith class that was classified as j
%   acc : accuracy (i.e. correct classification rate)

if nargin < 3
    K = 10;
end

CM = zeros(K, K);
testSize = size(Ytrues,1);
for i = 1:testSize
    if Ytrues(i) == Ypreds(i) 
        CM(Ytrues(i)+1,Ytrues(i)+1) = CM(Ytrues(i)+1,Ytrues(i)+1) + 1;
    else
        CM(Ytrues(i)+1, Ypreds(i)+1) = CM(Ytrues(i)+1, Ypreds(i)+1) + 1;
    end
end

acc = trace(CM) / testSize;

end
