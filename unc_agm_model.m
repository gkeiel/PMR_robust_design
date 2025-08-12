function [ agm ] = unc_agm_model( ups, pmr, m )

% extract UPS model
A1 = ups.A1;
A2 = ups.A2;
B  = ups.B;
C  = ups.C;
E  = ups.E;

% extract PMR model
A_r = pmr.A_r;
B_r = pmr.B_r;

% augmented model (at each polytope vertice)
B_a  = [ B; zeros(2*m,1) ];
C_a  = [ C  zeros(1,2*m) ];
E_a  = [ E; zeros(2*m, 1)];
D_a  = 0;

B_rC = B_r*C;
A1_a = [ A1     zeros(2,2*m);
        -B_rC   A_r ];
A2_a = [ A2     zeros(2,2*m);
        -B_rC   A_r ];
B_q  = [ zeros(2,1); B_r ];

agm = struct('A1_a', A1_a, 'A2_a',A2_a, 'B_a',B_a, 'C_a',C_a, 'D_a',D_a, 'E_a',E_a, 'B_q',B_q);