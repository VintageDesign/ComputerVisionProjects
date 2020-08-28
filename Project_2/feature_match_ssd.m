image_1 = load_image('images/p_1.ppm');
image_2 = load_image('images/p_5.ppm');
% For Yosemite cutoff = .27, make the first g a 3,2 and the second a 5,3
% For the cars, cutoff = .36, guassian are a 3,2 and a 7,3


corners_1 = detect_corners(image_1);
corners_2 = detect_corners(image_2);

dim_1 = size(image_1);
dim_2 = size(image_2);

row_max = max([dim_1(1), dim_2(1)]);


images = zeros (row_max, dim_1(2)+dim_2(2),dim_1(3));

images(1:dim_1(1),1:dim_1(2),:) = image_1;
images(1:dim_2(1),dim_1(2)+1:dim_1(2)+dim_2(2),:) = image_2;

imshow(images);
hold on;


corner1_count = size(corners_1);
corner2_count = size(corners_2);

for i = 1:corner1_count(1)
    iter = 1;
    match = [];
    for j = 1:corner2_count(1)
        i1 = corners_1(i,1);
        i2 = corners_2(j,1);
        
        
        j1 = corners_1(i,2);
        j2 = corners_2(j,2)+dim_1(2);
       
        js = [j1 j2];
        is = [i1 i2];
        
        corners_1(i, 3:27) = corners_1(i, 3:27)./max( corners_1(i, 3:27));
        corners_2(j, 3:27) = corners_2(j, 3:27)./max( corners_2(j, 3:27));
        diff = sum((corners_1(i, 3:27) - corners_2(j, 3:27)).^2);
        
        
        %.006 works well as a diff for Just an SSD
        if diff <= .006
            match = [match; diff, is, js];
            iter = iter + 1;
       end
        
        
    end
    
    count = size(match);
    if count(1) > 0
        
      %  top = sortrows(match, 1, 'ascend');
     %  reject = top(1,1) / top(2,1);
     %   if reject < .14
            is = match(1, 2:3);
            js = match(1, 4:5);
            plot(js(:), is(:), 'ro-');
            hold on;
     %  end
    end
    
end





