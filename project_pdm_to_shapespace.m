function projected_pdm = project_pdm_to_shapespace(pdm, mean_pdm, eigen_vec, eigen_val)
    % pdm is the pdm to be projected.
    % mean_pdm is the mean of all pdms.
    % eigen_vec is the eigen vectors of the shape space.
    % eigen_val is a list of corresponding eigen values.
    % projected_pdm is the return value.
    
    pdm = pdm - mean_pdm;
    coefficient = transpose(pdm) * eigen_vec; % project the pdm along the eigen vectors
    
    % Next cap the coefficient coefficients within -2.5 and 2.5 standard deviation
    % of the eigen values
    std_dev = sqrt(eigen_val);
    a = coefficient ./ std_dev;  % coeffcient = a .* std_dev
    bound = [-4, 4];
    a = (a > bound(1)) .* (a < bound(2)) .* a + (a < bound(1)) .* bound(1) + (a > bound(2)) .* bound(2); % This is where we clip a in bound
    projected_pdm = mean_pdm + eigen_vec * transpose(a .* std_dev);
end