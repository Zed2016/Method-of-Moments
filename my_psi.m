function value = my_psi(n,m,delta,k,a)
    if n - m == 0
        value = 1/(2*pi*delta) * log(delta/a) - j*k/(4*pi);
    else
        r = sqrt(abs( n - m )^2 + a*a);
        %r = abs(n-m);
        value = exp(-j*k*r) / (4*pi*r);
    end
end