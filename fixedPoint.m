function[root, xVec, nextVec, errorVec] = fixedPoint(fEqn, gEquation, initialGuess, errorBound, iter_max)

try
	gEqn = inline(gEquation);
catch ME
	errorID = 'Bad:Expression';
	msg = 'unable to parse the expression';
	baseException = MException(errorID, msg);
	throw(baseException);
end



%initialize vectors to store all the iterations 
xVec = zeros(0,0);
nextVec = zeros(0,0);
errorVec = zeros(0,0);



for i = 1 : iter_max
	xVec = [xVec initialGuess];
	nextGuess = gEqn(initialGuess);
	nextVec = [nextVec nextGuess];
	root = nextGuess;
	if (nextGuess ~= 0)
		error = abs((nextGuess - initialGuess) / abs(nextGuess)) * 100;
	else
		error = Inf;
	end	
	errorVec = [errorVec error];
	if (error <= errorBound)
		break;
	end
	initialGuess = nextGuess; 
end

plotX = root - (10) : 0.1 :root + (10);
try
	plotEqn = vectorize(gEqn);
	plotY = plotEqn(plotX);
	plot(plotX, plotY, plotX, plotX,'.-'), legend('G(x) = x', 'y = x');
	
catch
	errorID = 'Bad Expression';
	msg = 'unable to parse the expression';
	baseException = MException(errorID, msg);
	throw(baseException);
end

end
