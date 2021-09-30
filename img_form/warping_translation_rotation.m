%% Load an image
img = imread('boccadasse.jpg');
img = rgb2gray(img);
[rr, cc] = size(img);
[X,Y]=meshgrid(1:cc,1:rr);
%% Warping 
sh = 0.2;
Xw = X + sh*Y;
Yw = Y;
% Plot
figure;
% subplot(2, 2, 1), imagesc(img); colormap gray; title('original');
subplot(2, 2, 1), imagesc(griddata(X,Y,double(img),Xw,Yw,'linear')); colormap gray; title('warping');
%% Translation
tr = 20;
ty = randi(tr, 1, 1);
tx = randi(tr, 1, 1);
% new image coord
Xt = X + tx;
Yt = Y + ty;
% Plot
subplot(2, 2, 2), imagesc(griddata(X,Y,double(img),Xt,Yt,'linear')); colormap gray; title('translation');
%% Rotation
theta = 50;
pi = 3.14;
theta = (theta*pi)/180;
% new image coord
Xr = X*cos(theta)-Y*sin(theta);
Yr = X*cos(theta)+Y*sin(theta);
% Plot
subplot(2, 2, 3), imagesc(griddata(X,Y,double(img),Xr,Yr,'linear')); colormap gray; title('rotation');
%% With data.mat
load data
[rxd,cxd]=size(XD);
[ryd,cyd]=size(YD);
Xd = X + XD;
Yd = Y + YD;
% Plot
subplot(2, 2, 4), imagesc(griddata(X,Y,double(img),Xd,Yd,'linear')); colormap gray; title('with data.mat');