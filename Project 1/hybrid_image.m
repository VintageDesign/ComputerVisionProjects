function hybrid_image(image_1, image_2)
    data_1 = rgb2gray(load_image(image_1));
    data_2 = rgb2gray(load_image(image_2));
    
    dim = size(data_1);
    
    if dim(1) > dim(2)
        pad = dim(1) - dim(2);
        data_1 = padarray(data_1.', pad, 0, 'post');
        data_1 = data_1.';
    else
        pad = dim(2) - dim(1);
        data_1 = padarray(data_1,pad,0, 'post'); 
    end

    dim = size(data_2);
    
    if dim(1) > dim(2)
        pad = dim(1) - dim(2);
        data_2 = padarray(data_2.', pad, 0, 'post');
        data_2 = data_2.';
    else
        pad = dim(2) - dim(1);
        data_2 = padarray(data_2,pad,0, 'post'); 
    end
    
    
    F1 = fft2(data_1);
    F2 = fft2(data_2);
    

    %F_mag_1 = 20*log10(abs(F1));
    F_mag_1 = fftshift(F1);
    F_mag_2 = fftshift(F2);
    dim = size(F_mag_1);
    high_pass = fspecial('gaussian',dim(1),30);
    high_pass = high_pass ./ max(high_pass(:));
    
    low_pass = fspecial('gaussian',dim(1),15);
    low_pass = low_pass ./ max(low_pass(:));
    
   
    F_mag_1 = low_pass.*F_mag_1;
    F_mag_2 = F_mag_2 - (high_pass.*F_mag_2);
    
    new_image = F_mag_1 + F_mag_2;
    
    new_image = ifftshift(new_image);
    new_image = ifft2(new_image);
    imshow(new_image, []);
    %subplot(1,2,2);
    %imshow(new_image_2, []);
    
    
end


 