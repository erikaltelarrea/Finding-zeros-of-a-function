%Calcula el ZERO d'una funció, fun(x) a l'interval [a, b] amb
%el mètode de la secant.

%donats (x_{i-1},f(x_{i-1})) i (xi, f(xi)), considerem la recta que 
%passa pels dos punts i trobem el valor de x, que anomenarem x_{i+1}
%pel qual es fa 0. 
%x_{i+1} = xi-f(xi)*(xi-x_{i-1})/(f(x_i)-f(x_{i-1}))

%xk: vector que conté les diferents aproximacions
%res[k] = f(x_k)

function [xk, res, it] = secant(a, b, tol, itmax, fun)
    xk = [a, b];
    res = [fun(a), fun(b)];
    it = 2;
    while (it <= itmax + 1 & abs(xk(it)-xk(it-1)) >= tol)
        xk(it+1) = xk(it)-fun(xk(it))*(xk(it)-xk(it-1))/(fun(xk(it))-fun(xk(it-1)));
        res(it+1) = fun(xk(it+1));
        it = it + 1;
    end
    
    if (it > itmax + 1) %no trobem solucio amb la tolerancia desitjada
        fprintf("No convergeix el mètode de la secant");
    end
end
