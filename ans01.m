clear,clc
g = @(x) fun(x);

x0 = 0.01;
tol = 1e-2;
maxIter = 3;
xRoot = fixPoint(g,x0,tol,maxIter);
fprintf('One of the localized roots is:%d\n',xRoot);
syms x
fx = (cos(0.5*x+0.5))^2+(sin(exp((cos(x))^2)))-x^2+(cos(exp((cos(x))^2)))-(sin(x/2+0.5))^2;
if (abs(double(subs(fx,xRoot))-xRoot)-tol)<0
    fprintf('accuracy ε<= 10^-2\n');
else
    fprintf('accuracy ε> 10^-2\n');
end
function xRoot = fixPoint(fun,x0,tol,maxIter)
    for k=1:maxIter
        x=fun(x0);
        if(abs(x-x0)<tol)
            break;
        end
        x0=x;
    end
    xRoot = x;
end
function gx = fun(x)
    gx = (cos(0.5*x+0.5))^2+(sin(exp((cos(x))^2)))-x^2+(cos(exp((cos(x))^2)))-(sin(x/2+0.5))^2;
end

