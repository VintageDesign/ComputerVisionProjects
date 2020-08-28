
function matches = match(image_1, image_2)
    image_1 = rgb2gray(image_1);
    image_2 = rgb2gray(image_2);

    points_1 = detectHarrisFeatures(image_1);
    points_2 = detectHarrisFeatures(image_2);
    
    [features_1, valid_points_1] = extractFeatures(image_1, points_1);
    [features_2, valid_points_2] = extractFeatures(image_2, points_2);
        
    pairs = matchFeatures(features_1, features_2);
    
    matched_points_1 = valid_points_1(pairs(:,1),:);
    matched_points_2 = valid_points_2(pairs(:,2),:);
    
    matches = [ matched_points_1.Location(:, 1), matched_points_1.Location(:,2), ...
        matched_points_2.Location(:, 1), matched_points_2.Location(:,2)];
    
end




