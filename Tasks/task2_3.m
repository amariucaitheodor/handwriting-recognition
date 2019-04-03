function task2_3(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector for X (unit8)

[PC, ~] = comp_pca(X);
X = X * PC(:,1:2); % Transform X to the data in the 2D space spanned by the first two principal components.
%figure
% 2 dimensions because data has now been reduced to PCA
for class = 1:10
    
    % Estimate the parameters (mean vector and covariance matrix) of Gaussian distribution
    % for each class in the 2D space.
    mu = myMean(X(Y==class-1, :)); % 1x2, mean on every dimension
    sigma = myCov(X(Y==class-1, :)); % 2x2, covariances are therefore equal!
    
    [V, D] = eig(sigma);
    % The lengths of longest/ shortest axis of an ellipse should be proportional to 
    % the standard deviation for the axis. ( hence (* sqrt(D)), which is the
    % square root of the variance)
    t = linspace(0, 2 * pi);
    %[cos(t(:))' ; sin(t(:))'] represent the points on a sphere given t(:)
    a = (V(:,1:2) * sqrt(D)) * [cos(t(:))' ; sin(t(:))'];
    
    plot(-a(1, :) - mu(1), a(2,:) + mu(2));
    xlabel('1st principal component');
    ylabel('2nd principal component');
    text(-mu(1), mu(2), num2str(class-1), 'FontSize', 10); % Label Gaussian distribution at its centre
    hold on;
end 
%print(figure(1), '-bestfit', './Report files/task2_3/task2_3_img.pdf', '-dpdf');

end