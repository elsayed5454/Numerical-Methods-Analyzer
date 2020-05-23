function [root, xLowerVec, xHighVec, xMidVec,errorVec] = biSection(lower, upper, formula, maxError, maxIter)

%Use the biSection method to get the root of the function 'func' in the interval [lower, upper]
try
	func = inline(formula);

	f = sym(formula);
	f_dash = diff(f);
catch ME
	errorID = 'Bad:Expression';
	msg = 'unable to parse the expression';
	baseException = MException(errorID, msg);
	throw(baseException);
end


%initialize vectors to store all the iterations 
xLowerVec = zeros(1,maxIter);
xHighVec = zeros(1,maxIter);
xMidVec = zeros(1,maxIter);
errorVec = zeros(1, maxIter);
lastInd = 0;

try
	syms x
	plotX = lower : 0.1 :upper;
	plotY = zeros(1,size(plotX, 2));
	plotYDash = zeros(1,size(plotX, 2));
	for i = 1 : size(plotX, 2)
		x=plotX(i);
		w=subs(f);
		wdash = subs(f_dash);
		plotY(1, i) = w; 
		plotYDash(1, i) = wdash;
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

if (func(lower) * func(upper)) >= 0
	errorID = 'Bad Interval';
	msg = 'Wrong Interval';
	baseException = MException(errorID, msg);
	throw(baseException);
	return;
end 

rootVals = [0;0];

for i = 1 : maxIter
	xLowerVec(1, i) =  lower;
	xHighVec(1, i) = upper;
	
	mid = ((upper - lower) / 2) + lower;
	xMidVec(1, i) = mid;
	
	funcMid = func(mid);
	
	if i == 1
		rootVals(i) = mid;
		errorVec(1, i) = Inf;
	else
		rootVals(1) = rootVals(2);
		rootVals(2) = mid;
		if rootVals(2) ~= 0
			error = abs(rootVals(2) - rootVals(1)) / abs(rootVals(2)) * 100;
		else 
			error = Inf;
		end
		errorVec(1, i) =  error;
		if error <= maxError
			lastInd += 1;
			break;
		end
	end	
	lastInd += 1;
	if funcMid == 0
		break;
		
	elseif funcMid * func(lower) < 0
		upper = mid;
	else
		lower = mid;
	end
end
root = mid;
xLowerVec = xLowerVec[:,1 : lastInd];
xHighVec = xHighVec[:,1 : lastInd];
xMidVec = xMidVec[:,1 : lastInd];
errorVec = errorVec[:,1 : lastInd];
end 
