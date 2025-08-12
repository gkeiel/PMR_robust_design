% 05/25/2020 Keiel G.
clc; clear; close all; format shortg;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% design parameters (ex: m = 5, xi_3_5_7_9 = 0.001, sig = 100)
m   = input('number of resonant modes: ');
xi  = input('damping factor in harmonic modes: ');
sig = input('poles real part constraint: ');

% UPS reference
V   = 127;       % reference RMS voltage
f   = 50;        % reference frequency

% non-linear load model
R_L = 6.58;                     % resistance 
[ nld ] = load_model( V,R_L );  % harmonics of current (open to edit)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DESIGN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% import UPS uncertain model, PMR and build augmented model x_a = [ x' x_r' ]'
[ ups ] = unc_ups_model( R_L );
[ pmr ] = pmr_model( f, m, xi );
[ agm ] = unc_agm_model( ups, pmr, m );

% compute augmented state-feedback gain K for regional pole placement
[ K ] = lmi_regional(agm,sig);
fprintf('K = [ %s] \n', sprintf('%.3f ', K));

% PMR controller and closed-loop transfer functions
[ pmr_tf, cl_tf, cl_tf_nl, id_tf ] = unc_get_tf( pmr, agm, K, m );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RESULTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% simulate
simulate;

% plot
plot_res;