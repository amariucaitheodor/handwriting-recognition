%
%
function task2_3(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector for X (unit8)

[PC, V] = comp_pca(X);
stdx = sqrt(V(1));
stdy = sqrt(V(2));

col_sum = sum(X);
x_mean = col_sum./size(X,1);

X = (X) * PC(:,1:2);
[M D] = size(Y);

mean = zeros(10,2);
for i = 1:10
    count = 1;
    for j = 1:M
        if Y(j,:) == i-1
           mean(i,:) = mean(i,:) + X(j,:);
           count = count +1;
        end       
    end
    mean(i,:) = mean(i,:)/count;
    
    sumM = zeros(2,2);
    for j = 1:M
        if Y(j,:) == i-1
            sumM = sumM + (X(j,:) - mean(i,:)).*(X(j,:) - mean(i,:))';
        end  
    end
    
    covar = sumM/count;
    
    [V, D] = eig(covar);

    t = linspace(0, 2 * pi);
    a = (V(:,1:2) * sqrt(D)) * [cos(t(:))' ; sin(t(:))'];


    plot(a(1, :) + mean(i,1), a(2, :) + mean(i, 2));
    hold on;
end 
mean

end