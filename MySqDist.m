function distances = MySqDist(U, v)
%Compute a 1 x M row vector of square distances between all M vectors of MxN (U) and vector 1xN (v)
distances = sum(bsxfun(@minus, U, v).^2, 2)';
end