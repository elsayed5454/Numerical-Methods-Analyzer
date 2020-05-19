function sum =lagrange_interpolation(values,x_values , y_values)
n = length(x_values);
if n ~= length (y_values)
    error ('X and Y must have the same length.');
end
sum=0;
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
    sum= sum + term;
end
disp(sum);

for i=1:length(values);
x=values(i);
w=subs(sum);
disp(w);
end






