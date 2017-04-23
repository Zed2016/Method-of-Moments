clear;clc
n = input('Input the number of delta C\n');
e = 2.7183;          %自然对数
gamma = 1.78107;     %欧拉常数
eta = 120*pi;         %真空中的波阻抗
lambda = 1;           %波长
k = 2*pi / lambda;    %波数
phi_i = 0;            %入射角度
phi_s = pi;           %散射角度
%散射截面sigma定义为宽度（三维中为面积）与散射电场强度与入射电场强度比值平方的乘积
%每个lmn表示由在（xn，yn）点的函数fn，在（xm，ym）点产生的场E
%lmn可以利用（3-24）计算
%当m点远离n点时，可以用（3-12）代替（3-24）而不太影响精确度

%定义点选配坐标点,y轴为长轴，2*lambda，x轴为短轴，lambda/2
a = 2*lambda;
b = lambda/2;
pos = zeros(n+1,2);
pos(:,1) = b*cos(0:2*pi/n:2*pi);
pos(:,2) = a*sin(0:2*pi/n:2*pi);
for i = 1:n
    %确定每段的中点跟长度
    xm(i) = (pos(i,1) + pos(i+1,1))/2;
    ym(i) = (pos(i,2) + pos(i+1,2))/2;
    delta_c(i) = sqrt((pos(i,1) - pos(i+1,1))^2 + (pos(i,2) - pos(i+1,2))^2);
end
%默认i，j都是表示复数的虚部，所以只能把上下标改成index_i跟index_j了
lmn = zeros(n);
zmn = zeros(n);
gm = zeros(1,n);
vim = zeros(1,n);
vsn = zeros(1,n);
for index_i = 1:n
    for index_j = 1:n
        if index_i == index_j
            lmn(index_i,index_j) = eta/4*k*(1 - j*2/pi*log(gamma*k*delta_c(index_j)/(4*e)));
        else
            lmn(index_i,index_j) = eta/4*k*delta_c(index_j)*besselh(0,2,k*sqrt((xm(index_j)-xm(index_i))^2 + (ym(index_j)-ym(index_i))^2));
        end
        zmn(index_i,index_j) = delta_c(index_j) * lmn(index_i,index_j);
    end
    gm(index_i) = exp(j*k*(xm(index_i)*cos(phi_i)+ym(index_i)*sin(phi_i)));
    vim(index_i) = delta_c(index_i) * exp(j*k*(xm(index_i)*cos(phi_i)+ym(index_i)*sin(phi_i)));
    vsn(index_i) = delta_c(index_i) * exp(j*k*(xm(index_i)*cos(phi_i)+ym(index_i)*sin(phi_i)));
end

alpha = lmn\gm';
sigma = k*eta^2/4 * ( vsn*inv(zmn)*vim' )^2;