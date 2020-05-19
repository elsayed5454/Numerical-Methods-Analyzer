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



%check if the interval is valid
if (func(lower) * func(upper)) >= 0
	disp('wrong Interval');
	return;
end 

%store the latest two approx roots
rootVals = [0;0];

for i = 1 : maxIter

	funcUpper = func(upper);
	funcLower = func(lower);
	
	yLowerVec = [yLowerVec funcLower];
	yHighVec(i, 1) = funcUpper;
	xLowerVec = [xLowerVec lower];
	xHighVec = [xHighVec upper];
	
	
	mid = ((lower * funcUpper) - (upper * funcLower)) / (funcUpper - funcLower);
	funcMid = func(mid);
	
	xMidVec(i, 1) = mid;
	yMidVec(i, 1) = funcMid;
	
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