function show_components(image)
    I = load_image(image);
    I = rgb2gray(I);
    F = fft2(I);
    subplot(1,4,1);
    imshow(I);
    dim = size(I);
    
    F = fftshift(F);
    
    F_mag = 20*log10(abs(F));
    phase = real(angle(F));
    
    
    subplot(1, 4, 2);
    imshow(F_mag, []);
   
    dim = size (F_mag);
    filter = fspecial('gaussian', [dim(1) dim(2)], 30);
    filter = filter ./ max(filter(:));
    
    Low_pass = filter .* F;
    High_pass = F - Low_pass;
    
    low_pass = ifft2(ifftshift(Low_pass));
    high_pass = ifft2(ifftshift(High_pass));
    
    
    subplot(1,4,3);
    imshow(low_pass);
    subplot(1,4,4);
    imshow(high_pass);
    
    
    
    
    
    
end