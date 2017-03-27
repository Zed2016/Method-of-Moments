n = input('Input the N \n')
%Galerkin Method
syms x
g = 1 + 4*x^2;
fa = 5/6*x -1/2*x^2 -1/3*x^4    %实际解
for i = 1:n
    fn(i) = x - x^(i+1);
    wn(i) = fn(i);              %伽略金法检验函数等于基函数
    lfn(i) = -diff(diff(fn(i)));
end
for i = 1:n
    for j = 1:n
        lmn(i,j) = int(wn(i)*lfn(j),x,0,1); %求内积
    end
    gm(i) = int(wn(i)*g,x,0,1);
end
a = lmn\gm';
f = fn*a;   %因为矩阵形状所以相应矩阵乘法调换顺序
val = 0:0.01:1;
plot(val,subs(f,val),'p')
hold on
plot(val,subs(fa,val),'r')      