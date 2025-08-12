function [ pmr ] = pmr_model( f, m, xi )

% multiple-resonant controller model
A_r = [];
B_r = [];
for i = 1:m
    
    w_n = 2*pi*f*(2*i -1);
    if ( i == 1 )
        A_aux = [0 w_n; -w_n 0];          % considers xi_1 = 0
    else
        A_aux = [0 w_n; -w_n -2*xi*w_n];  % considers xi_h = xi for h = 3,5,7,...
    end
    
    A_r = blkdiag( A_r,A_aux );
    B_r = [B_r; [0; 1]];
end

pmr = struct('A_r', A_r, 'B_r', B_r);