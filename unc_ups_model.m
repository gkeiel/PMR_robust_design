function [ ups ] = unc_ups_model( R_L ) 

% UPS output filter parameters
Kpwm = 1;
Rlf  = 0.2;
Lf   = 0.001;
Cf   = 0.0003;

% uncertain AVERAGE model (at each polytope vertice)
A1 = [-(Rlf/Lf) -1/Lf;
      1/Cf      0];
A2 = [-(Rlf/Lf) -1/Lf;
      1/Cf     -1/(R_L*Cf)];
B  = [Kpwm/Lf; 0];
C  = [0 1];
D  = 0;
E  = [0;  -1/Cf];
ups = struct('A1',A1, 'A2',A2, 'B',B, 'C',C, 'D',D, 'E',E, 'Rlf',Rlf, 'Lf',Lf, 'Cf',Cf);