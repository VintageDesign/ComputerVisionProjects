clear;
%force data regen
force = false;
object_types = ["Boat", "Cabinet", "Cup", "Flashlight", "Car", "Chair", ...
    "Handle", "Hose Reel", "iBook", "2004 iMac", "1998 iMac", "Keyboard",...
    "LED", "Light v1", "Light v2", "Mug", "Scooter", "Spray Bottle", ...
    "Stapler", "Trash can"];
    
test_image_path = selectImage();

% 
% if (isfile('trainingdata.mat') && force == false)
%     % File exists.
%     load('trainingdata.mat');
% else
%     %load folder with training images
%     [U, sigma, image_vector, mean_A, X] = generateManifold();
%     save('trainingdata.mat','U','sigma','image_vector','mean_A','X');
% end
[U, sigma, image_vector, mean_A, X] = generateBadManifold();

k = ComputeER(image_vector, sigma, .95);

for i = 1:k
   M(i,:) = X * U(:, i) ;
end


% figure;
% plot3(M(1, :), M(2, :), M(3, :), '.');
% 
% 
% figure;
% for i = 1:9
%    subplot(3,3,i);
%    imshow(reshape(U(:,i), [128, 128]), []);
% end

% Load testing image
test_image = imread(test_image_path);
test = im2double(test_image);

test_image = test(:);

test_image_mean_center = test_image - mean_A;

for i = 1:k
   t(i,:) = test_image_mean_center' * U(:, i) ;
end

path_index = knnsearch(M', t');
closest_match = image_vector(path_index, :);
closest_match = reshape(closest_match, [128 128]);

figure;
subplot(1,2,1);
imshow(closest_match);
xlabel("Object is a: " + object_types(ceil(path_index/128)));

subplot(1,2,2);
imshow(test);