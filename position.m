function delta_x,delta_y = postion(n,i,j,length)   %输入为分块个数n，输出为当前Lij的delta_x,deltay
    n = n^0.5
    %分情况讨论index
    if mod(i,n) == 0
        xm = n;
        ym = i/n;
    else
        xm = mod(i,n);
        ym = i/n +1;
    end
    if mod(j,n) == 0
        xn = n;
        yn = j/n;
    else
        xn = mod(j,n);
        yn = j/n + 1;
    end
    deltax = 2*length*(xm-xn);   %Xm与Xn之间的距离
    deltay = 2*length*(ym-yn);   %Ym与Yn之间的距离
end