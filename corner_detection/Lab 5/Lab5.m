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

%% Selecting a window size around the red car
img1_red_car = img1_gray(360:415, 688:772);
figure, imagesc(img1_red_car), colormap gray, title('Window - Red car')

%% Normalized cross correlation (NCC)
img1_ncc = normxcorr2(img1_red_car, img1_gray);
img2_ncc = normxcorr2(img1_red_car, img2_gray);
img3_ncc = normxcorr2(img1_red_car, img3_gray);
img4_ncc = normxcorr2(img1_red_car, img4_gray);
img5_ncc = normxcorr2(img1_red_car, img5_gray);
img6_ncc = normxcorr2(img1_red_car, img6_gray);

figure, subplot(2,3,1), imagesc(img1_ncc), colormap gray, title('Image 1')
subplot(2,3,2), imagesc(img2_ncc), colormap gray, title('Image 2')
subplot(2,3,3), imagesc(img3_ncc), colormap gray, title('Image 3')
subplot(2,3,4), imagesc(img4_ncc), colormap gray, title('Image 4')
subplot(2,3,5), imagesc(img5_ncc), colormap gray, title('Image 5')
subplot(2,3,6), imagesc(img6_ncc), colormap gray, title('Image 6'), sgtitle("NCC - Red car")

%% Position of the maximum of the score map for red car images from 1 to 6
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
% Image 1 -> (x,y) = (772,415) | index = 1.0      | RGB = [1 1 1]
% Image 2 -> (x,y) = (772,413) | index = 0.989855 | RGB = [1 1 1]
% Image 3 -> (x,y) = (771,412) | index = 0.983577 | RGB = [1 1 1]
% Image 4 -> (x,y) = (770,411) | index = 0.987886 | RGB = [1 1 1]
% Image 5 -> (x,y) = (770,410) | index = 0.979219 | RGB = [1 1 1]
% Image 6 -> (x,y) = (769,410) | index = 0.985483 | RGB = [1 1 1]

%% Box corresponding to the size of the template for 6 images (Red car)
figure, subplot(2,3,1), imagesc(img1_gray), colormap gray, ...
rectangle('Position',[688,360,84,55], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 1 - Red car box')
subplot(2,3,2), imagesc(img2_gray), colormap gray, ...
rectangle('Position',[688,358,84,55], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 2 - Red car box')
subplot(2,3,3), imagesc(img3_gray), colormap gray, ...
rectangle('Position',[687,357,84,55], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 3 - Red car box')
subplot(2,3,4), imagesc(img4_gray), colormap gray, ...
rectangle('Position',[686,356,84,55], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 4 - Red car box')
subplot(2,3,5), imagesc(img5_gray), colormap gray, ...
rectangle('Position',[686,355,84,55], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 5 - Red car box')
subplot(2,3,6), imagesc(img6_gray), colormap gray, ...
rectangle('Position',[685,355,84,55], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 6 - Red car box'), sgtitle("Boxes - Red car")


%% Selecting a window size around the black car
img1_black_car = img1_gray(370:410,580:640);
figure, imagesc(img1_black_car), colormap gray, title('Window - Black car')

%% Normalized cross correlation (NCC)
img1_ncc = normxcorr2(img1_black_car, img1_gray);
img2_ncc = normxcorr2(img1_black_car, img2_gray);
img3_ncc = normxcorr2(img1_black_car, img3_gray);
img4_ncc = normxcorr2(img1_black_car, img4_gray);
img5_ncc = normxcorr2(img1_black_car, img5_gray);
img6_ncc = normxcorr2(img1_black_car, img6_gray);

figure, subplot(2,3,1), imagesc(img1_ncc), colormap gray, title('Image 1')
subplot(2,3,2), imagesc(img2_ncc), colormap gray, title('Image 2')
subplot(2,3,3), imagesc(img3_ncc), colormap gray, title('Image 3')
subplot(2,3,4), imagesc(img4_ncc), colormap gray, title('Image 4')
subplot(2,3,5), imagesc(img5_ncc), colormap gray, title('Image 5')
subplot(2,3,6), imagesc(img6_ncc), colormap gray, title('Image 6'), sgtitle("NCC - Black car")

%% Position of the maximum of the score map for black car images from 1 to 6
img1_bright= sum(img1_ncc, 3);
[~, idx] = max(img1_bright(:));
[yb1, xb1] = ind2sub(size(img1_bright), idx);

img2_bright= sum(img2_ncc, 3);
[~, idx] = max(img2_bright(:));
[yb2, xb2] = ind2sub(size(img2_bright), idx);

img3_bright= sum(img3_ncc, 3);
[~, idx] = max(img3_bright(:));
[yb3, xb3] = ind2sub(size(img3_bright), idx);

img4_bright= sum(img4_ncc, 3);
[~, idx] = max(img4_bright(:));
[yb4, xb4] = ind2sub(size(img4_bright), idx);

img5_bright= sum(img5_ncc, 3);
[~, idx] = max(img5_bright(:));
[yb5, xb5] = ind2sub(size(img5_bright), idx);

img6_bright= sum(img6_ncc, 3);
[~, idx] = max(img6_bright(:));
[yb6, xb6] = ind2sub(size(img6_bright), idx);

% From the script above, it was revealed that:
% Image 1 -> (x,y) = (640,410) | index = 1.0      | RGB = [1 1 1]
% Image 2 -> (x,y) = (636,409) | index = 0.980331 | RGB = [1 1 1]
% Image 3 -> (x,y) = (631,408) | index = 0.970042 | RGB = [1 1 1]
% Image 4 -> (x,y) = (627,407) | index = 0.950415 | RGB = [1 1 1]
% Image 5 -> (x,y) = (622,407) | index = 0.905912 | RGB = [1 1 1]
% Image 6 -> (x,y) = (617,407) | index = 0.866128 | RGB = [1 1 1]

%% Box corresponding to the size of the template for 6 images (Black car)
figure, subplot(2,3,1), imagesc(img1_gray), colormap gray, ...
rectangle('Position',[580,370,60,40], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 1 - Black car box')
subplot(2,3,2), imagesc(img2_gray), colormap gray, ...
rectangle('Position',[576,369,60,40], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 2 - Black car box')
subplot(2,3,3), imagesc(img3_gray), colormap gray, ...
rectangle('Position',[571,368,60,40], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 3 - Black car box')
subplot(2,3,4), imagesc(img4_gray), colormap gray, ...
rectangle('Position',[567,367,60,40], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 4 - Black car box')
subplot(2,3,5), imagesc(img5_gray), colormap gray, ...
rectangle('Position',[562,367,60,40], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 5 - Black car box')
subplot(2,3,6), imagesc(img6_gray), colormap gray, ...
rectangle('Position',[557,367,60,40], 'LineWidth',2,'EdgeColor',[1,0,0]), title('Image 6 - Black car box'), sgtitle("Boxes - Black car")