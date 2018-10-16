function [dxp, dyp] = interpolated_derivative(p, dx, dy)
    if mod(p(1, 1), 1) == 0 && mod(p(2, 1), 1) == 0
        dxp = dx(p(1, 1), p(2, 1));
        dyp = dy(p(1, 1), p(2, 1));
    else
        p11 = floor(p);
        p22 = floor(p) + 1;
        p12 = p11 + [0; 1];
        p21 = p11 + [1; 0];
        dxp = interpolate(p, p11, p12, p21, p22, dx);
        dyp = interpolate(p, p11, p12, p21, p22, dy);
    end
    
end