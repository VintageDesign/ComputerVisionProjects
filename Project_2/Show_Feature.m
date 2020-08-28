function Show_Feature(image, features)
% Features need to look like [x,y,scale, theta]
feature_count = size(features);

imshow(image);
hold on;

for index = 1:feature_count(1)
    box = [ 1, 1, -1, -1, 1, 0; 1, -1, -1, 1, 1, 1];
    
    theta = features(index, 4);
    x_pos = features(index, 1);
    y_pos = features(index, 2);
    %scale = features(index, 3);
    scale = 4;

    
    transform = [ scale * cosd(theta), scale * -sind(theta); scale * sind(theta), scale * cosd(theta)];
    
    box = transform * box;
    
    for index_2 = 1:6
        box(:, index_2) = box(:, index_2) + [x_pos; y_pos];
        
    end
    
    box(:,7) = [x_pos; y_pos];
    plot(box(2,:), box(1,:), 'r-', 'LineWidth', 1.25);
    hold on;
end


end