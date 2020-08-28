clear;

test_image_path = 'C:\Users\riley\git\computer_vison_projects\Project_4\TestImages\Boat32\UnProcessed\img_0.png';
S = {dir(sprintf('%s/*.png','TrainingImages/Boat64/UnProcessed'))};
image_mean = zeros(128,128);

cell = S{1};
for i = 1:128
    F = cell(i);
    I = imread(strcat(F.folder,'\',F.name));
    % PCA is less of a headache in greyscale
    if size(I,3) ~= 1
        I = rgb2grey(I);
    end
    I = im2double(I);
    I(:) = I;
    image_vector(i, :) = I(:);
    image_mean = image_mean + I;
end


mean_A = image_mean / 128;
figure;
imshow(mean_A);
mean_A = mean_A(:);


X = image_vector - mean_A(:)';


for i = 1:size(X, 1)
    
    [U, sigma, ~] = svd(reshape(X(i,:), [128 128]));
    
    % Concat each U into L
    U = U(:);
    
    L(i, :) = U;
    
end

[U, sig, ~] = svd(L', 'econ');

%k = ComputeER(image_vector, sigma, .95); Broke as shit
k = 3;
for i = 1:k
    M(i,:) = X * U(:, i) ;
end

figure;
plot3(M(1, :), M(2, :), M(3, :), '.');


figure;
for i = 1:9
    subplot(3,3,i);
    imshow(reshape(U(:,i), [128, 128]), []);
end

% Load testing image
test_image = imread(test_image_path);
test = im2double(test_image);

test_image = test(:);

test_image_mean_center = test_image - mean_A;

for i = 1:3
    t(i,:) = test_image_mean_center' * U(:, i) ;
end

index = knnsearch(M', t');

closest_match = image_vector(index, :);
closest_match = reshape(closest_match, [128,128]);

figure;
subplot(1,2,1);
imshow(closest_match);

subplot(1,2,2);
imshow(test);
