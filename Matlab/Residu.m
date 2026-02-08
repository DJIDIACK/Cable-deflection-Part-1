%Opération menant au résidu de l'équilibre
function RCol = Residu(x, w0, k, L, T)
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Déclaration des variables
%--------------------------------------------------------------------------
syms y(x, a, b, c, d) 
%--------------------------------------------------------------------------
%Exprimons la valeur explicite de w et attribuons des valeurs aux variables
%--------------------------------------------------------------------------
w(x)=w0*(1-k*x)*exp(-k*x);
%--------------------------------------------------------------------------
%Choisissons une approximation de degré 4
%--------------------------------------------------------------------------
y=x*(x-L)*(a+b*x+c*x^2); 
%--------------------------------------------------------------------------
%Exprimons l'équation de la dérivée seconde de l'approximation de degré 4
%--------------------------------------------------------------------------
d2ydx(x) = diff(y,2); 
% Où a, b et c sont des constantes à déterminer
%--------------------------------------------------------------------------
%Expression de l'équation d'équilibre de la déflexion du câble à partir de
%la solution d'approximation
%--------------------------------------------------------------------------
ODE(x, a, b, c) = d2ydx(x) +(w/T) ;
%--------------------------------------------------------------------------
%Choisissons les points de collocations suivantes
%En x=L/4=1/2, x=L/2=1 et X=3L/4=3/2
%Et exprimons l'équation résultante à chaque point en fontion des
%constantes a, b et c à déterminer
%--------------------------------------------------------------------------
eqn1 = ODE(2*L/7, a, b, c) == 0;
eqn2 = ODE(4*L/7, a, b, c) == 0;
eqn3 = ODE(4*L/5, a, b, c) == 0;
%--------------------------------------------------------------------------
%Résolvons le système d'équation à 3 inconnus ci-dessus 
%--------------------------------------------------------------------------
sol = solve([eqn1, eqn2, eqn3], [a, b, c]);
%--------------------------------------------------------------------------
%Attribuons chaque variable à une valeur
%--------------------------------------------------------------------------
aSol = sol.a;
bSol = sol.b;
cSol = sol.c;
%--------------------------------------------------------------------------
%Ainsi nous obtenons la solution exacte
%--------------------------------------------------------------------------
RCol = ODE(x, aSol, bSol, cSol);
end
