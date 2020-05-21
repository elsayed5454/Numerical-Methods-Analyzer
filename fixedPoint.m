function[root, xVec, nextVec, errorVec] = fixedPoint(fEqn, gEquation, initialGuess, errorBound, iter_max)

gEqn = inline(gEquation);

plotX = [initialGuess - (10) : 0.1 :initialGuess + (10)];


%initialize vectors to store all the iterations 
xVec = zeros(0,0);
nextVec = zeros(0,0);
errorVec = zeros(0,0);

plotEqn = vectorize(gEqn);
plotY = plotEqn(plotX);
plot(plotX, plotY, plotX, plotX,'.-'), legend('G(x) = x', 'y = x');
set(gca, 'XTick', initialGuess - (8) :1:initialGuess + (8),...
    'XTickLabel', initialGuess - (8) :1:initialGuess + (8));


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

end
