%% Task 1
% Load an image
img = imread('i235.png');
figure;
imagesc(img),colormap gray, title('Original Image');
print('/Users/bzwayne/Desktop/images/1_original.png','-dpng');

%%%%% to change an image, just comment the above image and uncomment the below one
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% img = imread('tree.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% normal distribution and noise distribution
out_n = double(img)+20*randn(size(img)); % 20 is the standard deviation
a_n = randn(1,100);

% salt and pepper 
img = double(img);
[rr,cc] = size(img);
maxv = max(max(img));
indices = full(sprand(rr,cc,0.2));  % 20% is the noise density
mask1 = indices>0 & indices<0.5;  
mask2 = indices>=0.5; 
out = img.*(~mask1) ;
out = out.*(~mask2)+maxv*mask2;

figure;
subplot(2, 2, 1), imagesc(out_n),colormap gray,title('Noise with 20% std');
subplot(2, 2, 2), hist(out_n), title('Histogram of image');
subplot(2, 2, 3), imagesc(out),colormap gray, title('Salt-pepper image');
subplot(2, 2, 4), hist(out), title('Histogram of Salt-pepper image');
print('/Users/bzwayne/Desktop/images/1_noise.png','-dpng');
%% Task 2

[x,y]= meshgrid(1:size(img,2),size(img,1):-1:1);
% moving averages
Kaverage_3 = filter2(fspecial('average',3),out)/255;
Kaverage_7 = filter2(fspecial('average',7),out)/255;

% low-pass Gaussian filters
Kgaussian_3 = filter2(fspecial('gaussian',3),out)/255;
Kgaussian_7 = filter2(fspecial('gaussian',7),out)/255;

% median filter 3X3 and 7X7
masking_3x3 = medfilt2(img,[3,3]);
masking_7x7 = medfilt2(img,[7,7]);

% moving average filters
figure;
subplot(2, 3, 1), imagesc(Kaverage_3),colormap gray,title('Moving average 3x3');
subplot(2, 3, 2), hist(Kaverage_3), title('Histogram of moving average 3x3');
subplot(2, 3, 3), surf(x,y,Kaverage_3,'EdgeColor','none'), title('Surface plot of 3x3 mask');
subplot(2, 3, 4), imagesc(Kaverage_7),colormap gray,title('Moving average 7x7');
subplot(2, 3, 5), hist(Kaverage_7), title('Histogram of moving average 7x7');
subplot(2, 3, 6), surf(x,y,Kaverage_7,'EdgeColor','none'), title('Surface plot of 7x7 mask');
print('/Users/bzwayne/Desktop/images/2_moving.png','-dpng');

% low-pass Gaussian filters
figure;
subplot(2, 3, 1), imagesc(Kgaussian_3),colormap gray,title('Low-pass Gaussian 3x3 filters');
subplot(2, 3, 2), hist(Kgaussian_3), title('Histogram of 3x3 filter');
subplot(2, 3, 3), surf(x,y,Kgaussian_3,'EdgeColor','none'), title('Surface plot of 3x3 mask');
subplot(2, 3, 4), imagesc(Kgaussian_7),colormap gray,title('Low-pass Gaussian 7x7 filter');
subplot(2, 3, 5), hist(Kgaussian_7), title('Histogram of mask 7x7 filter');
subplot(2, 3, 6), surf(x,y,Kgaussian_7,'EdgeColor','none'), title('Surface plot of 7x7 mask');
print('/Users/bzwayne/Desktop/images/2_gaussian.png','-dpng');

% median filters
figure;
subplot(2, 3, 1), imagesc(masking_3x3),colormap gray,title('Median 3x3 filters');
subplot(2, 3, 2), hist(masking_3x3), title('Histogram of 3x3 filter');
subplot(2, 3, 3), surf(x,y,masking_3x3,'EdgeColor','none'), title('Surface plot of 3x3 mask');
subplot(2, 3, 4), imagesc(masking_7x7),colormap gray,title('Median 7x7 filters');
subplot(2, 3, 5), hist(masking_7x7), title('Histogram of 7x7 filter');
subplot(2, 3, 6), surf(x,y,masking_7x7,'EdgeColor','none'), title('Surface plot of 7x7 mask');
print('/Users/bzwayne/Desktop/images/2_median.png','-dpng');
%% Task 3

% Page 41 No change filtered
filter_41 = [0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 1 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0];
filtered_41 = conv2(img,filter_41, 'same');
figure;
% subplot(1, 3, 1), imagesc(img),colormap gray,title('Original image')
subplot(1, 2, 1), imagesc(filtered_41), colormap gray, title('Page 41');
subplot(1, 2, 2), surf(x,y,filtered_41,'EdgeColor','none'), title('Surface plot of filtered image');
print('/Users/bzwayne/Desktop/images/3_41.png','-dpng');

% Page 42 Shifted
filter_42 = [0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 1; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0; 0 0 0 0 0 0 0];
filtered_42 = conv2(img,filter_42, 'same');
figure;
% subplot(1, 3, 1), imagesc(img),colormap gray,title('Original image')
subplot(1, 2, 1), imagesc(filtered_42), colormap gray, title('Page 42');
subplot(1, 2, 2), surf(x,y,filtered_42,'EdgeColor','none'), title('Surface plot of shifted image');
print('/Users/bzwayne/Desktop/images/3_42.png','-dpng');

% Page 43 Blurred
filter_43 = ones(7)/49;
filtered_43 = conv2(img,filter_43, 'same');
figure;
% subplot(1, 3, 1), imagesc(img),colormap gray,title('Original image')
subplot(1, 2, 1), imagesc(filtered_43), colormap gray, title('Page 43');
subplot(1, 2, 2), surf(x,y,filtered_43,'EdgeColor','none'), title('Surface plot of blurred image');
print('/Users/bzwayne/Desktop/images/3_43.png','-dpng');

% Page 44
filter_44_m1 = filter_41 * 2;
filter_44_m2 = ones(7)/49;
filter_44 = abs(filter_44_m1 - filter_44_m2);
filtered_44 = conv2(img,filter_44, 'same');
figure;
% subplot(1, 3, 1), imagesc(img),colormap gray,title('Original image')
subplot(1, 2, 1), imagesc(filtered_44), colormap gray, title('Page 44');
subplot(1, 2, 2), surf(x,y,filtered_44,'EdgeColor','none'), title('Surface plot of sharpened image');
print('/Users/bzwayne/Desktop/images/3_44.png','-dpng');

% Page 45
K = ones(7)/49;
smooth = conv2(img,K,'same');
detail = img - smooth;
a = 1/10;
sharp = img + a*detail;
figure;
% subplot(2, 4, 1), imagesc(img),colormap gray,title('Original image')
subplot(2, 3, 1), imagesc(smooth),colormap gray,title('Smoothed 7x7');
subplot(2, 3, 2), imagesc(detail),colormap gray, title('Detail');
subplot(2, 3, 3), surf(x,y,detail,'EdgeColor','none'), title('Surface plot of detailed image');
% subplot(2, 4, 5), imagesc(img),colormap gray,title('Original image');
subplot(2, 3, 4), imagesc(detail),colormap gray, title('Detail');
subplot(2, 3, 5), imagesc(sharp),colormap gray,title('Sharpened image');
subplot(2, 3, 6), surf(x,y,sharp,'EdgeColor','none'), title('Surface plot of sharpened image');
print('/Users/bzwayne/Desktop/images/3_45.png','-dpng');

%% Task 4 
%%%% Apply log to the transformed images
%%% page 41
F_41 = fft2(filtered_41);
S_41 = abs(F_41);
FZ_41=fftshift(F_41);
S2_41 = log(1+abs(FZ_41));

%%% page 42
F_42 = fft2(filtered_42);
S_42 = abs(F_42);
FZ_42=fftshift(F_42);
S2_42 = log(1+abs(FZ_42));

%%% page 43
F_43 = fft2(filtered_43);
S_43 = abs(F_43);
FZ_43=fftshift(F_43);
S2_43 = log(1+abs(FZ_43));

%%% page 44
F_44 = fft2(filtered_44);
S_44 = abs(F_44);
FZ_44=fftshift(F_44);
S2_44 = log(1+abs(FZ_44));

figure;
subplot(2, 2, 1), imagesc(S2_41),colormap gray,title('Magnitude (log) of filtered image');
subplot(2, 2, 2), imagesc(S2_42),colormap gray,title('Magnitude (log) of shifted image');
subplot(2, 2, 3), imagesc(S2_43),colormap gray,title('Magnitude (log) of Gaussian blurred image');
subplot(2, 2, 4), imagesc(S2_44),colormap gray,title('Magnitude (log) of Sharpened image');
print('/Users/bzwayne/Desktop/images/4_1.png','-dpng');

% Gaussian filter to the 101x101 pixels with sigma 5
Kgaussian_101 = filter2(fspecial('gaussian',101,5),img)/255;
FZ_2=fftshift(fft2(Kgaussian_101));
figure;
subplot(1, 2, 1), mesh(abs(FZ_2)),xlabel('wx'),ylabel('wy'),zlabel('abs(F)'), title('Surface of the Gaussian low-pass filter')
subplot(1, 2, 2), imagesc(abs(FZ_2)),xlabel('wx'),ylabel('wy'), title('Illustration of the Gaussian filter');
print('/Users/bzwayne/Desktop/images/4_2.png','-dpng');

% FFT using for the sharpened image
fft_4 = zeros(101);
K_1 = zeros(7);
K_1(4,4) = 1;
K_2 = ones(7)/49;
K_sharpened = K_1 + K_1 - K_2;
fft_4(48:54, 48:54) = K_sharpened;
FZ_3=fftshift(fft2(fft_4));
figure;
imagesc(abs(FZ_3)),colormap gray,xlabel('wx'),ylabel('wy'), title('Magnitude of the transformed sharpening filter');
print('/Users/bzwayne/Desktop/images/4_3.png','-dpng');
