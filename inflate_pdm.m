function inflated_pdm = inflate_pdm(pdm, shape_space, factor)
    [normalized_pdm, t, r] = get_normalized_pdm(pdm);
    coeff = factor .* (transpose(normalized_pdm) * shape_space);
    inflated_pdm_unnormalized = transpose(coeff * transpose(shape_space));
    inflated_pdm = reverse_normalize(inflated_pdm_unnormalized, t, r);
end