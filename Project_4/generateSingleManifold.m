function [U , sigma, image_vector, mean_A, X] = generateSingleManifold(S)



image_mean = zeros(128,128);
k = 1;

cell = S{k};
for i = 1:128
    F = cell(i);
    I = imread(strcat(F.folder,'\',F.name));
    if size(I,3) ~= 1
        I = rgb2grey(I);
    end
    I = im2double(I);
    
    image_vector(((k-1)*128 + i), :) = I(:);
    image_mean = image_mean + I;
end

A = image_mean / 128;

figure;
imshow(A,[]);

mean_A = A(:);


X = image_vector - mean_A';



[U, sigma, ~] = svd(X','econ');





end