% Oprération traitant l'erreur élémentaire
function  y = ErrElem(X, Y, yEx, i)
 syms x
 m=(Y(i+1)-Y(i))/(X(i+1)-X(i));
 b=Y(i)-m.*X(i);
 
 yEf = m.*x+b ;

y = abs(yEx - yEf);
end