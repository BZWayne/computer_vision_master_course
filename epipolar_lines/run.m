%% Load necessary pictures and points for Rubik
Im1 = imread('Rubik/Rubik1.pgm');
Im2 = imread('Rubik/Rubik2.pgm');
pt1 = importdata('Rubik/Rubik1.points');
pt2 = importdata('Rubik/Rubik2.points');

%% Load necessary pictures and points for Mire
% Im1 = imread('Mire/Mire1.pgm');
% Im2 = imread('Mire/Mire2.pgm');
% pt1 = importdata('Mire/Mire1.points');
% pt2 = importdata('Mire/Mire1.points');

%% Version one without Normalization
F = EightPointsAlgorithm(pt1, pt2);

%% Version one with Normalization
% F = EightPointsAlgorithmN(pt1, pt2);

%% Visualise epipolar lines
visualizeEpipolarLines(Im1, Im2, F, pt1, pt2)
