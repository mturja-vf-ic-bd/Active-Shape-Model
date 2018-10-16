function list=make_list_of_points(point)
    [m, n] = size(point);
    list=reshape(transpose(point), m * n, 1);
end