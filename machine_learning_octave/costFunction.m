function [J, grad] = costFunction(theta, X, y)
    %COSTFUNCTION Compute cost and gradient for logistic regression
    %   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
    %   parameter for logistic regression and the gradient of the cost
    %   w.r.t. to the parameters.
    %
    % Credit: Keivan Hassani Monfared, k1monfared@gmail.com and Andrew Ng, Coursera Team

    % Initialize some useful values
    m = length(y); % number of training examples

    %   Compute the cost of a particular choice of theta.
    %   You should set J to the cost.
    %   Compute the partial derivatives and set grad to the partial
    %   derivatives of the cost w.r.t. each parameter in theta
    %
    % Note: grad has the same dimensions as theta
    
    h = sigmoid(X * theta);
    J = - (y' * log(h) + (1-y)' * log(1-h)) / m;
    grad = (h-y)' * X / m;
end
