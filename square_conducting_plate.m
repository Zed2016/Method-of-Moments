clear;clc
n = input('Input the number of square:N \n')
%平板为单位面积平板
num = n^0.5;
v = 1;
a = 1 / 2;
b = a / num;
epsilon = 8.854187817e-12;   %真空中的介电常数
if mod(num,1) ~= 0
    error('the N is a wrong number ! It must be a square number')
end
syms x y;
%lmn是delta_Sn上单位振幅的均匀电荷密度在delta_Sm的中心处产生的电位
for i = 1:n
    for j = 1:n
        if i == j
            lmn(i,i) = 2*b/(pi*epsilon)*0.8814;
        else
            xm = mod(i,n);
            xn = mod(j,n);
            ym = i/n + 1;
            yn = j/n + 1;
            deltax = 2*b*(xm-xn);   %Xm与Xn之间的距离
            deltay = 2*b*(ym-yn);   %Ym与Yn之间的距离
            lmn(i,j) = b^2 / (pi*epsilon* ( deltax^2 + deltay^2)^0.5 );
        end
    end
    gm(i) = v;
end
a = lmn\gm';
val = 0:0.01:1;
plot(val,eval(subs(f,x,val)));