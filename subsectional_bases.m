n = input('Input the N...\n')
%subsectional bases
syms x;
g = 1 + 4*x^2;
fa = 5/6*x -1/2*x^2 -1/3*x^4;   %Êµ¼Ê½â
for i = 0 : n
    fn(i) = (1 - (x-i*(1/n+1))) * (x<(1/(n+1))&x>0)...
        + 
end