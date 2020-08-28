function image = load_image(file_path)
    image = imread(file_path);
    image = im2double(image);   
end