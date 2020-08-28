function k = plot_ER(X, sigma)
    
    actual_energy_level = 0;
    k = 0;
    last_energy = 0;
    norm_x = norm(X, 'fro')^2;
    sigma = sum(sigma);
    while k < 128
        k = k +1;
        sigma_val = 0;
        for i = 1:k
            sigma_val = sigma_val + sigma(i);
        end
        
        actual_energy_level(k) = sigma_val^2 / norm_x;
        last_energy = actual_energy_level(k);
    end

    
    plot( 1:k, actual_energy_level(:), '-');
end