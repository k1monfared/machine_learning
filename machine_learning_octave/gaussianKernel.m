function sim = gaussianKernel(x1, x2, sigma)
    %RBFKERNEL returns a radial basis function kernel between x1 and x2
    %   sim = gaussianKernel(x1, x2) returns a gaussian kernel between x1 and x2
    %   and returns the value in sim
    %
    % Credit: Keivan Hassani Monfared, k1monfared@gmail.com and Andrew Ng, Coursera Team

    % Ensure that x1 and x2 are column vectors
    x1 = x1(:); x2 = x2(:);

    %   Return the similarity between x1
    %   and x2 computed using a Gaussian kernel with bandwidth sigma
 
    sim = exp(- norm(x1-x2)^2 / (2*sigma^2));
end
