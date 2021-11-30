% Load necessary pictures and points
% % Rubik cube
% Im1 = imread('/Users/bzwayne/Desktop/lab6_material/Rubik/Rubik1.pgm');
% Im2 = imread('/Users/bzwayne/Desktop/lab6_material/Rubik/Rubik2.pgm');
% pt1 = importdata('/Users/bzwayne/Desktop/lab6_material/Rubik/Rubik1.points');
% pt2 = importdata('/Users/bzwayne/Desktop/lab6_material/Rubik/Rubik2.points');

% % Mire 
I1 = imread('/Users/bzwayne/Desktop/lab6_material/Mire/Mire1.pgm');
I2 = imread('/Users/bzwayne/Desktop/lab6_material/Mire/Mire2.pgm');
% pt1 = importdata('/Users/bzwayne/Desktop/lab6_material/Mire/Mire1.points');
% pt2 = importdata('/Users/bzwayne/Desktop/lab6_material/Mire/Mire2.points');

load stereoPointPairs
[fLMedS,inliers] = estimateFundamentalMatrix(matchedPoints1,...
    matchedPoints2,'NumTrials',4000)
epiLines = epipolarLine(fLMedS',matchedPoints2(inliers,:));
points = lineToBorderPoints(epiLines,size(I1));
line(points(:,[1,3])',points(:,[2,4])');

figure; 
subplot(121);
imshow(Im1); 
title('Inliers and Epipolar Lines in First Image'); hold on;
plot(matchedPoints1(inliers,1),matchedPoints1(inliers,2),'go')
subplot(122); 
imshow(I2);
title('Inliers and Epipolar Lines in Second Image'); hold on;
plot(matchedPoints2(inliers,1),matchedPoints2(inliers,2),'go')