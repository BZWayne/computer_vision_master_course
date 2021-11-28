%% Read all images in specific folder
directory = 'Images';
imgs = imageDatastore(directory);
imgs = readall(imgs);

%% Convert image from RGB to Grayscale 
img1_gray = rgb2gray(im2double(imgs{1}));
img2_gray = rgb2gray(im2double(imgs{2}));
img3_gray = rgb2gray(im2double(imgs{3}));
img4_gray = rgb2gray(im2double(imgs{4}));
img5_gray = rgb2gray(im2double(imgs{5}));
img6_gray = rgb2gray(im2double(imgs{6}));

figure, imagesc(img1_gray), colormap gray, title('Image 1 - grayscale')
% subplot(2,3,2), imagesc(img2_gray), colormap gray, title('Image 2 - grayscale')
% subplot(2,3,3), imagesc(img3_gray), colormap gray, title('Image 3 - grayscale')
% subplot(2,3,4), imagesc(img4_gray), colormap gray, title('Image 4 - grayscale')
% subplot(2,3,5), imagesc(img5_gray), colormap gray, title('Image 5 - grayscale')
% subplot(2,3,6), imagesc(img6_gray), colormap gray, title('Image 6 - grayscale')

%%$ Window 1
%% Selecting a 1 window size around the black car
img1_black_car_w1 = img1_gray(370:410,580:640);
figure, imagesc(img1_black_car_w1), colormap gray, title('Window 1 - Black car')

%% Normalized cross correlation (NCC)
img1_ncc = normxcorr2(img1_black_car_w1, img1_gray);
img2_ncc = normxcorr2(img1_black_car_w1, img2_gray);
img3_ncc = normxcorr2(img1_black_car_w1, img3_gray);
img4_ncc = normxcorr2(img1_black_car_w1, img4_gray);
img5_ncc = normxcorr2(img1_black_car_w1, img5_gray);
img6_ncc = normxcorr2(img1_black_car_w1, img6_gray);

figure, subplot(2,3,1), imagesc(img1_ncc), colormap gray, title('Image 1')
subplot(2,3,2), imagesc(img2_ncc), colormap gray, title('Image 2')
subplot(2,3,3), imagesc(img3_ncc), colormap gray, title('Image 3')
subplot(2,3,4), imagesc(img4_ncc), colormap gray, title('Image 4')
subplot(2,3,5), imagesc(img5_ncc), colormap gray, title('Image 5')
subplot(2,3,6), imagesc(img6_ncc), colormap gray, title('Image 6'), sgtitle("NCC 1 - Black car")

%% Position of the maximum of the score map for black car - 1 window images from 1 to 6
img1_bright= sum(img1_ncc, 3);
[~, idx] = max(img1_bright(:));
[y1, x1] = ind2sub(size(img1_bright), idx);

img2_bright= sum(img2_ncc, 3);
[~, idx] = max(img2_bright(:));
[y2, x2] = ind2sub(size(img2_bright), idx);

img3_bright= sum(img3_ncc, 3);
[~, idx] = max(img3_bright(:));
[y3, x3] = ind2sub(size(img3_bright), idx);

img4_bright= sum(img4_ncc, 3);
[~, idx] = max(img4_bright(:));
[y4, x4] = ind2sub(size(img4_bright), idx);

img5_bright= sum(img5_ncc, 3);
[~, idx] = max(img5_bright(:));
[y5, x5] = ind2sub(size(img5_bright), idx);

img6_bright= sum(img6_ncc, 3);
[~, idx] = max(img6_bright(:));
[y6, x6] = ind2sub(size(img6_bright), idx);

% From the script above, it was revealed that:
% Image 1 -> (x,y) = (640,410) | index = 1.0      | RGB = [1 1 1]
% Image 2 -> (x,y) = (636,409) | index = 0.980331 | RGB = [1 1 1]
% Image 3 -> (x,y) = (631,408) | index = 0.970042 | RGB = [1 1 1]
% Image 4 -> (x,y) = (627,407) | index = 0.950415 | RGB = [1 1 1]
% Image 5 -> (x,y) = (622,407) | index = 0.905912 | RGB = [1 1 1]
% Image 6 -> (x,y) = (617,407) | index = 0.866128 | RGB = [1 1 1]

%% Box corresponding to the size of the template for 6 images (Black car - 1 window)
figure, subplot(2,3,1), imagesc(img1_gray), colormap gray, ...
rectangle('Position',[580,370,60,40], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 1')
subplot(2,3,2), imagesc(img2_gray), colormap gray, ...
rectangle('Position',[576,369,60,40], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 2')
subplot(2,3,3), imagesc(img3_gray), colormap gray, ...
rectangle('Position',[571,368,60,40], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 3')
subplot(2,3,4), imagesc(img4_gray), colormap gray, ...
rectangle('Position',[567,367,60,40], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 4')
subplot(2,3,5), imagesc(img5_gray), colormap gray, ...
rectangle('Position',[562,367,60,40], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 5')
subplot(2,3,6), imagesc(img6_gray), colormap gray, ...
rectangle('Position',[557,367,60,40], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 6'), sgtitle("1 Window boxes - black car")



%%% Window 2
%% Selecting a 2 window size around the black car
img1_black_car_w2 = img1_gray(370:415,560:645);
figure, imagesc(img1_black_car_w2), colormap gray, title('Window 2 - Black car')

%% Normalized cross correlation (NCC)
img1_ncc = normxcorr2(img1_black_car_w2, img1_gray);
img2_ncc = normxcorr2(img1_black_car_w2, img2_gray);
img3_ncc = normxcorr2(img1_black_car_w2, img3_gray);
img4_ncc = normxcorr2(img1_black_car_w2, img4_gray);
img5_ncc = normxcorr2(img1_black_car_w2, img5_gray);
img6_ncc = normxcorr2(img1_black_car_w2, img6_gray);

figure, subplot(2,3,1), imagesc(img1_ncc), colormap gray, title('Image 1')
subplot(2,3,2), imagesc(img2_ncc), colormap gray, title('Image 2')
subplot(2,3,3), imagesc(img3_ncc), colormap gray, title('Image 3')
subplot(2,3,4), imagesc(img4_ncc), colormap gray, title('Image 4')
subplot(2,3,5), imagesc(img5_ncc), colormap gray, title('Image 5')
subplot(2,3,6), imagesc(img6_ncc), colormap gray, title('Image 6'), sgtitle("NCC 2 - Black car")

%% Position of the maximum of the score map for black car - 2 window images from 1 to 6
img1_bright= sum(img1_ncc, 3);
[~, idx] = max(img1_bright(:));
[yw1, xw1] = ind2sub(size(img1_bright), idx);

img2_bright= sum(img2_ncc, 3);
[~, idx] = max(img2_bright(:));
[yw2, xw2] = ind2sub(size(img2_bright), idx);

img3_bright= sum(img3_ncc, 3);
[~, idx] = max(img3_bright(:));
[yw3, xw3] = ind2sub(size(img3_bright), idx);

img4_bright= sum(img4_ncc, 3);
[~, idx] = max(img4_bright(:));
[yw4, xw4] = ind2sub(size(img4_bright), idx);

img5_bright= sum(img5_ncc, 3);
[~, idx] = max(img5_bright(:));
[yw5, xw5] = ind2sub(size(img5_bright), idx);

img6_bright= sum(img6_ncc, 3);
[~, idx] = max(img6_bright(:));
[yw6, xw6] = ind2sub(size(img6_bright), idx);

% From the script above, it was revealed that:
% Image 1 -> (x,y) = (645,415) | index = 1.0      | RGB = [1 1 1]
% Image 2 -> (x,y) = (641,414) | index = 0.985141 | RGB = [1 1 1]
% Image 3 -> (x,y) = (636,413) | index = 0.975866 | RGB = [1 1 1]
% Image 4 -> (x,y) = (631,412) | index = 0.957324 | RGB = [1 1 1]
% Image 5 -> (x,y) = (627,413) | index = 0.928959 | RGB = [1 1 1]
% Image 6 -> (x,y) = (622,413) | index = 0.912351 | RGB = [1 1 1]

%% Box corresponding to the size of the template for 6 images (Black car - 2 window)
figure, subplot(2,3,1), imagesc(img1_gray), colormap gray, ...
rectangle('Position',[560,370,85,45], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 1')
subplot(2,3,2), imagesc(img2_gray), colormap gray, ...
rectangle('Position',[556,369,85,45], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 2')
subplot(2,3,3), imagesc(img3_gray), colormap gray, ...
rectangle('Position',[551,368,85,45], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 3')
subplot(2,3,4), imagesc(img4_gray), colormap gray, ...
rectangle('Position',[546,367,85,45], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 4')
subplot(2,3,5), imagesc(img5_gray), colormap gray, ...
rectangle('Position',[542,368,85,45], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 5')
subplot(2,3,6), imagesc(img6_gray), colormap gray, ...
rectangle('Position',[537,368,85,45], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 6'), sgtitle("2 Window boxes - black car")



%%% Window 3
%% Selecting a 3 window size around the black car
img1_black_car_w3 = img1_gray(365:420,555:645);
figure, imagesc(img1_black_car_w3), colormap gray, title('Window 3 - Black car')

%% Normalized cross correlation (NCC)
img1_ncc = normxcorr2(img1_black_car_w3, img1_gray);
img2_ncc = normxcorr2(img1_black_car_w3, img2_gray);
img3_ncc = normxcorr2(img1_black_car_w3, img3_gray);
img4_ncc = normxcorr2(img1_black_car_w3, img4_gray);
img5_ncc = normxcorr2(img1_black_car_w3, img5_gray);
img6_ncc = normxcorr2(img1_black_car_w3, img6_gray);

figure, subplot(2,3,1), imagesc(img1_ncc), colormap gray, title('Image 1')
subplot(2,3,2), imagesc(img2_ncc), colormap gray, title('Image 2')
subplot(2,3,3), imagesc(img3_ncc), colormap gray, title('Image 3')
subplot(2,3,4), imagesc(img4_ncc), colormap gray, title('Image 4')
subplot(2,3,5), imagesc(img5_ncc), colormap gray, title('Image 5')
subplot(2,3,6), imagesc(img6_ncc), colormap gray, title('Image 6'), sgtitle("NCC 3 - Black car")

%% Position of the maximum of the score map for black car - 3 window images from 1 to 6
img1_bright= sum(img1_ncc, 3);
[~, idx] = max(img1_bright(:));
[yz1, xz1] = ind2sub(size(img1_bright), idx);

img2_bright= sum(img2_ncc, 3);
[~, idx] = max(img2_bright(:));
[yz2, xz2] = ind2sub(size(img2_bright), idx);

img3_bright= sum(img3_ncc, 3);
[~, idx] = max(img3_bright(:));
[yz3, xz3] = ind2sub(size(img3_bright), idx);

img4_bright= sum(img4_ncc, 3);
[~, idx] = max(img4_bright(:));
[yz4, xz4] = ind2sub(size(img4_bright), idx);

img5_bright= sum(img5_ncc, 3);
[~, idx] = max(img5_bright(:));
[yz5, xz5] = ind2sub(size(img5_bright), idx);

img6_bright= sum(img6_ncc, 3);
[~, idx] = max(img6_bright(:));
[yz6, xz6] = ind2sub(size(img6_bright), idx);

% From the script above, it was revealed that:
% Image 1 -> (x,y) = (645,420) | index = 1.0      | RGB = [1 1 1]
% Image 2 -> (x,y) = (641,419) | index = 0.990832 | RGB = [1 1 1]
% Image 3 -> (x,y) = (636,418) | index = 0.985482 | RGB = [1 1 1]
% Image 4 -> (x,y) = (631,417) | index = 0.975730 | RGB = [1 1 1]
% Image 5 -> (x,y) = (627,417) | index = 0.957081 | RGB = [1 1 1]
% Image 6 -> (x,y) = (621,418) | index = 0.944869 | RGB = [1 1 1]

%% Box corresponding to the size of the template for 6 images (Black car - 3 window)
figure, subplot(2,3,1), imagesc(img1_gray), colormap gray, ...
rectangle('Position',[555,365,90,55], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 1')
subplot(2,3,2), imagesc(img2_gray), colormap gray, ...
rectangle('Position',[551,364,90,55], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 2')
subplot(2,3,3), imagesc(img3_gray), colormap gray, ...
rectangle('Position',[546,363,90,55], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 3')
subplot(2,3,4), imagesc(img4_gray), colormap gray, ...
rectangle('Position',[541,362,90,55], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 4')
subplot(2,3,5), imagesc(img5_gray), colormap gray, ...
rectangle('Position',[536,362,90,55], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 5')
subplot(2,3,6), imagesc(img6_gray), colormap gray, ...
rectangle('Position',[531,363,90,55], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 6'), sgtitle("3 Window boxes - black car")