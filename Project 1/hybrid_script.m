% % 
% 
combined_image = gen_hybrid_image('3_B.bmp','3_A.bmp', 'spacial');
subplot(2,1,1);

imshow(combined_image);
title("Spacial");

combined_image = gen_hybrid_image('3_B.bmp','3_A.bmp', 'fourier');
subplot(2,1,2);

imshow(combined_image);
title("Fourier");
% 
% % 
% % 
% % 
% % 
% % 
% % 
% % % sobel = [ 1 0 -1; 2 0 -2; 1 0 -1];
% % % conv = [ -1 0 1; -2 0 2; -1 0 1];)
% % % 
% % % I = load_image('1_A.bmp');
% % % 
% % % filt = imfilter(I, sobel);
% % % conv_filt = imfilter(I, conv);
% % % subplot(1,3,3);
% % % imshow(conv_filt);
% % % subplot(1,3,2);
% % % imshow(filt);
% % % 
% % % subplot(1,3,1);
% % % imshow(I);
% % 
% % sigma = 15;
% % I = load_image('3_B.bmp');
% % filter = fspecial('gaussian', 4*sigma + 1, sigma);
% % 
% % low = imfilter(I, filter);
% % high = I - imfilter(I,filter);
% % subplot(1,4,4);
% % imshow(high);
% % subplot(1,4,3);
% % imshow(low);
% % 
% % subplot(1,4,1);
% % imshow(I);
% % 
% % subplot(1,4,2);
% % imshow(filter, []);
% % % 
% % 
% % 
% % 
% % Read in the testing image
% img = imread('bookshelf.jpg');
% % Max number of iterations 
% max_iteration = 32;
% % Create a results matrix
% timechart = zeros(max_iteration, 13);
% 
% % Use a parallel for loop to decrease wait time
% parfor i = 1:max_iteration
%     % Get a temp img
%     timg = imresize(img, i/max_iteration);
%     % Get a results vector
%     v = zeros(1,13);
%     % Get times for kernel size 3 - 15
%     for x = 3:15
%         % Start timer
%         tic;
%         % create the kernel
%         h = fspecial('gaussian',x, 4);
%         % normalize it
%         h = h ./ max(h(:));
%         % Apply filter
%         imfilter(timg, h);
%         % Store end time
%         time = toc;
%         % Save end time in vector
%         v(x-2) = time;
%     end
%     % Save items in time results matrix
%     timechart(i, :) = v;
% end
% 
% 
% % Plot the results
% [Y, X] = ndgrid(1:size(timechart,1), 1:size(timechart,2));
% scatter3(X(:), Y(:), timechart(:));
% xlabel("Filter Size");
% ylabel("Image Size (Between .25mp and 8mp)");
% zlabel("Time Elapsed");


% image_1 = rgb2gray(load_image('1_A.bmp'));
% image_2 = rgb2gray(load_image('1_B.bmp'));
% 
% 
% subplot(4,3,1);
% imshow(image_1);
% subplot(4,3,3);
% imshow(image_2);
% 
% 
% hybrid = hybrid_image_color(image_1, image_2);
% 
% subplot(4, 3, 11);
% imshow(hybrid);







