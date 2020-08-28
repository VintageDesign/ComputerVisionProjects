function corners = detect_corners(I)



I = rgb2gray(I);
I = imfilter(I, fspecial('gaussian', 3, 2));


fx = imfilter(I, [1 2 1; 0 0 0; -1 -2 -1]);
fy = imfilter(I, [1 0 -1; 2 0 -2; 1 0 -1]);

gaussian = fspecial( 'gaussian',7, 3);



Ix = imfilter(fx .* fx, gaussian);
Iy = imfilter(fy .* fy, gaussian);

Ixy = imfilter(fy .* fx, gaussian);

dim = size(I);
window_size = 5;
pad = floor(window_size/2);


cutoff = .01;

corner = Ix.*Iy - (Ixy .^2) ./ (Ix+Iy);

corner(1:2, :) = 0;
corner(end-1:end,:) = 0;
corner(:,1:2) = 0;
corner(:,end-1:end) = 0;


for i = pad+1:dim(1)-pad-1
    for j = pad+1:dim(2)-pad-1
        if corner(i,j) < cutoff
            corner(i,j) = 0;
        end
    end
end
iter = 1;
for i = pad+1:dim(1)-pad-1
    for j = pad+1:dim(2)-pad-1
        if corner(i,j) == max(max(corner(i-pad:i+pad, j-pad:j+pad))) && corner(i,j) ~= 0
            window = reshape(I(i-2:i+2, j-2:j+2), 1, []);
            
            corners(iter,1:2) = [i, j];
            corners(iter,3:27) = window;
            iter = iter + 1;
        end
    end
end


end