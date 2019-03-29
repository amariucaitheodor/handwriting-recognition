%
%
function task1_6(MAT_ClusterCentres)
% Input:
%  MAT_ClusterCentres : file name of the MAT file that contains cluster centres C.
%       
%

C = cell2mat(struct2cell(load(MAT_ClusterCentres)));
sol={1, size(C,1)};
for c=1:size(C,1)
    sol{1, c} = mat2gray(reshape(C(c,:), 28, 28)');
end
figure
montage(sol);

end
