n = input('Input the N of 2N')
syms x y
num = n^0.5;
v = 1;
a = 1 / 2;
b = a / num;
epsilon = 8.854187817e-12;   %真空中的介电常数
%计算平行金属板的电容的l矩阵分为ltt、ltb、lbb、lbt，其中t表示top，b表示bottom，为一个2N阶方阵
%ltt = lbb = lmn，lmn与计算单个导体板的lmn相同
%根据对称原理：ltb = lbt
for i = 1:n
    for j = 1:n
        if i == j   %当上下板方块在同一xy坐标时
            ltb(i,j) = 0.282/epsilon*2*b*((1+pi/4*(d/b)^2)^0.5-pi^0.5*d/(2*b))
        else        %当上下板方块不在同一xy坐标时
            ltb(i,j) = b^2/( pi*epsilon*(())^0.5 );
        end
    end
end