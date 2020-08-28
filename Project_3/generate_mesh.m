function new_image = generate_mesh(image_1, image_2)

[y1, x1] = size(image_1);
[y2, x2] = size(image_2);
z = 1;
nHeight = max(y1, y2);

% check if we have a RGB or grayscale image
if (size(image_1,3) == 3)
    x1 = x1/3;
    x2 = x2/3;
    z = 3;
end

% make an image of all zeros and 10 pixel space in between them
new_image = zeros(nHeight, x1 + 10 + x2, z);

% add the image data to our new image
new_image(nHeight-y1+1:y1, 1:x1, :) = image_1(1:y1, 1:x1, :);
new_image(nHeight-y2+1:y2, x1+11:x1+10+x2, :) = image_2(1:y2, 1:x2, :);

end