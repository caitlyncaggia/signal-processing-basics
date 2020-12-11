% xx = imread('lighthouse.png', 'png');
% 
% down2 = xx(1:2:end,1:2:end);
% [r,c] = size(down2);
% subplot(1,2,1);
% imshow(xx);
% subplot(1,2,2);
% imshow(down2);


A = imread('house3.jpg', 'jpg');
G = rgb2gray(A);
% newim = double(A);
% r = newim(:,:,1);
% g = newim(:,:,2);
% b = newim(:,:,3);
% gray = (r + g + b)./3;
% G = uint8(cat(3, gray, gray, gray));

down = G(1:2:end,1:2:end);
[r,c] = size(down);
subplot(1,2,1);
imshow(G);
subplot(1,2,2);
imshow(down);

