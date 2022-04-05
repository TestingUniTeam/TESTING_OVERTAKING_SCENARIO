load('TC_CRITICI_COMB_3w');    %%% si carica nel workspace il file che contiene tutti i test case critici trovati in precedenza


eva = evalclusters(test_case,'kmeans','DaviesBouldin','KList',[1:30]);  %%% a partire da un K fissato (in questo caso 30)
                                                                        %%% si valuta il numero ottimo di cluster


K_optim = eva.OptimalK;        %%% numero ottimo di cluster da impostare

plot(eva)                      %%% plot delle distanze di Davies-Bouldin in funzione del numero di cluster



%% CALCOLO DEI CLUSTER CON K OTTIMO

[idx,Centroide,sumd,distance] = kmeans(test_case,4,'Distance','cityblock');

%%%idx è l'indice del cluster a cui il test case è stato associato
%%% Distance è la distanza di ogni punto del test case rispetto al centroide di ciascun cluster