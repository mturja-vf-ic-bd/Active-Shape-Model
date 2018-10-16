function val = interpolate(p, p11, p12, p21, p22, g)
    del_p = p - p11;
    g11 = g(p11(1,1), p11(2,1));
    g12 = g(p12(1,1), p12(2,1));
    g21 = g(p21(1,1), p21(2,1));
    g22 = g(p22(1,1), p22(2,1));
    del_x = del_p(1, 1);
    del_y = del_p(2, 1);
    val = (del_x * del_y) * (g22 - g12 - g21 + g11) + [g21 - g11, g12 - g11] * del_p + g11;
end