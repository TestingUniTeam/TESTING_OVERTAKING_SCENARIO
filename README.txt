All files must stay in the same folder:

1)PROVA_SORPASSO_V2 is the simulink file that contains the modeling of the whole scenario with ego-vehicle that makes an overtaking maneuver 
2)TEST_AUTOMATICO is the matlab script used to make automation testing: we pass the test suite and it recalls the simulink model to run the simulation
3)PROVA_INDICATORI_SICUREZZA is the matlab script used to evaluate safety indicators to understand if a test case is critical or not
4)GENERATORE_TEST_RANDOM is the matlab script used to generate random test suites
5)plot_traj is the matlab script used to plot the trajectories of vehicles
6)retta2punti is the matlab script used to generate the overtaking trajectory
7)wrap_2Pi is a matlab function used to wrap angles, in radians, to the interval [0 2*pi]
8)wrap_Pi is a matlab function used to wrap angles, in radians, to the interval [-pi pi]
9)PROVA_CLUSTER is the matlab script used to evaluate optimal number of clusters to classify similar critical test cases