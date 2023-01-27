%Calcula el PUNT FIX d'una funcio, fun(x) a partir d'una aproximacio
%inicial bona, x0.

%Comprovar q xifres significatives correctes, res <= 1/2*10^{-q}
%xk: vector amb les aproximacion successives dels zeros de la funcio
%res: vector que conte els residus, res[k]=fun(x_k)-x_k
%it: #iteracions fetes
function [xk, res, it] = iteracio_simple(x0, tol, itmax, fun)
    xk = [x0]; %vector que contindra el valor de cada aproximacio
    it = 1;
    res = [fun(x0)-x0]; %vector de residus, res[k] = fun(xk)-xk
    while (it <= itmax & (it == 1 | abs(xk(end)-xk(it-1)) >= tol))
        xk(it + 1) = fun(xk(it));
        res(it + 1) = fun(xk(it + 1)) - xk(it + 1);
        it = it + 1;
    end
    
    if it > itmax %no trobem solucio amb la tolerancia desitjada
        fprintf("No convergeix el mètode d'iteració simple")
    end
end

    