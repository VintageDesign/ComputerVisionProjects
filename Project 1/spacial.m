function new_image = spacial(image_1, image_2)
sigma_2 = 3; % high_pass
sigma_1 = 8; % low pass

low_pass = fspecial('gaussian', 6*sigma_1 + 1, sigma_1);
high_pass = fspecial('gaussian', 6*sigma_2 + 1, sigma_2);

high_filtered = image_2 - my_imfilter(image_2, high_pass);
low_filtered =  my_imfilter(image_1, low_pass);


new_image =  high_filtered + low_filtered;
end