function E = CLim(E,Y,N)
% fonction traite l'application des conditions limites de E 
% avec E(1)=E(N)=0
   E = subs(E,Y(1),0);
   E = subs(E,Y(N),0);
end

