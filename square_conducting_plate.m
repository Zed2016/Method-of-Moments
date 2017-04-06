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
for i = 1:n
    if mod(num,2) == 1  %每行分块为单数情况，原点在最中心分块的中心，以此为参考系
        ref = [fix(num/2)+1,fix(num/2)+1];
        %第i个分块的编号
        if mod(i,num) == 0  
            position_i = [i/num + 1,num];
        else
            position_i = [i/num + 1,mod(i,num)];
        end
        %第i个分块中心点坐标
        posx(i) = (position_i(1) - ref(1))*2*b;
        posy(i) = (position_i(2) - ref(2))*2*b;
    else    %每行分块为双数的情况，原点在四个分块的顶点上，以第四象限上的分块为参考系
        ref = [num/2,num/2];
        %第i个分块的编号
        if mod(i,num) == 0
            position_i = [i/num + 1,num];
        else
            position_i = [i/num + 1,mod(i,num)];
        end
        %第i个分块中心点坐标
        posx(i) = (position_i(1) - ref(1))*2*b-b;
        posy(i) = (position_i(2) - ref(2))*2*b+b;
    end
    %构建基函数
    fn(i) = piecewise(abs(x-posx(i))<=b & abs(y-posy(i))<=b,1,0);
end        
        
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