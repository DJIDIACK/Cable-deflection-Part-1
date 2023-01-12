function yCol = Collocation(x, w0, k, L, T)
%Opération menant à la solution par collocation
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
ODE = d2ydx(x) +(w/T) ;
%--------------------------------------------------------------------------
%Choisissons les points de collocations suivantes
%En x=2L/7, x=4L/7 et X=4L/5
%Et exprimons l'équation résultante à chaque point en fontion des
%constantes a, b et c à déterminer
%--------------------------------------------------------------------------
eqn1 = ODE(2*L/7) == 0;
eqn2 = ODE(4*L/7) == 0;
eqn3 = ODE(4*L/5) == 0;
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
yCol = x*(x-L)*(aSol+bSol*x+cSol*x^2);
end
