function [B] = myMean(M)
col_sum = sum(M);
B = double(col_sum./size(M,1));
end