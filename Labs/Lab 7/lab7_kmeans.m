im = imread('picture.jpg');
img = im2double(im);

% Define the red color range in the RGB color space
%red range
min = [0.3 0 0];
max = [0.6 0.25 0.35];
% min = [0.6 0.3 0.1];  yellow
% max = [1 0.6 0.4];

% min = [0 0.2 0]; green
% max = [0.3 0.6 0.3];

% min = [0 0 0]; blue not working
% min = [0.01 0.4 0.4];
% Threshold the image to extract the red regions
red_mask = (img(:,:,1) >= min(1)) & (img(:,:,1) <= max(1)) & (img(:,:,2) >= min(2)) & (img(:,:,2) <= max(2)) & (img(:,:,3) <= max(3)) & (img(:,:,3) >= min(3));

% Clean up the mask using morphological operations
se = strel('square', 10);
red_mask = imclose(imopen(red_mask, se), se);

% Find connected components in the mas
cc = bwconncomp(red_mask );
% Extract the location of the red cubes as a list of centroids
stats = regionprops(cc, 'Centroid');
red_cubes = cat(1, stats.Centroid);
disp(red_cubes);
disp(size(red_cubes));
% Display the image with the red cubes marked
imshow(img);
hold on;
plot(red_cubes(:,1), red_cubes(:,2), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
red_cubes

%blue
% min = [0 0 0.55];
% max = [0.4 0.5 1];
min = [0 0.2 0.2]; 
% blue not working
max = [0.01 0.4 0.4];
blue_mask = (img(:,:,1) >= min(1)) & (img(:,:,1) <= max(1)) & (img(:,:,2) >= min(2)) & (img(:,:,2) <= max(2)) & (img(:,:,3) <= max(3)) & (img(:,:,3) >= min(3));

% Clean up the mask using morphological operations
se = strel('square', 10);
blue_mask = imclose(imopen(blue_mask, se), se);

% Find connected components in the mas
cc = bwconncomp(blue_mask);
% Extract the location of the red cubes as a list of centroids
stats = regionprops(cc, 'Centroid');
blue_cubes = cat(1, stats.Centroid);
disp(blue_cubes);
disp(size(blue_cubes));
% Display the image with the red cubes marked

plot(blue_cubes(:,1), blue_cubes(:,2), 'bo', 'MarkerSize', 10, 'LineWidth', 2);
hold on;

% yellow
min = [0.6 0.3 0.1];
max = [1 0.6 0.4];
yellow_mask = (img(:,:,1) >= min(1)) & (img(:,:,1) <= max(1)) & (img(:,:,2) >= min(2)) & (img(:,:,2) <= max(2)) & (img(:,:,3) <= max(3)) & (img(:,:,3) >= min(3));

% Clean up the mask using morphological operations
se = strel('square', 10);
yellow_mask = imclose(imopen(yellow_mask, se), se);

% Find connected components in the mas
cc = bwconncomp(yellow_mask);
% Extract the location of the red cubes as a list of centroids
stats = regionprops(cc, 'Centroid');
yellow_cubes = cat(1, stats.Centroid);
disp(yellow_cubes);
disp(size(yellow_cubes));
% Display the image with the red cubes marked

plot(yellow_cubes(:,1), yellow_cubes(:,2), 'yo', 'MarkerSize', 10, 'LineWidth', 2);
hold on;

% green
% min = [0 0.4 0.4];
% max = [0.4 1 0.55];
min = [0 0.2 0.09]; 
max = [0.18 0.6 0.3];
green_mask = (img(:,:,1) >= min(1)) & (img(:,:,1) <= max(1)) & (img(:,:,2) >= min(2)) & (img(:,:,2) <= max(2)) & (img(:,:,3) <= max(3)) & (img(:,:,3) >= min(3));

% Clean up the mask using morphological operations
se = strel('square', 10);
green_mask = imclose(imopen(green_mask, se), se);

% Find connected components in the mas
cc = bwconncomp(green_mask);
% Extract the location of the red cubes as a list of centroids
stats = regionprops(cc, 'Centroid');
green_cubes = cat(1, stats.Centroid);
disp(green_cubes);
disp(size(green_cubes));
% Display the image with the red cubes marked

plot(green_cubes(:,1), green_cubes(:,2), 'go', 'MarkerSize', 10, 'LineWidth', 2);
hold on;

cc = bwconncomp(green_mask);k
cc = bwconncomp(yellow_mask);k
cc = bwconncomp(blue_mask);k
cc = bwconncomp(red_mask);







% he = imread("testo1.png");
% imshow(he)
% title("H&E Image")
% 
% numColors = 3;
% L = imsegkmeans(he,numColors);
% B = labeloverlay(he,L);
% imshow(B)
% title("Labeled Image RGB")
% 
% lab_he = rgb2lab(he);
% 
% ab = lab_he(:,:,2:3);
% ab = im2single(ab);
% pixel_labels = imsegkmeans(ab,numColors,NumAttempts=3);
% 
% B2 = labeloverlay(he,pixel_labels);
% imshow(B2)
% title("Labeled Image a*b*")
% 
% mask1 = pixel_labels == 1;
% cluster1 = he.*uint8(mask1);
% imshow(cluster1)
% title("Objects in Cluster 1");
% 
% mask2 = pixel_labels == 2;
% cluster2 = he.*uint8(mask2);
% imshow(cluster2)
% title("Objects in Cluster 2");
% 
% mask3 = pixel_labels == 3;
% cluster3 = he.*uint8(mask3);
% imshow(cluster3)
% title("Objects in Cluster 3");
% 
% L = lab_he(:,:,1);
% L_blue = L.*double(mask3);
% L_blue = rescale(L_blue);
% idx_light_blue = imbinarize(nonzeros(L_blue));
% 
% blue_idx = find(mask3);
% mask_dark_blue = mask3;
% mask_dark_blue(blue_idx(idx_light_blue)) = 0;
% 
% blue_nuclei = he.*uint8(mask_dark_blue);
% imshow(blue_nuclei)
% title("Blue Nuclei")