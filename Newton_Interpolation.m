
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

%for i = 1 : size(plotX, 2)
%    X=plotX(i);
%    w=subs(Func);
%    plotY = [plotY w]; 
%end
X = plotX;
plotY = subs(Func);
plot(plotX, plotY,'.-'), legend('F');

end



