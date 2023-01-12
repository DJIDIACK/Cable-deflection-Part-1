%Opération menant à l'erreur obtenue par éléments finis
%--------------------------------------------------------------------------
clear all, close all, clc
%--------------------------------------------------------------------------
%Exprimons la valeur explicite des variables
%--------------------------------------------------------------------------
w0=1; 
k=8; 
L=input('entrez la longeur du câble : ');
T=input('entrez la tension du câble : ');
syms x
w=input('entrez le type de chargement : ');  %w0.*(1-k*x).*exp(-k*x);
X1=0:L/20:L;
X2=0:L/10:L;
X3=0:L/8:L;
X4=0:L/4:L;
X5=0:L/2:L;
Y1=sym('Y',[1 21]);
Y2=sym('Y',[1 11]);
Y3=sym('Y',[1 9]);
Y4=sym('Y',[1 5]);
Y5=sym('Y',[1 3]);
%Y=sym('Y',[1 N]);


%--------------------------------------------------------------------------
%Energie totale
%--------------------------------------------------------------------------
E1 = Energ(x,X1,Y1,21,w,T);
E2 = Energ(x,X2,Y2,11,w,T);
E3 = Energ(x,X3,Y3,9,w,T);
E4 = Energ(x,X4,Y4,5,w,T);
E5 = Energ(x,X5,Y5,3,w,T);
%--------------------------------------------------------------------------
%Conditions Limites 
%--------------------------------------------------------------------------
E1 = CLim(E1,Y1,21);
E2 = CLim(E2,Y2,11);
E3 = CLim(E3,Y3,9);
E4 = CLim(E4,Y4,5);
E5 = CLim(E5,Y5,3);
%--------------------------------------------------------------------------
%Equation résultante en i 
%--------------------------------------------------------------------------
VectEqn1 = vpa(Eval_Eqn(E1,Y1,21));
VectEqn2 = vpa(Eval_Eqn(E2,Y2,11));
VectEqn3 = vpa(Eval_Eqn(E3,Y3,9));
VectEqn4 = vpa(Eval_Eqn(E4,Y4,5));
VectEqn5 = vpa(Eval_Eqn(E5,Y5,3));
%--------------------------------------------------------------------------
%Extraction Matrice
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
[A1,b1] = equationsToMatrix(VectEqn1,Y1);
[A2,b2] = equationsToMatrix(VectEqn2,Y2);
[A3,b3] = equationsToMatrix(VectEqn3,Y3);
[A4,b4] = equationsToMatrix(VectEqn4,Y4);
[A5,b5] = equationsToMatrix(VectEqn5,Y5);
%--------------------------------------------------------------------------
%Attribuons chaque variable à une valeur
%--------------------------------------------------------------------------
Y1 = linsolve(A1,b1);
Y2 = linsolve(A2,b2);
Y3 = linsolve(A3,b3);
Y4 = linsolve(A4,b4);
Y5 = linsolve(A5,b5);
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% Appel de la solution Exacte
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
yEx = SolExact(x, w0, k, L, T);
%--------------------------------------------------------------------------
% Erreur absolue obtenue par collocation
%--------------------------------------------------------------------------
Err1 = ErrTotal(X1, Y1, yEx, 21);
Err2 = ErrTotal(X2, Y2, yEx, 11);
Err3 = ErrTotal(X3, Y3, yEx, 9);
Err4 = ErrTotal(X4, Y4, yEx, 5);
Err5 = ErrTotal(X5, Y5, yEx, 3);

%--------------------------------------------------------------------------
%Tracons le graphe
%--------------------------------------------------------------------------


hold on
for j=1:20
p1 = fplot(Err1(j),[X1(j) X1(j+1)],'r', 'Linewidth', 2);
end
for j=1:10
p2 = fplot(Err2(j),[X2(j) X2(j+1)],'g', 'Linewidth', 2);
end
for j=1:8
p3 = fplot(Err3(j),[X3(j) X3(j+1)],'b', 'Linewidth', 2);
end
for j=1:4
p4 = fplot(Err4(j),[X4(j) X4(j+1)],'c', 'Linewidth', 2);
end
for j=1:2
p5 = fplot(Err5(j),[X5(j) X5(j+1)],'m', 'Linewidth', 2);
end
hold off
grid on
legend([p1 p2 p3 p4 p5],{'Erreur EF N=20', 'Erreur EF N=10', 'Erreur EF N=8', 'Erreur EF N=4', 'Erreur EF N=2'})
title('Erreur absolue obtenue par éléments finis')
xlabel('X/L')
ylabel('(yT)/(wL^2)')



