clear;
<<<<<<< HEAD
image_1 = load_image('images/Custom/frame_side.jpg');
image_2 = load_image('images/Tile/Tile_2.jpg');
=======
image_1 = load_image('images/Custom/crossfit_face.jpg');
image_2 = load_image('images/Custom/head.png');
>>>>>>> 637bf38402140be7902aa9d66797862dd964e53e
% image_1 = rgb2gray(image_1);
%image_2 = rgb2gray(image_2);
image_1 = imresize(image_1, .125);
image_2 = imresize(image_2, .125);
[y1, x1, z1] = size(image_1);

 new_image = generate_mesh(image_1, image_2);
 figure1 = figure();
 imshow(image_2);


% % Make sure the first 4 points are on left image
[x, y] = ginput(4);
[xp, yp] = ginput(4);
xp = xp - x1 - 10;

% Creates the nx9 matrix
final = generate_matrix(xp,yp, x, y);

if size(final,1) == 4
    H = null(final);
else
    %conduct singular value decomposition
    [u,s,v] = svd(final);
    
    H = v(:,9);
end
H = H ./ H(9);
H = reshape(H, [3, 3])';

channels = size(image_2,3);
for c = 1:channels
hybrid_image(:,:,c)  = crop(single_channel_mesh(H, image_1(:,:,c), image_2(:,:,c)));
end
% subplot(1,2,2);

figure_2 = figure();
 imshow(hybrid_image)