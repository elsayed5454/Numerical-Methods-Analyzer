function [xr, x0_vec, x1_vec, x2_vec, err_vec] =...
         secant(a, x0, x1, iterationsNum, epsilon)
     
% Default values for imax and error_tol
if nargin == 3
    iterationsNum = 50;
    epsilon = 0.00001;
elseif nargin == 4
    epsilon = 0.00001;
end

try
    f = sym(a);
catch
	errorID = 'Bad Expression';
	msg = 'unable to parse the expression';
	baseException = MException(errorID, msg);
	throw(baseException);
end

x0_vec = zeros(0, 0);
x1_vec = zeros(0, 0);
x2_vec = zeros(0, 0);
err_vec = zeros(0, 0);

for i=1:iterationsNum
    denominator = subs(f, x1) - subs(f, x0);
    if denominator == 0
        x2 = 0
        return
    end
    try
        x2 = x1 - subs(f, x1) * (x1 - x0) / denominator;
    catch
        errorID = 'Bad Expression';
        msg = 'unable to parse the expression';
        baseException = MException(errorID, msg);
        throw(baseException);
    end
    
    x0_vec = [x0_vec x0];
    x1_vec = [x1_vec x1];
    x2_vec = [x2_vec x2];
    
    err = abs((x2 - x1) / x2) * 100;
    err_vec = [err_vec err];
    
    x0=x1;        
    x1=x2;
    xr=x2;
   if err<epsilon,break,end
end

xr = double(xr);
x0 = double(x0);
x1 = double(x1);
x2 = double(x2);
err_vec = double(err_vec);

try
    syms x
    plotX = xr - 15 : 0.1 : xr + 15;
    plotY = zeros(0,0);
    for i = 1 : size(plotX, 2)
        x=plotX(i);
        w=subs(f);
        plotY = [plotY w]; 
    end
catch ME
	errorID = 'Bad:Expression';
	msg = 'unable to parse the expression';
	baseException = MException(errorID, msg);
	throw(baseException);
end

plot(plotX, plotY), legend('F');
set(gca, 'XTick', xr - 15 :1:xr + 5,...
    'XTickLabel', xr - 15 :1: xr + 5);

end