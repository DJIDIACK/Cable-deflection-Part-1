% Opération menant à la solution exacte
function yEx = SolExact(x, w0, k, L, T)
syms y(x)

w(x)=w0*(1-k*x)*exp(-k*x);
ode = diff(y,x,2) == -w/T;
cond1 = y(0) == 0;
cond2 = y(L) == 0;

conds = [cond1 cond2];
yEx(x) = dsolve(ode,conds);
end
