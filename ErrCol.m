function  yErrCol = ErrCol(x, w0, k, L, T)
%Calcul de l'erreur par collocation
yEx = SolExact(x, w0, k, L, T);
yCol = Collocation(x, w0, k, L, T);

    yErrCol = abs(yEx - yCol);

end