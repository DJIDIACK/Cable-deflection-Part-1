function E = Energ(x,X,Y,N,w,T)
%calcule de l'énergie totale E
%
E=0;
for i=1:N-1
    E=E+EElem(x,X,Y,w,i,T);
end
end