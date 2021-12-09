%% Load necessary pictures and points for Rubik
Im1r = imread('Rubik/Rubik1.pgm');
Im2r = imread('Rubik/Rubik2.pgm');
pt1r = importdata('Rubik/Rubik1.points');
pt2r = importdata('Rubik/Rubik2.points');

% % Load necessary pictures and points for Mire
Im1m = imread('Mire/Mire1.pgm');
Im2m = imread('Mire/Mire2.pgm');
pt1m = importdata('Mire/Mire1.points');
pt2m = importdata('Mire/Mire1.points');

% % Version one without Normalization for Rubik
Fwnr = EightPointsAlgorithm(pt1r, pt2r);

% % Version one without Normalization for Mire
Fwnm = EightPointsAlgorithm(pt1m, pt2m);

% % Version one with Normalization for Rubik
Fnr = EightPointsAlgorithmN(pt1r, pt2r);

% % Version one with Normalization for Rubik
Fnm = EightPointsAlgorithmN(pt1m, pt2m);

% Visualise epipolar lines version 1 for Rubik
figure;
subplot(2, 2, 1);
visualizeEpipolarLines(Im1r, Im2r, Fwnr, pt1r, pt2r)
title("Rubik without Normalization")

% Visualise epipolar lines version 1 for Mire
subplot(2, 2, 2);
visualizeEpipolarLines(Im1m, Im2m, Fwnm, pt1m, pt2m)
title("Mire without Normalization")

% Visualise epipolar lines version 2 for Rubik
% figure;
subplot(2, 2, 3);
visualizeEpipolarLines(Im1r, Im2r, Fnr, pt1r, pt2r)
title("Rubik with Normalization")

% Visualise epipolar lines version 2 for Mire
subplot(2, 2, 4);
visualizeEpipolarLines(Im1m, Im2m, Fnm, pt1m, pt2m)
title("Mire with Normalization")
sgtitle("All experiment results")