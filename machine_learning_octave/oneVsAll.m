function [all_theta] = oneVsAll(X, y, num_labels, lambda)
    %ONEVSALL trains multiple logistic regression classifiers and returns all
    %the classifiers in a matrix all_theta, where the i-th row of all_theta 
    %corresponds to the classifier for label i
    %   [all_theta] = ONEVSALL(X, y, num_labels, lambda) trains num_labels
    %   logistic regression classifiers and returns each of these classifiers
    %   in a matrix all_theta, where the i-th row of all_theta corresponds 
    %   to the classifier for label i
    %
    % Credit: Keivan Hassani Monfared, k1monfared@gmail.com and Andrew Ng, Coursera Team

    % Some useful variables
    m = size(X, 1);
    n = size(X, 2);

    % preallocate
    all_theta = zeros(num_labels, n + 1);

    % Add ones to the X data matrix
    X = [ones(m, 1) X];

    % Train num_labels logistic regression classifiers with regularization
    % parameter lambda. 
    for c = 1:num_labels
        % Initialize fitting parameters
        initial_theta = zeros(size(X, 2), 1);

        % Set Options
        options = optimset('GradObj', 'on', 'MaxIter', 50);

        % Optimize
        [theta] = fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
                         initial_theta, options);

        all_theta(c,:) = theta(:)';
    end
end
