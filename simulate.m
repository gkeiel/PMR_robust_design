fs = 10000;        % sampling frequency for simulation
dt = 1/fs;         % seconds per sample
Tf = 0.10;         % simulation time
t  = 0:dt:Tf-dt;   % time vector
h  = length(nld);  % number of harmonics describing load


%%%%%%%%%%%%%%%%%%%%%%%%% OUTPUT RESPONSE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% response to reference input (linear load)
r    = V*sqrt(2)*sin( 2*pi*f*t );
y{1} = lsim( cl_tf,r,t );
i{1} = nld(1).I*sqrt(2)*sin( 2*pi*f*t );

% response to disturbance input (non-linear load)
for n = 2:h
  i{n} = nld(n).I*sqrt(2)*sin( n*2*pi*f*t +nld(n).P*pi/180 );
  y{n} = lsim( id_tf,i{n},t );
end

% output voltage for no-load
v_o    = lsim( cl_tf_nl,r,t );

% output voltage and current for linear load
v_o_l  = y{1};
i_o_l  = i{1};

% output voltage and current for non-linear load
v_o_nl = sum( cat(h, y{:}), h);
i_o_nl = sum( cat(h, i{:}), h);