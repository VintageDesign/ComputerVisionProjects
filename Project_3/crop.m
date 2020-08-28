function cropped = crop(image)
    [row, col]  = find(image);
    max_row = max(row(:));
    max_col = max(col(:));
    cropped = imcrop(image,[1 1 max_col max_row]);
    
    [row, col]  = find(image ~= 0);
    min_row = min(row(:)  );
    min_col = min(col(:));
    cropped = imcrop(cropped,[min_col min_row size(cropped, 2) size(cropped, 1)]);
    
    

end