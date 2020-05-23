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
try
    f = sym(func);
    f_dash = diff(f);
catch
	errorID = 'Bad Expression';
	msg = 'unable to parse the expression';
	baseException = MException(errorID, msg);
	throw(baseException);
end

xi_vec = zeros(0, 0);
xf_vec = zeros(0, 0);
error_vec = zeros(0, 0);

for i=1:imax
    % xf is final X resulted from the current iteration
    
    if subs(f_dash, xi) == 0
        xf = 0
        return 
    end
    try
        xf = xi - subs(f, xi) / subs(f_dash, xi);
    catch
        errorID = 'Bad Expression';
        msg = 'unable to parse the expression';
        baseException = MException(errorID, msg);
        throw(baseException);
    end

    xi_vec = [xi_vec xi];
    xf_vec = [xf_vec xf];

    % Calculating error
    ea = abs((xf - xi) / xf) * 100;
    
    error_vec = [error_vec ea];
        
    % Check error tolerance
    if (ea < error_tol) 
        break;
    end
    
    xi = xf;
end

root = double(xf);
xi_vec = double(xi_vec);
xf_vec = double(xf_vec);
error_vec = double(error_vec);
format long

try
    syms x
    plotX = root - 15 : 0.1 : root + 15;
    plotY = zeros(0,0);
    plotYDash = zeros(0,0);
    for i = 1 : size(plotX, 2)
        x=plotX(i);
        w=subs(f);
        wdash = subs(f_dash);
        plotY = [plotY w]; 
        plotYDash = [plotYDash wdash];
    end
catch ME
	errorID = 'Bad:Expression';
	msg = 'unable to parse the expression';
	baseException = MException(errorID, msg);
	throw(baseException);
end

plot(plotX, plotYDash, plotX, plotY,'.-'), legend('F Dash', 'F');
set(gca, 'XTick', root - 15 :1:root + 5,...
    'XTickLabel', root - 15 :1: root + 5);


end
