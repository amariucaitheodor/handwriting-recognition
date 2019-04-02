%
%
function task1_8(DataPoints, DataName, k)
%  This is a mini research project, in which you are asked to investigate the k-means clustering in terms
%  of initial cluster centres, i.e. how different initial cluster centres result in different cluster centres,
%  for which employ SSE to measure the clustering performance. Report your experiments and findings in your report,
%  and save your code as 'task1_8.m'

length = size(DataPoints, 1);

% 1st experiment: first ten data points as cluster centres
[~,~,SSEs(1)] = my_kMeansClustering(DataPoints, k, DataPoints(1:k,:));

% 2nd experiment: random ten data points as cluster centres
seed = 2; % set seed for repeatable results
rng(seed);
[~,~,SSEs(2)] = my_kMeansClustering(DataPoints, k, DataPoints([randi(length), randi(length),randi(length),randi(length),randi(length),randi(length),randi(length),randi(length),randi(length),randi(length)],:));

% 3rd experiment: randomly assign data points to k clusters and compute means as initial centres
seed = 5; % set seed for repeatable results
centres = zeros(k, size(DataPoints,2)); % 10x784 for the k clusters
for point = 1:size(DataPoints,1)
    r = randi(k);
    centres(r, :) = centres(r, :) + DataPoints(point, :); % add point to assigned cluster
end
centres = centres ./10; % get the mean
[~,~,SSEs(3)] = my_kMeansClustering(DataPoints, k, centres);

% 4th experiment: chosen data points have extreme values
sumSort = sort(sum(DataPoints, 2));
extremeIndices = zeros(1, 10); % lowest to highest by sum of members (dimmest to brightest digit)
for i=1:size(DataPoints,1)
    %dimmest digits
    if sum(DataPoints(i, :)) == sumSort(1)
        extremeIndices(1, 1) = i;
    end
    if sum(DataPoints(i, :)) == sumSort(2)
        extremeIndices(1, 2) = i;
    end
    if sum(DataPoints(i, :)) == sumSort(3)
        extremeIndices(1, 3) = i;
    end
    if sum(DataPoints(i, :)) == sumSort(4)
        extremeIndices(1, 4) = i;
    end
    if sum(DataPoints(i, :)) == sumSort(5)
        extremeIndices(1, 5) = i;
    end
    %brightest digits
    if sum(DataPoints(i, :)) == sumSort(length)
        extremeIndices(1, 6) = i;
    end
    if sum(DataPoints(i, :)) == sumSort(length-1)
        extremeIndices(1, 7) = i;
    end
    if sum(DataPoints(i, :)) == sumSort(length-2)
        extremeIndices(1, 8) = i;
    end
    if sum(DataPoints(i, :)) == sumSort(length-3)
        extremeIndices(1, 9) = i;
    end
    if sum(DataPoints(i, :)) == sumSort(length-4)
        extremeIndices(1, 10) = i;
    end
end
[~,~,SSEs(4)] = my_kMeansClustering(DataPoints, k, DataPoints(extremeIndices',:));

% 5th experiment: MATLAB k-means++ algorithm
[~,~,sumd] = kmeans(DataPoints,10);
SSEs(5) = sum(sumd);

save(sprintf('./Report files/task8/task1_8_SSEs_%s.mat', DataName), 'SSEs');

figure('Name', 'SSEs')
c = categorical({'first 10 points','random 10 points','randomly assigned 10 clusters and computed means', '5 lowest and highest by sum of elements', 'MATLAB k-means++ algorithm'});
load(sprintf('./Report files/task8/task1_8_SSEs_%s.mat', DataName), 'SSEs');
bar(c, [SSEs(1), SSEs(2), SSEs(3), SSEs(4), SSEs(5)]);
print(figure(1), '-bestfit', sprintf('./Report files/task8/task1_8_report_image_%s.pdf', DataName), '-dpdf');

end