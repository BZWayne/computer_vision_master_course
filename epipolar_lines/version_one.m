% Write down a Matlab function function [F] = EightPointsAlgorithm(P1, P2) implementing the following steps:
% 
%  Write down the matrix A (see the slides...)
% Compute the SVD decomposition of A 
% [U, D, V]=svd(A);
% and select as solution f the last column of V.
% Reshape the column vector f so to obtain a matrix F (see function reshape)
% Force the rank of F to be 2:
% Use again the SVD to decompose the matrix 
% [U, D, V] = svd(F)
% Set D(3,3)=0
% Recompute the final F: F=U*D*VT.

function EightPointsAlgorithm(P1, P2)

    A = [x2 .* x1, x2 .* y1, x2, y2 .* x1, y2 .* y1, y2, x1, y1, ones(8, 1)];
    [U, D, V] = svd(A);
    F = [V(1, 9), V(2, 9), V(3, 9); V(4, 9), V(5, 9), V(6, 9); V(7, 9), V(8, 9), V(9, 9)];
    [U, D, V] = svd(F);
    D(3,3) = 0
    F = U(:, 1) * D(1,1) * transpose(V(:, 1)) + U(:, 2) * S(2,2) * transpose(V(:, 2));

end





