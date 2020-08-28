clear;


image_1 = imread('images/Yard/Y1.jpg');
image_2 = imread('images/Yard/Y3.jpg');
image_1 = imresize(image_1, .25);
image_2 = imresize(image_2, .25);

[y1, x1, z1] = size(image_1);

image_1 = im2double(image_1);
image_2 = im2double(image_2);

matches = match(image_1, image_2);
H = ransac(matches);
channels = size(image_1,3);
for c = 1:channels
new_image(:,:,c)  = crop(single_channel_mesh(H, image_1(:,:,c), image_2(:,:,c)));
% new_image(:, :, c) = crop(new_image(:, :, c));

end
% subplot(1,2,2);
figure_2 = figure();
 imshow(new_image)