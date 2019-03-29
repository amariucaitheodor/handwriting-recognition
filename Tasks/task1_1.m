%
%
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)

montages = zeros(10,10,784); % 10 montages, each with 10 images of 784 float points
noImagesForDigits = zeros(10);
count = 1;
pos=1;
while(count<101)
    if noImagesForDigits(Y(pos) + 1)<10
        montages(Y(pos) + 1, noImagesForDigits(Y(pos) + 1) + 1,:) = X(pos,:);
        noImagesForDigits(Y(pos) + 1) = noImagesForDigits(Y(pos) + 1) + 1;
        count = count + 1;
    end
    pos=pos+1;
end

imageArray={1,10}; % stores all 10 images for one specific digit montage
for i=1:10
    for pos=1:10
        %reshape 1x784 vector into a 28x28 matrix for image creation,
        %then transform matrix into greyscale image via function
        imageArray{1,pos}=mat2gray(reshape(montages(i,pos,:), 28, 28)'); 
    end
    figure('Name', sprintf('Montage for digit %d', i-1))
    montage(imageArray);
    %print(figure(i), '-bestfit', sprintf('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task1_1_imgs_class%d.pdf', i), '-dpdf');
end