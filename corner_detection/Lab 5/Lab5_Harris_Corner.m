% Lab 5 part 2 - Harris corner detection
%% Step 1: Read all images in specific folder
directory = 'Images_part2'; % Change path to your image location
imgs = imageDatastore(directory);
imgs = readall(imgs);
I = double(imgs{1});
figure, imagesc(I), colormap gray, title('Original image')

%% 
% Step 2: Compute x and y derivative of the image
dx = [1 0 -1; 2 0 -2; 1 0 -1];
dy = [1 2 1; 0  0  0; -1 -2 -1];
Ix = conv2(I,dx,'same');
Iy = conv2(I,dy,'same');
figure, imagesc(Ix), colormap gray, title('Partial derivative - Ix')
figure, imagesc(Iy), colormap gray, title('Partial derivative - Iy')

%% Step 3: Compute products of derivatives at every pixel
Ix2 = Ix.*Ix; Iy2=Iy.*Iy; Ixy=Ix.*Iy;

%% Step 4: Compute the sum of products of derivatives at each pixel
g = fspecial('gaussian', 9, 1.2);
figure, imagesc(g), colormap gray, title('Gaussian filter')
Sx2 = conv2(Ix2,g,'same'); Sy2=conv2(Iy2,g,'same'); Sxy=conv2(Ixy,g,'same');

%% Step 5: Detect features 
[rr,cc ]= size(Sx2);
edge_reg = zeros(rr,cc); corner_reg=zeros(rr,cc); flat_reg=zeros(rr,cc);
R_map = zeros(rr,cc);
k = 0.05;

for ii = 1:rr
    for jj = 1:cc
        % Define at each pixel x,y the matrix
        M = [Sx2(ii,jj), Sxy(ii,jj); Sxy(ii,jj), Sy2(ii,jj)];
        % Compute the response of the detector at each pixel
        R = det(M) - k * (trace(M).^2);
        R_map(ii,jj) = R;
        % Threshod on value of R
        if R < -0.3 * max(R_map)
            edge_reg(ii,jj) = 1;
        elseif R > 0.3 * max(R_map)
            corner_reg(ii,jj) = 1;
        else
            flat_reg(ii,jj) = 1;
        end
    end
end

%% Display all images
figure, imagesc(edge_reg.*I), colormap gray, title('Edge regions')
figure, imagesc(corner_reg.*I), colormap gray, title('Corner regions')
figure, imagesc(flat_reg.*I), colormap gray, title('Flat regions')
figure, imagesc(R_map), colormap jet, title('R score map')

%% Step 6: Convert corner_reg to BW and label it
bw_corner = imbinarize(corner_reg, 0.8); % where 0.8 is a threshold value
bw_new = bwareaopen(bw_corner, 1); % used to remove objects that have fewer than 1 pixels from our image 
[bwLabel, num] = bwlabel(bw_new, 4); % calculate number of connected component (label them), where 4 is a number of connectivity

%% Step 7: Display centroid at each corner on grayscale image
s = regionprops(bwLabel, 'Area', 'BoundingBox', 'Centroid'); 
cent = cat(1, s.Centroid);
figure,imagesc(I),colormap gray,title('Detected corners')
hold on;
plot(cent(:,1), cent(:,2), 'r*')
