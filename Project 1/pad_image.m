function image = pad_image(image)
dim = size(image);
    
    if dim(1) > dim(2)
        pad = dim(1) - dim(2);
        image = padarray(image.', pad, 0, 'post');
        image = image.';
    else
        pad = dim(2) - dim(1);
        image = padarray(image,pad,0, 'post');
    end
end