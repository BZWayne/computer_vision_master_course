% Write down a Matlab function function [F] = EightPointsAlgorithmN(P1, P2) implementing the following steps:
% 
% Normalize the points using the function normalise2dpts provided.
% [nP1, T1] = normalise2dpts(P1)
% 
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

