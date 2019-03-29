[Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Data set');
Xtrn = double(Xtrn)/255.0;
Xtst = double(Xtst)/255.0;

%M = task1_2(Xtrn, Ytrn);
%save('task1_2_M.mat', 'M');

%[EVecs, EVals, CumVar, MinDims] = task1_3(Xtrn);
%save('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task3/task1_3_evecs.mat', 'EVecs');
%save('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task3/task1_3_evals.mat', 'EVals');
%save('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task3/task1_3_cumvar.mat', 'CumVar');
%save('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task3/task1_3_mindims.mat', 'MinDims');

%task1_4(EVecs);

%Ks = [1,2,3,4,5,7,10,15,20];
%task1_5(Xtrn, Ks);

%for k = 1:size(Ks,2)
%    task1_6(sprintf('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task5/task1_5_c_%d.mat', Ks(k)));
%    print(figure(k), '-bestfit', sprintf('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task6/task1_6_imgs %d.pdf', Ks(k)), '-dpdf');
%end

%Ks = [1,2,3,5,10];
%for k = 1:size(Ks,2)
%    Dmap = task1_7(sprintf('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task5/task1_5_c_%d.mat', Ks(k)), '/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task2/task1_2_M.mat', '/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task3/task1_3_evecs.mat', '/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task3/task1_3_evals.mat', mean(Xtrn), 200);    
%    save(sprintf('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task7/task1_7_dmap_%d.mat', Ks(k)), 'Dmap');
%    print(figure(k), '-bestfit', sprintf('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task7/task1_7_imgs_%d.pdf', Ks(k)), '-dpdf');
%end

%Ks = [1,3,5,10,20];
%task2_1(Xtrn, Ytrn, Xtst, Ytst, Ks);

%N=200;
%Ks = 1; %[1,3];
%for k = 1:size(Ks,2)
%    Dmap = task2_2(Xtrn(1:N,:), Ytrn(1:N), Ks(k), '/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task3/task1_3_evecs.mat', '/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task3/task1_3_evals.mat', mean(Xtrn), 200);
    %save('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task2_2/task2_2_dmap_%d.mat', 'Dmap');
    %print(figure(k), '-bestfit', sprintf('/afs/inf.ed.ac.uk/user/s17/s1703913/Documents/MATLAB works/Coursework 2 - INF2B/Report files/task2_2/task2_2_imgs_%d.pdf', Ks(k)), '-dpdf');
%end






