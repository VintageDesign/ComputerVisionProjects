function combined_img = gen_hybrid_image(image_1, image_2, method)
image_1 = load_image(image_1);
image_2 = load_image(image_2);

switch method
    case 'spacial'
        new_image = spacial(image_1, image_2);
    
    case 'fourier'
        new_image = hybrid_image_color(image_1, image_2);
end
        


new_image_1 = imresize(new_image, .5);
new_image_2 = imresize(new_image_1, .5);
new_image_3 = imresize(new_image_2, .5);
new_image_4 = imresize(new_image_3, .5);

[rows(1), cols(1)] = size(new_image);
[rows(2), cols(2)] = size(new_image_1);
[rows(3), cols(3)] = size(new_image_2);
[rows(4), cols(4)] = size(new_image_3);
[rows(5), cols(5)] = size(new_image_4);
if (size(new_image,3) == 3)
    cols = cols ./ 3;
end 
disp(rows(1));
disp(sum(cols));
combined_img = zeros(rows(1), sum(cols(:)), 3);
combined_img(1:rows(1), 1:cols(1), :) = new_image;
running_cols = cols(1);
combined_img(rows(1) - rows(2)+1 : rows(1), cols(1):cols(1)+cols(2)-1, :) = new_image_1;
combined_img(rows(1)-rows(3)+1:rows(1), cols(1)+cols(2):cols(1)+cols(2)+cols(3)-1, :) = new_image_2;
combined_img(rows(1)-rows(4)+1:rows(1), cols(1)+cols(2)+cols(3):cols(1)+cols(2)+cols(3)+cols(4)-1, :) = new_image_3;
combined_img(rows(1)-rows(5)+1:rows(1), cols(1)+cols(2)+cols(3)+cols(4):cols(1)+cols(2)+cols(3) + cols(4) + cols(5)-1, :) = new_image_4;





end