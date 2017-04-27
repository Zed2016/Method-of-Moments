function value = my_psi(m,n,delta_ln,k)
    if m == n
        value = 1/(2*pi*delta_ln)*log(delta_ln/a)-j*k/(4*pi);
    else
        r = (m-n)*delta_ln;
        value = exp(-j*k*r)/(4*pi*r);
    end
end