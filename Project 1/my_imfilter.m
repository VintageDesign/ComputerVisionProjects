function filtered = my_imfilter(image, filter)
    filter_dim = size(filter);
    range = 0;
    color = size(size(image));
   
    if (mod(filter_dim(1),2) == 0 || mod(filter_dim(2),2) == 0)
       error('Filter cannot be an even size'); 
    elseif color(2) == 2
        range = 1:1;
    elseif color(2) == 3
        range = 1:3;  
    end
   
    %make sure filter is normalized
    %filter = filter ./ max(filter(:));
    
    
    for layer = range
        
       data = image(:,:,layer);
      
       filt_dim = size(filter);
       
        pad_cols = floor(filt_dim(1)/2);
        pad_rows = floor(filt_dim(2)/2);
       
        data = padarray(data,pad_rows,0);
        data = padarray(data.',pad_cols,0);
        data = data.';
       
       
       
       dim = size(data);
       
       
       start_filter_x = floor(filt_dim(1)/2);
       start_filter_y = floor(filt_dim(2)/2);
       start_x = ceil(filt_dim(1)/2);
       start_y = ceil(filt_dim(2)/2);
       for x = (start_x : dim(1) - start_x)
            for y = (start_y : dim(2) - start_y)
                sum = 0;
                x_filt_index = 1;
               for x_filt = (x - start_filter_x : x + start_filter_x)
                   y_filt_index = 1;
                   for y_filt = (y - start_filter_y : y + start_filter_y)
                       sum = sum + filter(x_filt_index,y_filt_index)*data(x_filt,y_filt);
                       y_filt_index = y_filt_index + 1;
                   end
                   x_filt_index = x_filt_index + 1;
               end
               data(x,y) = sum;
            end
       end
       
       filtered(:,:,layer) = data;
    end
    dim = size(filtered);
    
    for rows = (1 : pad_rows)
       filtered(1, :, :) =  [];
    end
    for rows = ( dim(1) - pad_rows + 1 : dim(1))
        dim = size(filtered);
       filtered(dim(1), :, :) =  [];
    end
    for cols = (1 : pad_cols)
       filtered(:,1, :) =  [];
    end
    for cols = ( dim(1) - pad_cols + 1: dim(1))
        dim = size(filtered);
       filtered(:,dim(2), :) =  [];
    end
    
    
end