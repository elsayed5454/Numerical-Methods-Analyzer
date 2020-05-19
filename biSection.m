function [root, xLowerVec, xHighVec, xMidVec,errorVec] = biSection(lower, upper, formula, maxError, maxIter)

%Use the biSection method to get the root of the function 'func' in the interval [lower, upper]
func = inline(formula);


%initialize vectors to store all the iterations 
xLowerVec = zeros(0,0);
xHighVec = zeros(0,0);
xMidVec = zeros(0,0);
errorVec = zeros(0, 0);


if (func(lower) * func(upper)) >= 0
	disp('wrong Interval');
	return;
end 

rootVals = [0;0];

for i = 1 : maxIter
	xLowerVec = [xLowerVec lower];
	xHighVec = [xHighVec upper];
	
	mid = (upper + lower) / 2;
	xMidVec = [xMidVec mid];
	
	funcMid = func(mid);
	
	if i == 1
		rootVals(i) = mid;
		errorVec = [errorVec 0];
	else
		rootVals(1) = rootVals(2);
		rootVals(2) = mid;
		error = abs(rootVals(2) - rootVals(1)) / abs(rootVals(2)) * 100;
		errorVec = [errorVec error];
		if error <= maxError
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
end
root = mid;
end 