function value = my_psi_eq(delta_ln,k,a)
    value = 1/(2*pi*delta_ln)*log(delta_ln/a)-j*k/(4*pi);
end