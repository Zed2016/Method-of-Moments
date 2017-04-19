clear;clc
n = input('Input the N...\n')
%Point matching
syms x;
g = 1 + 4*x^2;
fa = 5/6*x -1/2*x^2 -1/3*x^4;   %实际解
for i = 1:n
    fn(i) = x - x^(i+1);
end
for i = 1:n
    for j = 1:n
        lmn(i,j) = -diff(diff(fn(j)));
        lmn(i,j) = subs(lmn(i,j),x,i*(1/(n+1)));    %点选配方法
    end
    gm(i) = subs(g,x,i*(1/(n+1)));
end
a = lmn\gm';
f = fn*a;
val = 0:0.01:1;
plot(val,subs(f,val),'p')
hold on
plot(val,subs(fa,val),'r')
str=['N = ',num2str(n)];
title(str);
legend('矩量法解','精确值');