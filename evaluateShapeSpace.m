function [V, D] = evaluateShapeSpace(pdms, n_modes)
    % pdms = given point tuples of the object.
    % n_modes =  number of eigen modes that we choose to explain the pdms.
    % V is a matrix with n_modes columns with each column being the eigen
    % vectors in which directions pdms vary most. These are the basis of
    % our shape space.
    % D is a list of the corresponding eigen values.
    
    pdms = pdms - mean(pdms, 2);
    pdms = transpose(pdms);
    covar_pdms = cov(pdms);
    [V, D] = eig(covar_pdms);
    D = sum(D);
    [D_sorted, I] = sort(D, 'descend');
    V = V( : , I(1:n_modes));
    D = D(:, I(1:n_modes));
end