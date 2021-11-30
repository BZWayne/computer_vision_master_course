% Load necessary pictures and points
% % Rubik cube
Im1 = imread('/Users/bzwayne/Desktop/lab6_material/Rubik/Rubik1.pgm');
Im2 = imread('/Users/bzwayne/Desktop/lab6_material/Rubik/Rubik2.pgm');
pt1 = importdata('/Users/bzwayne/Desktop/lab6_material/Rubik/Rubik1.points');
pt2 = importdata('/Users/bzwayne/Desktop/lab6_material/Rubik/Rubik2.points');

% % Mire 
% Im1 = imread('/Users/bzwayne/Desktop/lab6_material/Mire/Mire1.pgm');
% Im2 = imread('/Users/bzwayne/Desktop/lab6_material/Mire/Mire2.pgm');
% pt1 = importdata('/Users/bzwayne/Desktop/lab6_material/Mire/Mire1.points');
% pt2 = importdata('/Users/bzwayne/Desktop/lab6_material/Mire/Mire1.points');

% % Version one
F = EightPointsAlgorithm(pt1, pt2);
% % Version two
% F = EightPointsAlgorithmN(pt1, pt2);
% % Visualise epipolar lines
visualizeEpipolarLines(Im1, Im2, F, pt1, pt2)