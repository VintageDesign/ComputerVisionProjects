function new_image = single_channel_mesh(H, image_1, image_2)
[y1, x1] = size(image_1);
[y2, x2] = size(image_2);
z = 1;
nHeight = max(y1, y2);

len = size(image_2);


new_image = zeros(nHeight*3, (x1)*3, z);

new_image(y1:y1*2-1, 1:x1, :) = image_1(1:y1, 1:x1, :);


H = inv(H);
area = 1;
for y_idx = area+1:len(1)-area
    for x_idx = area+1:len(2)-area
        coord = [x_idx; y_idx; 1];
        
        new_coord = H * coord;
        new_coord = round(new_coord ./ new_coord(3));
        x_p = new_coord(1);
        y_p = new_coord(2);
 
        if (x_p > 1 && y_p > 1)
        interpretation = interp2(image_2(y_idx - area:y_idx + area, x_idx - area:x_idx + area));
        [y,x]=size(interpretation);
        y = ceil(y/2);
        x = ceil(x/2);
        new_image(y_p-area + nHeight:y_p+area+nHeight, x_p-area:x_p+area) = interpretation(y-area:y+area, x-area:x+area);
        end
        
    end
end
end
