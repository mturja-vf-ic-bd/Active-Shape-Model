function [newpdm, image_match] = move_pdm(grayimage, correctpdm, enforce)
    % grayimage is the grayscale image of the where we are searching for
    % correctpdm is the pdm in image space
    n = length(correctpdm);
    newpdm = zeros(n, 1);
    image_match = 0;
    correctpdm = [correctpdm(1:2:n), correctpdm(2:2:n)]; % split x and y coordinates into two columns
    n = length(correctpdm);
    
    if exist('dx.txt', 'file') == 2 && enforce == 0
        dx = dlmread('dx.txt');
        dy = dlmread('dy.txt');
    else
        [dx, dy] = Derivative(grayimage, 0.5);
        dlmwrite('dx.txt', dx);
        dlmwrite('dy.txt', dy);
    end
    
    % some adjustment due to axis mismatch between image space and
    % mathematical axis. I am not comfortable with treating row as y and
    % column as x so I am transposing it.
    dx = transpose(dx);
    dy = -transpose(dy);
    for i = 1:n
        point = correctpdm(i, :);
        [dxp, dyp] = interpolated_derivative(transpose(point), dx, dy);
        D = [dxp,dyp];
        % find normal on the line between i-1 th and i th point
        if i == 1
            previous_point = correctpdm(n, :);
        else
            previous_point = correctpdm(i-1, :);
        end
        
        if i == n
            future_point = correctpdm(1, :);
        else
            future_point = correctpdm(i+1, :);
        end
        
        normal = find_normal(previous_point, point, future_point);
        g2Imatch = D * normal; % geometry to image match. We want to maximize this.
        
        P = find_points_along_normal(point, normal, 1, 50, 256);
        
        for j = 1:length(P)
            p = P(j, :);
            [dxp, dyp] = interpolated_derivative(transpose(point), dx, dy);
            D = [dxp,dyp];
            temp = D * find_normal(previous_point, p, future_point);
            if temp > g2Imatch
                g2Imatch = temp;
                point = p;
            end
        end
        
        newpdm(2 * i - 1, 1) = point(1, 1);
        newpdm(2 * i, 1) = point(1, 2);
        image_match = image_match + g2Imatch;
    end
end