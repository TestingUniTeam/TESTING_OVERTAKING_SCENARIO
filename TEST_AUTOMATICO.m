Tc = 0.1;                         %% sampling time
T = 30;                           %% simulation time
t = 0:Tc:T;

V0_ego = param_init(:,1);         %% Initial speeds of Ego-Vehicle, A and B
V0_A = param_init(:,2);
V0_B= param_init(:,3); 


acc_A_all = param_init(:,4);      %% Initial accelerations of A and B
acc_B_all = param_init(:,5);


for i = 1 : length(V0_ego)

    
    acc_A = acc_A_all(i);
    acc_B = acc_B_all(i);

    
     % EGO-VEHICLE PARAMETERS %
 
 X0 = [0 2];                                      %% initial position
 Angles0 = 0;                                     %% initial yaw angle
 V0_ego_init = V0_ego(i);                         %% initial speed
 init_sim=[X0 (V0_ego_init/3.6) Angles0]';     

 x_tr = [0 20 30 50 90 1000];        
 y_tr = [0 20 30 50 90 1000];
 
 xx_rif = 0 : Tc : x_tr(end);


A = [100 X0(2)];                        %% generating overtaking trajectory
B = [125 6];
[m,q] = retta2punti(A,B);

C = [175 6];
D = [200 2];
[m1,q1] = retta2punti(C,D);

for it=1:length(xx_rif)
    
if xx_rif(it)>=0 & xx_rif(it)<= A(1)
    yy_rif(1,it)=X0(2);
    
elseif xx_rif(it)> A(1) & xx_rif(it)<= B(1)
    yy_rif(1,it) = q+(m*xx_rif(it));
    
elseif xx_rif(it)> B(1) & xx_rif(it)<= C(1)
    yy_rif(1,it)= B(2);
    
elseif xx_rif(it)> C(1) & xx_rif(it)<= D(1)
    yy_rif(1,it) = q1+(m1*xx_rif(it));
else
    yy_rif(1,it) = D(2);
end

end

         % A PARAMETERS %


X0_A = [20 2];                                           
Angles0_A = 0;                  
V0_A_init = V0_A(i); 
init_sim_A=[X0_A (V0_A_init/3.6) Angles0_A]';     


x_tr_A = [X0_A(1) 20 30 50 90 1000];        
y_tr_C5 = [X0_A(1) 20 30 50 90 1000];

xx_rif_A = 0:Tc:(x_tr_A(end));

for mt=1:length(xx_rif_A)
    yy_rif_A(1,mt)= X0_A(2);
end



             % B PARAMETERS %


X0_B = [400 6];  
V0_B_init = V0_B(i); 
Angles0_B = pi;                   

init_sim_B=[X0_B (V0_B_init/3.6) Angles0_B]';     


xx_rif_B = 1000:-Tc:0;
yy_rif_B = ones(size(xx_rif_B,1),size(xx_rif_B,2))*6;




simulazioni = sim('PROVA_SORPASSO_V2.slx');                      %% we recall simulink model to run simulation

result_acc(:,i) = acc_ego.signals.values(:,1);                   %% we save the results of simulation (safety distances and acceleration values)
distanza_AA(:,i) = dist_AA.signals.values(:,1);
distanza_BB(:,i) = dist_BB.signals.values(:,1);
distanza_relativa(:,i) = relative_distance.signals.values(:,1);

end
