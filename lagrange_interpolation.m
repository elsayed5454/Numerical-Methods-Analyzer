function summ =lagrange_interpolation(values,x_values , y_values)

summ=0;
for i=1:length(x_values)
    p=1;
    for j=1:length(x_values)
        if j~=i
            syms x
            c = (x-x_values(j))/(x_values(i)-x_values(j));
            p = expand(p*c);
        end
    end
    syms x
    term =expand(p*y_values(i));
    summ= summ + term;
end

plotX = min(min(x_values)) : 0.1 : max(max(x_values));
%for i = 1 : size(plotX, 2)
%    X=plotX(i);
%    w=subs(Func);
%    plotY = [plotY w]; 
%end
x = plotX;
plotY = subs(summ);
plot(plotX, plotY,'.-'), legend('F');
end
