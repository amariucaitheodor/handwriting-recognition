function task2_8(Xtrain, Ytrain, Xtest, Ytest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Xtrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ytest  : N-by-1 label vector (uint8) for Xtest
%   epsilon : A scalar parameter for regularisation
%   L      : scalar (integer) of the number of Gaussian distributions per class

tic
[Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L);
toc

[cm, acc] = comp_confmat(Ytest, Ypreds); % 10 classes
save(sprintf('./Report files/task2_8/task2_8_cm_%d.mat', L), 'cm');

Ms1 = MMs(:,1:L); 
save(sprintf('./Report files/task2_8/task2_8_g%d_m1.mat', L), 'Ms1');
Covs1 = MCovs(:,:,1:L);
save(sprintf('./Report files/task2_8/task2_8_g%d _cov1.mat', L), 'Covs1');

N = size(Ytest, 1);
fprintf('\nL=%d\nN=%d\nNerrs=%d\nacc=%d\n\n', L, N, (1-acc)*N, acc);

end
