function [root, xLowerVec, xHighVec, xMidVec, yLowerVec, yHighVec, yMidVec ,errorVec] = regulaFalsi(formula, lower, upper, maxError, maxIter);

%take the function as input
func = inline(formula);


%initialize vectors to store all the iterations 
xLowerVec = zeros(0,0);
xHighVec = zeros(0,0);
xMidVec = zeros(0,0);
errorVec = zeros(0,0);
yHighVec = zeros(0,0);
yLowerVec = zeros(0, 0);
yMidVec = zeros(0, 0);



try
	f = sym(formula);
	f_dash = diff(f);



	%store the latest two approx roots
	rootVals = [0;0];

	syms x
	plotX = lower : 0.1 :upper;
	plotY = zeros(0,0);
	plotYDash = zeros(0,0);


	for i = 1 : size(plotX, 2)
	    x=plotX(i);
	    w=subs(f);
	    wdash = subs(f_dash);
	    plotY = [plotY w]; 
	    plotYDash = [plotYDash wdash];
	end
catch
	errorID = 'Bad Expression';
	msg = 'unable to parse the expression';
	baseException = MException(errorID, msg);
	throw(baseException);
end

plot(plotX, plotYDash, plotX, plotY,'.-'), legend('F Dash', 'F');
set(gca, 'XTick', lower :1:upper,...
    'XTickLabel', lower :1:upper);

if func(lower) == 0
    root = lower;
    return;
end

if func(upper) == 0
    root = upper;
    return;
end

%check if the interval is valid
if (func(lower) * func(upper)) >= 0
	
	errorID = 'Bad Expression';
	msg = 'unable to parse the expression';
	baseException = MException(errorID, msg);
	throw(baseException);
	return;
end 


for i = 1 : maxIter

	funcUpper = func(upper);
	funcLower = func(lower);
	
	yLowerVec = [yLowerVec funcLower];
	yHighVec = [yHighVec funcUpper];
	xLowerVec = [xLowerVec lower];
	xHighVec = [xHighVec upper];
	
	
	mid = ((lower * funcUpper) - (upper * funcLower)) / (funcUpper - funcLower);
	funcMid = func(mid);
	
	xMidVec = [xMidVec mid];
	yMidVec = [yMidVec funcMid];
	
	if i == 1
		rootVals(i) = mid;
		errorVec = [errorVec 0];

	else
		rootVals(1) = rootVals(2);
		rootVals(2) = mid;
		if abs(rootVals(2) ~= 0
			error = abs(rootVals(2) - rootVals(1)) / abs(rootVals(2)) * 100;
		else
			error = Inf;
		end
		errorVec = [errorVec error];
		if error <= maxError
			break;
	end	
	
	if funcMid == 0
		break;
		
	elseif funcMid * funcLower < 0
		upper = mid;
	else
		lower = mid;
	end
end
root = mid;

	
end 
