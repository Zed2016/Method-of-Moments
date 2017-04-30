% This funciton will calculate psi(m,n). Time 2016/04/29

function psi = cal_psi8(m,n,a,k,delta_l,l_points)

        if n == m
                R_mn = sqrt((l_points(2*m-1) - l_points(2*n+1)) * (l_points(2*m-1) - l_points(2*n+1)) + a * a);
                
                psi(1) = 1 / (2 * pi * delta_l) * log(delta_l / a) - 1j * k / (4 * pi); 
                psi(2) = 1 / (2 * pi * delta_l) * log(delta_l / a) - 1j * k / (4 * pi); 
                psi(3) = exp(-1j * k * abs(R_mn)) / (4 * pi * abs(R_mn));
                psi(4) = exp(-1j * k * abs(R_mn)) / (4 * pi * abs(R_mn));
                psi(5) = 1 / (2 * pi * delta_l) * log(delta_l / a) - 1j * k / (4 * pi); 
                
        elseif m - n == 1   
                R_mn(:,1) = sqrt((l_points(2*m) - l_points(2*n)) * (l_points(2*m) - l_points(2*n)) + a * a);
                R_mn(:,2) = sqrt((l_points(2*m+1) - l_points(2*n-1)) * (l_points(2*m+1) - l_points(2*n-1)) + a * a);
                
                psi(1) = exp(-1j * k * abs(R_mn(1))) / (4 * pi * abs(R_mn(1))); 
                psi(2) = exp(-1j * k * abs(R_mn(1))) / (4 * pi * abs(R_mn(1)));
                psi(3) = exp(-1j * k * abs(R_mn(2))) / (4 * pi * abs(R_mn(2)));
                psi(4) = 1 / (2 * pi * delta_l) * log(delta_l / a) - 1j * k / (4 * pi);
                psi(5) = exp(-1j * k * abs(R_mn(1))) / (4 * pi * abs(R_mn(1)));
        
        elseif m - n == -1
                R_mn(:,1) = sqrt((l_points(2*m) - l_points(2*n)) * (l_points(2*m) - l_points(2*n)) + a * a);
                R_mn(:,2) = sqrt((l_points(2*m-1) - l_points(2*n+1)) * (l_points(2*m-1) - l_points(2*n+1)) + a * a);
                
                psi(1) = exp(-1j * k * abs(R_mn(1))) / (4 * pi * abs(R_mn(1)));
                psi(2) = exp(-1j * k * abs(R_mn(1))) / (4 * pi * abs(R_mn(1)));
                psi(3) = 1 / (2 * pi * delta_l) * log(delta_l / a) - 1j * k / (4 * pi);
                psi(4) = exp(-1j * k * abs(R_mn(2))) / (4 * pi * abs(R_mn(2)));
                psi(5) = exp(-1j * k * abs(R_mn(1))) / (4 * pi * abs(R_mn(1)));
        else
                R_mn(:,1) = sqrt((l_points(2*m) - l_points(2*n)) * (l_points(2*m) - l_points(2*n)) + a * a);
                R_mn(:,2) = sqrt((l_points(2*m+1) - l_points(2*n-1)) * (l_points(2*m+1) - l_points(2*n-1)) + a * a);
                R_mn(:,3) = sqrt((l_points(2*m-1) - l_points(2*n+1)) * (l_points(2*m-1) - l_points(2*n+1)) + a * a);
                
                psi(1) = exp(-1j * k * abs(R_mn(1))) / (4 * pi * abs(R_mn(1))); 
                psi(2) = exp(-1j * k * abs(R_mn(1))) / (4 * pi * abs(R_mn(1))); 
                psi(3) = exp(-1j * k * abs(R_mn(2))) / (4 * pi * abs(R_mn(2)));
                psi(4) = exp(-1j * k * abs(R_mn(3))) / (4 * pi * abs(R_mn(3)));
                psi(5) = exp(-1j * k * abs(R_mn(1))) / (4 * pi * abs(R_mn(1)));
                
        end
end