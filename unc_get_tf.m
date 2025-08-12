function [ pmr_tf, cl_tf, cl_tf_nl, id_tf ] = unc_get_tf( pmr, agm, K, m ) 

% PMR controller
[num,den] = ss2tf( pmr.A_r, pmr.B_r, K(3:end), -K(2) );
pmr_tf    = tf(num,den);

% closed-loop transfer function nominal load
B_k       = [K(2); 0; ones(2*m,1)].*agm.B_q;
[num,den] = ss2tf( agm.A2_a +agm.B_a*K, B_k, agm.C_a, agm.D_a );
cl_tf     = tf(num,den);

% closed-loop transfer function no-load
[num,den] = ss2tf( agm.A1_a +agm.B_a*K, B_k, agm.C_a, agm.D_a );
cl_tf_nl  = tf(num,den);

% disturbance-output transfer function
[num,den] = ss2tf( agm.A2_a +agm.B_a*K, agm.E_a, agm.C_a, agm.D_a );
id_tf     = tf(num,den);