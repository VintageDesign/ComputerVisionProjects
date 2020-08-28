function new_image_1 = hybrid_image_color(image_1, image_2)


color = size(size(image_1));
disp(color);
if color(2) == 2
    range = 1:1;
elseif color(2) == 3
    range = 1:3;
end

for x = range
    data_1 = image_1(:,:,x);
    data_2 = image_2(:,:,x);
    
    %data_1 = pad_image(data_1);
    %data_2 = pad_image(data_2);
    
    
    F1 = fft2(data_1);
    F2 = fft2(data_2);
    
    %F_mag_1 = 20*log10(abs(F1));
    F_mag_1 = fftshift(F1);
    F_mag_2 = fftshift(F2);
    
    subplot(4,3,4);
    imshow(20*log10(abs(F_mag_1)), []);
    subplot(4,3,6);
    imshow(20*log10(abs(F_mag_2)), []);
    
    
    dim = size(F_mag_1);
    high_pass = fspecial('gaussian',[dim(1) dim(2)],10);
    high_pass = high_pass ./ max(high_pass(:));
    
    low_pass = fspecial('gaussian',[dim(1) dim(2)],7);
    low_pass = low_pass ./ max(low_pass(:));
    
   
    F_mag_1 = low_pass.*F_mag_1;
    F_mag_2 = F_mag_2 - (high_pass.*F_mag_2);
    
    
    subplot(4,3,7);
    imshow(20*log10(abs(F_mag_1)), []);
    subplot(4,3,9);
    imshow(20*log10(abs(F_mag_2)), []);
    
    
    
    new_image = F_mag_1 + F_mag_2;
    new_image = ifftshift(new_image);
    new_image_1(:,:,x) = ifft2(new_image);
end








end


