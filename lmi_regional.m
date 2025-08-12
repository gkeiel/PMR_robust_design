function [ K ] = lmi_regional( agm, sig )

% extract augmented model
A1_a = agm.A1_a;
A2_a = agm.A2_a;
B_a  = agm.B_a;
C_a  = agm.C_a; 

%%%%%%%%%%%%%%%%%%%%%%% regional pole placement %%%%%%%%%%%%%%%%%%%%%%%%%%%
% define symbolic variables (YALMIP* needed)
[n,p]  = size(B_a);
Q      = sdpvar(n,n, 'symmetric');   % n x n symmetric variable
W      = sdpvar(p,n, 'full');        % p x n variable


% short form
Sigma1 = A1_a*Q +B_a*W;
Sigma2 = A2_a*Q +B_a*W;

% region 1 constraint (vertical strip)
L1     = 2*sig;                      
M1     = 1;

% region 2 constraint (disk)
L2     = -10000*eye(2);
M2     = [0 1; 0 0];

% LMIs for quadratic stability and regional pole placement
LMI = Q>0;

LMI = [ LMI, ...
         Sigma1+Sigma1'<0 ];

LMI = [ LMI, ...
         Sigma2+Sigma2'<0 ];
     
LMI = [ LMI, ...
         (kron(L1,Q)+kron(M1,Sigma1)+kron(M1.',Sigma1'))<0 ];
     
LMI = [ LMI, ...
         (kron(L1,Q)+kron(M1,Sigma2)+kron(M1.',Sigma2'))<0 ];
     
LMI = [ LMI, ...
         (kron(L2,Q)+kron(M2,Sigma1)+kron(M2.',Sigma1'))<0 ];
          
LMI = [ LMI, ...
         (kron(L2,Q)+kron(M2,Sigma2)+kron(M2.',Sigma2'))<0 ];     
     
% settings and solve for feasibility
opt                   = sdpsettings('solver','lmilab','verbose',2);     %(better SDP solver recommended)
opt.lmilab.maxiter    = 1000;
opt.lmilab.feasradius = 1e20;
sol                   = optimize(LMI,[],opt);

if sol.problem ~= 0
    disp('Solver failed or problem infeasible.');
    disp(sol.info);
else
    K = value(W)/value(Q);
end

% *J. Lofberg, "YALMIP : a toolbox for modeling and optimization in MATLAB," 2004 IEEE International Conference on Robotics and Automation (IEEE Cat. No.04CH37508), New Orleans, LA, 2004, pp. 284-289, doi: 10.1109/CACSD.2004.1393890.