function [root, xi_vec, xf_vec, error_vec] =...
         newton_raphson(func, xi, imax, error_tol)
% Newton Raphson Method
% xi is the initial X, imax is the maximum number of iterations
% error_tol is the error tolerence
% xi_vec, xf_vec, error_vec are vectors of initial and final X
% and errors

% Default values for imax and error_tol
if nargin == 2
    imax = 50;
    error_tol = 0.00001;
elseif nargin == 3
    error_tol = 0.00001;
end

f = sym(func);
f_dash = diff(f);

xi_vec = zeros(imax, 1);
xf_vec = zeros(imax, 1);
error_vec = zeros(imax, 1);
last_index = 0;

for i=1:imax
    % xf is final X resulted from the current iteration
    xf = xi - subs(f, xi) / subs(f_dash, xi);

    xi_vec(i, 1) = xi;
    xf_vec(i, 1) = xf;

    % Calculating error
    ea = abs((xf - xi) / xf);
    
    error_vec(i, 1) = ea;
    last_index = last_index + 1;
        
    % Check error tolerance
    if (ea < error_tol) 
        break;
    end
    
    xi = xf;
end

root = double(xf);
xi_vec = double(xi_vec(1:last_index, :));
xf_vec = double(xf_vec(1:last_index, :));
error_vec = double(error_vec(1:last_index, :));
format long

end