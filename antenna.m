clear;clc
n = input('Input the number of delta C\n');
e = 2.7183;          %自然对数
gamma = 1.78107;     %欧拉常数
eta = 120*pi;         %真空中的波阻抗
lambda = 1;           %波长
k = 2*pi / lambda;    %波数

position_i = zeros(n:1);
position_i_plus = zeros(n:1);
position_i_minuts = zeros(n:1);
