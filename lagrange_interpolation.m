function summ =lagrange_interpolation(values,x_values , y_values)

summ=0;
for i=1:n
    p=1;
    for j=1:n
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
disp(summ);

for i=1:length(values);
    syms x
    x=values(i);
    w=subs(summ);
    disp(w);
end

disp('Im here1')

plotX = min(min(x_values)) : 0.1 : max(max(x_values))
plotY = zeros(0,0);
disp('Im here2')

for i = 1 : size(plotX, 2)
    x = plotX(i);
    w = subs(summ);
    plotY = [plotY w]; 
end
disp('Im here3')
plot(plotX, plotY,'.-'), legend('F');
end
