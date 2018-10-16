function [normalized_pdm, mu, eig_vec] = get_normalized_pdm(pdm)
    n = length(pdm);
    x = pdm(1:2:n,:);
    y = pdm(2:2:n,:);
    mean_x = mean(x, 1);
    mean_y = mean(y, 1);
    mu = [mean_x, mean_y];
    x = x - mean_x;
    y = y - mean_y;
    
    moment = sum(x.*x) * [1, 0; 0, 0] + transpose(x) * y * [0, 1; 1, 0] + sum(y.*y) * [0, 0; 0, 1];
    %moment = cov([x, y]);
    [eig_vec, eig_val] = eig(moment);
    
    % sort the eigens in descending order
    [sorted_eig_val, Ind] = sort(sum(eig_val), 'descend');
    eig_vec = eig_vec(:, Ind);
    
    % normalizing the eigen vector to unit vector
    %eig_vec = eig_vec * diag(1./transpose(sqrt(sum(eig_vec.^2))));
    
    normalized_pdm_mat = [x, y] * eig_vec;
    normalized_pdm = make_list_of_points(normalized_pdm_mat);
end