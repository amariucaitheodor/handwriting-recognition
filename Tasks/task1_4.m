%
%
function task1_4(EVecs)
% Input:
%  Evecs : the same format as in comp_pca.m
%

imageArray={1, 10};
for i=1:10
    imageArray{1, i}=mat2gray(reshape(EVecs(:,i), 28, 28)');
end
figure
montage(imageArray);
%print(figure(2), '-bestfit', '/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task4/task1_4_imgs.pdf', '-dpdf');

end
