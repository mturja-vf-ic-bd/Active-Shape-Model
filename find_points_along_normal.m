function P = find_points_along_normal(point, normal, step, count, dim)
    % find count points from point along normal and count points from point
    % along -normal
    P = zeros(2*count, 2);
    temp_point = transpose(point);
    k = 1;
    for i = -count + 1:count
        if i == 1
            temp_point = transpose(point);
        end
        
        temp_point = temp_point + ((i > 0) .* 2 - 1) .* step .* normal; % step forward or backward depending on the sign of i
        
        l1 = temp_point < (dim - 1);
        l2 = temp_point > 1;
        if prod(prod(l1 .* l2, 1), 2) == 1
            P(k, :) = [temp_point(1,1), temp_point(2,1)];
            k = k + 1;
        end
    end
    P = P(1:(k-1),:);
end