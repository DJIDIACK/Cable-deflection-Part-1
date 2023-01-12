%Fichier principale du projet regroupant
% 1) Comparaison de la solution exacte';'et celle par collocation
% 2) Résidu d’équilibre résultant de la solution par collocation
% 3) Erreur absolue obtenue par collocation
% 4) Erreur absolue obtenue par éléments finis
%--------------------------------------------------------------------------
clear all, close all, clc
%--------------------------------------------------------------------------
%Exprimons la valeur explicite des variables
%--------------------------------------------------------------------------
w0=1; 
k=8; 
L=input('entrez la longeur du câble : ');
T=input('entrez la tension du câble : ');
%Définir le nombre d'élément du cable
n=input('entrez le nombre d element : ');
N=n+1;
dN=L/n;
X=0:dN:L;
Y=sym('Y',[1 N]);
syms x
w=input('entrez le type de chargement : ');  %w0.*(1-k*x).*exp(-k*x);

%--------------------------------------------------------------------------
%Energie totale
%--------------------------------------------------------------------------
E = Energ(x,X,Y,N,w,T);
%--------------------------------------------------------------------------
%Conditions Limites 
%--------------------------------------------------------------------------
E = CLim(E,Y,N);
%--------------------------------------------------------------------------
%Equation résultante en i 
%--------------------------------------------------------------------------
VectEqn = vpa(Eval_Eqn(E,Y,N));
%--------------------------------------------------------------------------
%Extraction Matrice
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
[A,b] = equationsToMatrix(VectEqn,Y);
%--------------------------------------------------------------------------
%Attribuons chaque variable à une valeur
%--------------------------------------------------------------------------
Y = linsolve(A,b);
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Appel de la solution Exacte
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
yEx = SolExact(x, w0, k, L, T);
%--------------------------------------------------------------------------
% Appel de la solution par collocation
%--------------------------------------------------------------------------
yCol = Collocation(x, w0, k, L, T);
%--------------------------------------------------------------------------
% Appel de la solution résiduelle
%--------------------------------------------------------------------------
RCol = Residu(x, w0, k, L, T);
%--------------------------------------------------------------------------
% Erreur absolue obtenue par collocation
%--------------------------------------------------------------------------
yErrCol = ErrCol(x, w0, k, L, T);
%--------------------------------------------------------------------------
% Erreur absolue obtenue par éléments finis
%--------------------------------------------------------------------------
Err = ErrTotal(X, Y, yEx, N);
%--------------------------------------------------------------------------
%Tracons les graphes
%--------------------------------------------------------------------------

figure (1)
hold on
p2 = fplot(yCol, [0 2],'Linewidth', 2);
p3 = fplot(yEx, [0 2],'Linewidth', 2);
hold off
grid on
legend([p2 p3],{'Colocation','Exacte'})
title({'Comparaison de la solution exacte';'et celle par collocation'})
xlabel('X/L')
ylabel('(yT)/(wL^2)')


figure (2)
hold on
p = fplot(RCol, [0 2],'Linewidth', 2);
hold off
grid on
legend(p,{'Résidu d''équilibre'})
title('Résidu d’équilibre résultant de la solution par collocation')
xlabel('X/L')
ylabel('(yT)/(wL^2)')

figure (3)
hold on
p0 = fplot(yErrCol, [0 2], 'Linewidth', 2);
hold off
grid on
legend(p0,{'Erreur collocation'})
title('Erreur absolue obtenue par collocation')
xlabel('X/L')
ylabel('(yT)/(wL^2)')


figure(4)
hold on
for j=1:n
p = fplot(Err(j),[X(j) X(j+1)],'b', 'Linewidth', 2);
end
hold off
grid on
legend(p,{'Element Fini'})
title('Erreur absolue obtenue par éléments finis')
xlabel('X/L')
ylabel('(yT)/(wL^2)')



