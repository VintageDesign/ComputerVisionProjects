clear;
%force data regen
S = {dir(sprintf('%s/*.png','TrainingImages\imac0464\UnProcessed'))};
test_image_path = dir(sprintf('%s/*.png','C:\Users\riley\git\computer_vison_projects\Project_4\TestImages\imac0432\UnProcessed'));
for i = 1:size(test_image_path, 1)
   Images(:, : ,i) = im2double(imread(strcat(test_image_path(i).folder, '\', test_image_path(i).name)));
end
actual_poses  = importdata('C:\Users\riley\git\computer_vison_projects\Project_4\TestImages\RandAng.txt', ',');
match = 0;
miss = 0;


[U, sigma, image_vector, mean_A, X] = generateSingleManifold(S);
 k = plot_ER(image_vector, sigma);

for i = 1:3
   M(i,:) = X * U(:, i);
end


figure;
plot3(M(1, :), M(2, :), M(3, :), '.');


figure;
for i = 1:9
   subplot(3,3,i);
   imshow(reshape(U(:,i), [128, 128]),  []);
end
for w = 1:size(Images, 3)
% Load testing image
test = Images(:, : ,w);

test_image = test(:);

test_image_mean_center = test_image - mean_A;

for i = 1:3
   t(i,:) = test_image_mean_center' * U(:, i) ;
end

path_index = knnsearch(M', t');
file_name = S{1}(path_index).name;
index = extractBefore(extractAfter(file_name, '_'), '.');
closest_match = image_vector(path_index, :);
closest_match = reshape(closest_match, [128 128]);


pose = (2 * pi * str2double(index)) / 128;
actual = actual_poses(str2double(extractBefore(extractAfter(test_image_path(w).name, '_'), '.'))+1);

if (pose < actual + .3 && pose > actual - .3)
   match = match + 1; 
else
    miss = miss +1;
    
    disp("Missed by " + abs(actual - pose));
   figure;
subplot(1,2,1);
imshow(closest_match);
xlabel("Estimated pose: " + pose);

subplot(1,2,2);
imshow(test);
end

% 
% figure;
% subplot(1,2,1);
% imshow(closest_match);
% xlabel("Estimated pose: " + pose);
% 
% subplot(1,2,2);
% imshow(test);
end
disp("Matched " + match + " Test Images");