%Calcula el ZERO d'una funció, fun(x) a partir d'una bona
%aproximació inicial, x0, mitjançant el mètode de Newton

%xk: vector que ocnté les diferents aproximacions
%res: vector residus, res[k] = f(x_k)

function [xk, res, it] = newton(x0, tol, itmax, fun, dfun)
    xk = [x0];
    res = [fun(x0)];
    it = 1;
    while it <= itmax & (it == 1 || abs(xk(it)-xk(it-1)) >= tol)
        xk(it + 1) = xk(it) - fun(xk(it))/dfun(xk(it));
        res(it + 1) = fun(xk(it + 1));
        it = it + 1;
    end
    
    if (it > itmax) %no trobem solucio amb la tolerancia desitjada
        fprintf("El mètode de Newton no ha convergit.");
    end
end