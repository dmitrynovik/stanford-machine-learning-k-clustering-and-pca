function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

centroid_num = zeros(K, 1);

%
% 2-step O(N) solution
%

% step I - SUM
for i=1:size(idx, 1)
	sample_i = X(i, :);
	centroid_i = idx(i);
	centroids(centroid_i, :) = centroids(centroid_i, :) + sample_i;
	centroid_num(centroid_i, :) = centroid_num(centroid_i, :) + 1;
end

% step II - DIVIDE
for i=1:size(centroids, 1)
	n = centroid_num(i, :);
	if n > 0 % avoid division by 0
		centroids(i, :) = centroids(i, :) ./ n;
	end
end

% =============================================================


end

