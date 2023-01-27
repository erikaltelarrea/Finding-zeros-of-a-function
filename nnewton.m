%donada f: R^n --> R^n, calcula la solucio de f(x)=0 pel metode de 
%NEWTON

%dfun: matriu, Df(x) de derivades de la funcio f

%XK: matriu on cada columna conte l'aproximacio de cada iteracio
%DFk: matriu diferencial (o Jacobiana) de f evaluada en XK(:, end),
%en l'ultima aproximacio
%res: vector residus, res(k) = ||f(x_k)||
function [XK, DFk, res, it] = nnewton(x0, tol, itmax, fun, dfun)
    XK = [x0];
    DFk = dfun(XK(:,end));
    res = [norm(fun(x0))]; %norma euclidiana (norma 2) del vector fun(x0)
    it = 1;
    
    while (it <= itmax & (it == 1 | norm(XK(:,it) - XK(:,it-1)) >= tol))
        %fem el metode de Newton, considerant el Taylor de grau 1:
        %f(x) =(aprox) f(x_k) + Df(x_k)(x-x_k), igualant f(x)=0:
        %Df(x_k)(x_{k+1}-x_k)=-f(x_k), lo que hacemos es
        %Df(x_k)y=-f(x_k) y x_{k+1}=y+x_k
        y = dfun(XK(:,it))\(-fun(XK(:,it))); %resol dfun(XK)y=-fun(XK) eficientment
        XK(:,it+1) = y + XK(:,it); % x_{k+1}=y+x_k
        res(it+1) = norm(fun(XK(:,it+1))); %res(k+1)=||fun(x_{k+1})||
        
        it = it + 1;
    end
    
    if (it > itmax) %si no convergeix
        fprintf("No hi ha hagut convergencia amb el mètode de Newton");
   
    else
        DFx = dfun(XK(:, end)); %DFx = Df(x_k), on k = ultima iteracio
end
