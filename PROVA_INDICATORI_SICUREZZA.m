for i  = 1 : 2320
    min_acc(1,i) = min(result_acc(:,i));
end

for i  = 1 : 2320
    min_AA(1,i) = min(distanza_AA(:,i));
    
end

% for i  = 1 : 192
%     min_BB(1,i) = min(distanza_BB(:,i));
% end

for k = 1 : 2320
    min_dist_rel(1,k) = min(distanza_relativa(:,k));
end

%% RESEARCH CRITICAL CASES

for k = 1 : length(min_AA)
    if (min_AA(1,k) > 1 && min_AA(1,k) < 1.8  && min_dist_rel(1,k)> 4) || ( min_dist_rel(1,k) < 4 && min_dist_rel(1,k) > 3  &&  min_AA(1,k) > 1)
        indicatore_distanza(k,1) = k;
        indicatore_distanza(k,2) = min_AA(1,k);
        indicatore_distanza(k,3) = min_dist_rel(1,k);

   
    end
    
    if min_AA(1,k) < 1 ||  min_dist_rel(1,k) <= 3
        
        indicatore_distanza(k,4) = k;                        
        indicatore_distanza(k,5) = min_AA(1,k)                            %% accident
        indicatore_distanza(k,6) = min_dist_rel(1,k);
       
    end
    
    if min_AA(1,k) >= 1.8     &&  min_dist_rel(1,k)>= 4                   %% passed
        indicatore_distanza(k,7) = k;
        indicatore_distanza(k,8) = min_AA(1,k)
        indicatore_distanza(k,9) = min_dist_rel(1,k);
     
    end
end
%% NUMBER OF CRITICAL CASES IDENTIFIED

n_test_critici_tot = nnz(indicatore_distanza(:,1));
% n_test_critici_dist_rel = nnz(indicatore_distanza(:,1))


        

%% I EXPORT THE CRITICAL TEST SUITES IN EXCEL


nomefile = 'indicatori_sicurezza_casi_critici.xlsx' ;
writematrix(indicatore_distanza,nomefile, 'Sheet',1,'Range','A1');
