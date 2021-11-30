% Write down a Matlab function function [F] = EightPointsAlgorithmN(P1, P2) implementing the following steps:
% Normalize the points using the function normalise2dpts provided.
% [nP1, T1] = normalise2dpts(P1)
% [nP2, T2]=normalise2dpts(P2)
% Write down the matrix A (see the slides...)
% Compute the SVD decomposition of A 
% [U, D, V]=svd(A);
% and select as solution f the last column of V.
% Reshape the column vector f so to obtain a matrix F (see function reshape)
% Force the rank of F to be 2:
% Use again the SVD to decompose the matrix 
% [U, D, V] = svd(F)
% Set D(3,3)=0
% Recompute the final F: F=U*D*VT.
% De-normalize the resulting F as T2T*F*T1. This is your final F

function [F] = EightPointsAlgorithmN(P1, P2)
    p1 = transpose([P1(1: 8, :), ones(8, 1)]);
    p2 = transpose([P2(1: 8, :), ones(8, 1)]);
    
    [nP1, T1] = normalise2dpts(p1);
    [nP2, T2] = normalise2dpts(p2);
    
    nP1 = transpose(nP1 ./ repmat(p1(3, :), [3, 1]));
    nP2 = transpose(nP2 ./ repmat(p2(3, :), [3, 1]));
    
    x1 = nP1(:, 1);
    y1 = nP1(:, 2);
    x2 = nP2(:, 1);
    y2 = nP2(:, 2);
    
    A = [x2 .* x1, x2 .* y1, x2, y2 .* x1, y2 .* y1, y2, x1, y1, ones(8, 1)];
    [U, D, V] = svd(A);
    F = [V(1, 9), V(2, 9), V(3, 9); V(4, 9), V(5, 9), V(6, 9); V(7, 9), V(8, 9), V(9, 9)];
    [U, D, V] = svd(F);
    D(3,3) = 0;
    F = U * D * transpose(V); 
    F = transpose(T2)*F*T1; 
end