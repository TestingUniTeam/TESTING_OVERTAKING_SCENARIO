  %% PLOT EGO-VEHICLE
x=simout.signals.values(:,1);
y=simout.signals.values(:,2);
% xx_rif=simout1.signals.values(:,1);
% yy_rif=simout1.signals.values(:,2);
plot(x,y)
hold all
plot(xx_rif,yy_rif)
legend('traiettoria generata','traiettoria riferimento');

 %% PLOT B
x_B=simout_B.signals.values(:,1);
y_B=simout_B.signals.values(:,2);
% xx_rif=simout1.signals.values(:,1);
% yy_rif=simout1.signals.values(:,2);
plot(x_B,y_B)
hold all
plot(xx_rif_B,yy_rif_B)
legend('traiettoria generata','traiettoria riferimento');

%% PLOT A
x_A=simout_A.signals.values(:,1);
y_A=simout_A.signals.values(:,2);
% xx_rif=simout1.signals.values(:,1);
% yy_rif=simout1.signals.values(:,2);
plot(x_A,y_A)
hold all
plot(xx_rif_A,yy_rif_A)
legend('traiettoria generata','traiettoria riferimento');

%%  TOTAL PLOT 
x=simout.signals.values(:,1);
y=simout.signals.values(:,2);
x_B=simout_B.signals.values(:,1);
y_B=simout_B.signals.values(:,2);
x_A=simout_A.signals.values(:,1);
y_A=simout_A.signals.values(:,2);



plot(x,y,'-r','LineWidth',1);
hold all
plot(x_A,y_A,'-b', 'LineWidth',1);
hold all
plot(x_B,y_B,'-g', 'LineWidth',1);
hold all

legend('traiettoria ego veichle' , 'traiettoroa A', 'traiettoria B'); 
