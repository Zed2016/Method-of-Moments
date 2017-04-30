clear;clc
%n = input('Input the number of delta C\n');
n = 64
mu = 4*pi*10^-7;      %真空中的磁导率
epsilon = 8.854187817e-12;   %真空中的介电常数
lambda = 1;           %波长
c = 3*10^8;           %真空中光速
w = 2*pi*c/lambda;    %角速度
k = 2*pi / lambda;    %波数
for index_y = 1:250
    l = index_y*lambda*0.01;           %天线总长度

    a = l/148.4;            %线的半径 l/2a = 74.2
    delta_l = l/(n+1);      %因为是线天线，所以分段均匀，并且两端看做带有零电流的一小段

    %确定位置坐标
    position_i = -(l/2 - 0.5*delta_l):delta_l:(l/2 - 0.5*delta_l);  %中点
    position_i_plus = position_i + delta_l/2;                       %+
    position_i_minuts = position_i - delta_l/2;                     %-

    zmn = zeros(n);     %阻抗矩阵
    v = zeros(n,1);     %电压矩阵
    v(50) = 1;          %在中点加激励电压
    psi = zeros(1:5);
    l_points(:,1) = 0 : l/(2*n) : l;
    
    for index_i = 1:n
        for index_j = 1:n
            psi = cal_psi8(index_i,index_j,a,k,delta_l,l_points);
            zmn(index_i,index_j) = j*w*mu*delta_l*delta_l*psi(1)+1/(j*w*epsilon)*(psi(2) - psi(3) - psi(4) + psi(5));
        end
    end
    ymn = inv(zmn);         
    alpha = ymn*v;
    zz(index_y) = ymn(32,32);
end
xrange = 0.01:0.01:2.5;
plot(xrange,real(zz));
title('Real\_Y')
xlabel('l/lambda')
figure();
plot(xrange,imag(zz));
title('Imag\_Y')
xlabel('l/lambda')
