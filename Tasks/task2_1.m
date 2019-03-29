%
%
function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain

tic
Ypreds = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks);
toc

for knns=1:size(Ks, 2)
    [cm, acc] = comp_confmat(Ytest, Ypreds(knns,:));
    save(sprintf('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task2_1/task2_1_cm%d.mat', Ks(knns)), 'cm');
    N = size(Ypreds(knns,:), 2);
    fprintf('\nk=%d\nN=%d\nNerrs=%d\nacc=%d\n\n', Ks(knns), N, (1-acc)*N, acc);
end

end
