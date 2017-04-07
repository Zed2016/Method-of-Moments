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
        if i == j   % m=n的情况
            lmn(i,j) = 2*b/(pi*epsilon) *0.8814;
        else        % m~=n的情况
            if mod(i,num) == 0
                xm = fix(i/num);
                ym = num;
            else
                xm = fix(i/num) +1;
                ym = mod(i,num);
            end
            if mod(j,num) == 0
                xn = j/num;
                yn = num;
            else
                xn = fix(j/num) + 1;
                yn = mod(j,num);
            end
            deltax = 2*b*(xm-xn);   %Xm与Xn之间的距离
            deltay = 2*b*(ym-yn);   %Ym与Yn之间的距离
            %disp(['i=',num2str(i),'j=',num2str(j),' ',num2str([xm,ym,xn,yn])])
            %验证编号问题，成功
            test(i,1) = xm;test(i,2) = ym;test(i,3) = xn;test(i,4) = yn;
            lmn(i,j) = b^2 / (pi*epsilon* (deltax^2 + deltay^2)^0.5 );
        end
    end
    gm(i) = v;
end
a = lmn\gm';    %好像只要求出alpha，然后将其reshape就行了
a_reshape = reshape(a,num,num);
c = 4*b*b*sum(a);   %电容
surf(a_reshape);