%
%
function [CM, acc] = task2_7(Xtrain, Ytrain, Xtest, Ytest, epsilon, ratio)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  ratio  : scalar (double) - ratio of training data to use.
% Output:
%  CM     : K-by-K matrix (integer) of confusion matrix
%  acc    : scalar (double) of correct classification rate

[Ypreds, ~, ~] = run_gaussian_classifiers(Xtrain(1:int32(ratio*size(Xtrain,1)), :), Ytrain(1:int32(ratio*size(Xtrain,1)), :), Xtest, epsilon);
[CM, acc] = comp_confmat(Ytest, Ypreds, 10); % 10 classes

end
