function VectEqn = Eval_Eqn(E,Y,N)
% fonction traite la formulation variationnelle de E 
%
VectEqn=sym(zeros(1,N));
for j=2:N-1
    VectEqn(j-1)=diff(E,Y(j));
end
end

