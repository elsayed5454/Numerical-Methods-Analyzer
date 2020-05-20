function [roots] = birge_Vieta(initRoot, equation, MaxIter, errorBound)


%initiate roots Vector
roots = zeros(0,0);

syms x
f = sym(equation);

a = sym2poly(f);

%a = fliplr(a);
for i = 1 : (size(a, 2) - 1)
	b = zeros(1, size(a, 2));
	roots(1, i) = initRoot;
	for iter = 1 : MaxIter
		b = zeros(1, size(a, 2));
		c = zeros(1, size(a, 2) - 1);
		b(1, 1) = a(1, 1);
		c(1, 1) = b(1, 1);
		
		for j = 2 : size(a, 2)
			b(1, j) = a(1, j) + roots(1, i) * b(1, j - 1);
		end
		
		for j = 2 : size(a, 2) - 1
			c(1, j) = b(1, j) + roots(1, i) * c(1, j - 1);
		end
		
		nextGuess = roots(1, i) - (b(1, size(a, 2))/ c(1, size(a, 2) - 1));
		if abs(nextGuess - roots(1, i)) / abs(nextGuess) <= errorBound
			roots(1, i) = nextGuess;
			break;
		end
		roots(1, i) = nextGuess;
    end
	a = b(:, 1 : size(a, 2) - 1);

end

%eqn1="x^2+2*x-4"

end