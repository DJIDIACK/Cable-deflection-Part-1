function y = EElem(x,X,Y,w,i,T)
%calcule de l'énergie élémentaire  Ei
    m=(Y(i+1)-Y(i))/(X(i+1)-X(i));
    b=Y(i)-m*X(i);

y=int((T/2)*(m^2)-w*(m*x+b),X(i),X(i+1));
end