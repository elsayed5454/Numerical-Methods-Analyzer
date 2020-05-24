  
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
sectionIndex = 0;
try
	syms x
	plotX = lower : 0.1 :upper;
	%plotY = zeros(1,size(plotX, 2));
	%plotYDash = zeros(1,size(plotX, 2));
	%for i = 1 : size(plotX, 2)
	%	x=plotX(i);
	%	w=subs(f);
	%	wdash = subs(f_dash);
	%	plotY(1, i) = w; 
	%	plotYDash(1, i) = wdash;
	%end
    %fV = vectorize(f);
    %f_dashV = vectorize(f_dash);
    syms x;
    x = plotX;
    plotY = subs(f);
	plotYDash = subs(f_dash,plotX);
    
catch
 %   rethrow(ME)
	errorID = 'Bad:Expression';
	msg = 'unable to Plot the Function';
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
	errorID = 'Bad:Interval';
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
            sectionIndex = sectionIndex + 1;
			break;
		end
	end	
	
	if funcMid == 0
		break;
		
	elseif funcMid * func(lower) < 0
		upper = mid;
	else
		lower = mid;
    end
    sectionIndex = sectionIndex + 1;
end
root = mid;
xLowerVec = xLowerVec(:,1 : sectionIndex);
xHighVec = xHighVec(:,1 : sectionIndex);
xMidVec = xMidVec(:,1 : sectionIndex);
errorVec = errorVec(:,1 : sectionIndex);
end 