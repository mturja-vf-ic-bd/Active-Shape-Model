function normal = find_normal(previous_point, point, future_point)
    normal1 = [0, -1; 1, 0] * transpose(point - previous_point);
    normal1 = normal1/(sqrt(sum(normal1.^2))); % making it unit vector

    % find normal on the line between i th and i+1 th point
    normal2 = [0, -1; 1, 0] * transpose(future_point - point);
    normal2 = normal2/(sqrt(sum(normal2.^2))); % making it unit vector
    normal = 0.5 * (normal1 + normal2); % taking average.
    normal = normal/(sqrt(sum(normal.^2)));
end