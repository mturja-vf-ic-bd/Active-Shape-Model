function pdm = reverse_normalize(normalized_pdm, mu, eig_vec)
    n = length(normalized_pdm);
    normalized_pdm_mat = [normalized_pdm(1:2:n,:), normalized_pdm(2:2:n,:)];
    pdm = normalized_pdm_mat*transpose(eig_vec) + mu;
    pdm = make_list_of_points(pdm);
end