function final = generate_matrix(x, y, xp, yp)
len = size(x, 1);

final = [];
for idx = (1:len)
    single_point_homo = [ xp(idx), yp(idx), 1, 0, 0, 0, -x(idx)*xp(idx), -x(idx)*yp(idx), -x(idx);
        0, 0, 0, xp(idx), yp(idx), 1, -y(idx)*xp(idx), -y(idx)*yp(idx), -y(idx)];
    final = [final;single_point_homo];
end

end