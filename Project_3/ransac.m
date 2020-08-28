function H = ransac(matches)
x = matches(:, 3);
y = matches(:, 4);
xp = matches(:, 1);
yp = matches(:, 2);

fitness_percent = 0;


while fitness_percent < .8
    
    r = randperm(size(matches,1), 4);
    % Creates the nx9 matrix
    x_sample = [x(r(1)); x(r(2)); x(r(3)); x(r(4))];
    y_sample = [y(r(1)); y(r(2)); y(r(3)); y(r(4))];
    xp_sample = [xp(r(1)); xp(r(2)); xp(r(3)); xp(r(4))];
    yp_sample = [yp(r(1)); yp(r(2)); yp(r(3)); yp(r(4))];
    final = generate_matrix(x_sample,y_sample, xp_sample, yp_sample);
    
    %conduct singular value decomposition
    [~,~,v] = svd(final);
    
    H = v(:,9);
    
    H = H ./ H(9);
    H = reshape(H, [3, 3]).';
    fit_pop = 0;
    
    for i = 1:size(matches, 1)
        coord = [xp(i);yp(i);1];
        expected = [x(i);y(i);1];
        new_coord = H * coord;
        new_coord = new_coord ./ new_coord(3);
        outcome_x = new_coord(1) - expected(1);
        outcome_y = new_coord(2) - expected(2);
        if (outcome_x > -1 && outcome_x < 1 && outcome_y > -1 && outcome_y < 1)
           fit_pop = fit_pop + 1;
        end
    end
    
    fitness_percent = fit_pop / size(matches,1);
    
end
disp(H);

end