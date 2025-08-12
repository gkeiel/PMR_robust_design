function [ nld ] = load_model( V,R_L ) 

% fundamental and disturbance current (harmonics amplitude and phase)
I_1  = V/R_L;
I_2  = 0;
I_3  = 0.86*(V/R_L);
I_4  = 0;
I_5  = 0.62*(V/R_L);
I_6  = 0;
I_7  = 0.35*(V/R_L);
I_8  = 0;
I_9  = 0.12*(V/R_L);
I_10 = 0;
I_11 = 0.04*(V/R_L);

P_1  = 0;
P_2  = 0;
P_3  = 180;
P_4  = 0;
P_5  = 0;
P_6  = 0;
P_7  = 180;
P_8  = 0;
P_9  = 0;
P_10 = 0;
P_11 = 180;

nld = struct( 'I',{I_1, I_2, I_3, I_4, I_5, I_6, I_7, I_8, I_9, I_10, I_11},...
              'P',{P_1, P_2, P_3, P_4, P_5, P_6, P_7, P_8, P_9, P_10, P_11} );
% note: LOAD CURRENT components obtained for OPEN-LOOP response to reference voltage.