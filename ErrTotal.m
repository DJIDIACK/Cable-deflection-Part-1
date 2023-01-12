% Oprération traitant l'erreur total
function  Err = ErrTotal(X, Y, yEx, N)

    Err =sym(zeros(1,N));
for i=1:N-1
    Err(i) = ErrElem(X, Y, yEx, i);
end
end