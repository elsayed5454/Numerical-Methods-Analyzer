
function NI = Newton_Interpolation(x,y)

n = length(x);
for k = 1 : n - 1
   d(k, 1) = (y(k+1) - y(k))/(x(k+1) - x(k));
end
for j = 2 : n - 1
   for k = 1 : n - j
      d(k, j) = (d(k+1, j - 1) - d(k, j - 1))/(x(k+j) - x(k));
   end
end
b(1)=y(1);
for k = 2 : n
    b(k) = d(1,k-1);
end

syms X;
Func=b(1);
for j=2 : n
     c=b(j);
    for k=1 : j-1
        c=c*(X-x(k));
        c=expand(c);
    end
    Func=Func+c;
    expand(Func);
end

NI = Func;

plotX = min(min(x)) : 0.1 : max(max(x));
plotEqn = vectorize(NI);
plotY = subs(plotEqn, plotX);
plot(plotX, plotYDash,'.-'), legend('F');


