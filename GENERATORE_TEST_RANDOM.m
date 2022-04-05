clear all
clc

v_ego = [40 45 50 55 60 65 70 75 80 85 90 95 100];                %% speeds vectors
v_A = [40 45 50 55 60 65 70 75 80 85 90]; 
v_B = [40 45 50 55 60 65 70 75 80 85 90 120];

acc = [-6 -5.5 -5 -4.5 -4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0];        %% acceleration values vector 


randomIndex_v_ego = randi(length(v_ego), 2320,1);    
param_init(:,1) = v_ego(randomIndex_v_ego);   

randomIndex_v_A = randi(length(v_A), 2320,1);    
param_init(:,2) = v_A(randomIndex_v_A); 

randomIndex_v_B = randi(length(v_B), 2320,1);    
param_init(:,3) = v_B(randomIndex_v_B); 

randomIndex_acc = randi(length(acc), 2320,2);      
param_init(:,4:5) = acc(randomIndex_acc);   
