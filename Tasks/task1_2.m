%
%
function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.

M = zeros(11,784);
sums = zeros(10,784);
DigitNos = zeros(10);

for j=1:size(X)
    DigitNos(Y(j) + 1) = DigitNos(Y(j) + 1) + 1;
    sums(Y(j) + 1, :) = sums(Y(j) + 1, :) + X(j, :);
end

for i=1:10
    M(i,:) = sums(i,:)./DigitNos(i);
    M(11,:) = M(11,:) + M(i,:);
end
M(11,:) = M(11,:) ./ 10;

imageArray={1,11}; % stores all 11 images for the montage
for pos=1:11
    %reshape 1x784 vector into a 28x28 matrix for image creation,
    %then transform matrix into greyscale image via function
    imageArray{1,pos}=mat2gray(reshape(M(pos,:), 28, 28)'); 
end
figure('Name', 'Mean montage for all digits')
montage(imageArray);
%print(figure(1), '-bestfit', '/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task2/task1_2_imgs.pdf', '-dpdf');
end
