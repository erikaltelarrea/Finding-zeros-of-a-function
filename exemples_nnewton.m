%reset
clear;
format long e; format compact;

tol  = 1e-14;
itmax = 40;

%**********EXERCICI 1.1**********
%Aplicar NEWTON per a resoldre x^2+y^2=1, x-y=0
x0 = [0.5; 0.5]; %aproximacio inicial ("a ojo")
F1 = @f1; dF1 = @df1;

[XK1, DFk1, res1, it1] = nnewton(x0, tol, itmax, F1, dF1);

if (it1 <= itmax) %guardo la solucio nomes si convergeix
    X1 = XK1(:,end);
    fprintf("El resultat d'(1.1) és: \n");
    disp(X1);
    fprintf("L'error d'(1.1) és: \n");
    disp(res1(:,end));
else %si no convergeix
    fprintf("per al càlcul de la solució de l'exercici 1.1.");
end

%**********EXERCICI 1.2**********
%Aplicar NEWTON per a resoldre x=sen(x+y), y=cos(x-y)
%IMPORTANT: expressar-ho com a 0=x-sen(x+y), 0=y-cos(x-y)!!!!!
x0 = [1; 1]; %%aproximacio inicial ("a ojo")
F2 = @f2; dF2 = @df2;

[XK2, DFk2, res2, it2] = nnewton(x0, tol, itmax, F2, dF2);

if (it2 <= itmax)
    X2 = XK2(:,end);
    fprintf("El resultat d'(1.2) és: \n");
    disp(X2);
    fprintf("L'error d'(1.2) és: \n");
    disp(res2(:,end));
else %si no convergeix
    fprintf("per al càlcul de la solució de l'exercici 1.2.");
end
    

%**********FUNCIONS**********
%x = [x^2+y^2-1; x-y]
function [x] = f1(z) %z = (x, y)^t (transposat, vector columna)
    x = [zeros(2, 1)]; %x = (0,0)^t (transposat, vector columna)
    x(1, 1) = (z(1, 1))^2 + (z(2, 1))^2 - 1; %x^2 + y^2 - 1
    x(2, 1) = z(1, 1) - z(2, 1); %x - y
end

%calcula la matriu diferencial de la funcio anterior
function [x] = df1(z) %z = (x, y)^t (transposat, vector columna)
    x = [zeros(2, 2)];
    x(1, 1) = 2 * z(1, 1);
    x(1, 2) = 2 * z(2, 1);
    x(2, 1) = 1;
    x(2, 2) = -1;
end
    
%x = [x - sen(x+y); y - cos(x-y)];
function [x] = f2(z) %z = (x, y)^t (transposat, vector columna)
    x = [zeros(2, 1)];
    x(1, 1) = z(1, 1) - sin(z(1, 1) + z(2, 1));
    x(2, 1) = z(2, 1) - cos(z(1, 1) - z(2, 1));
end

%calcula la matriu diferencial de la funcio anterior
function [x] = df2(z) %z = (x, y)^t (transposat, vector columna)
    x = [zeros(2, 2)];
    x(1, 1) = 1 - cos(z(1, 1) + z(2, 1));
    x(1, 2) = -cos(z(1, 1) + z(2, 1));
    x(2, 1) = sin(z(1, 1) - z(2, 1));
    x(2, 2) = 1 - sin(z(1, 1) - z(2, 1));
end







