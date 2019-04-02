[Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set('./Data set');
Xtrn = double(Xtrn)/255.0;
Xtst = double(Xtst)/255.0;

%M = task1_2(Xtrn, Ytrn);
%save('task1_2_M.mat', 'M');

%[EVecs, EVals, CumVar, MinDims] = task1_3(Xtrn);
%save('./Report files/task3/task1_3_evecs.mat', 'EVecs');
%save('./Report files/task3/task1_3_evals.mat', 'EVals');
%save('./Report files/task3/task1_3_cumvar.mat', 'CumVar');
%save('./Report files/task3/task1_3_mindims.mat', 'MinDims');

%task1_4(EVecs);

%Ks = [1,2,3,4,5,7,10,15,20];
%task1_5(Xtrn, Ks);

%for k = 1:size(Ks,2)
%    task1_6(sprintf('./Report files/task5/task1_5_c_%d.mat', Ks(k)));
%    print(figure(k), '-bestfit', sprintf('./Report files/task6/task1_6_imgs %d.pdf', Ks(k)), '-dpdf');
%end

%Ks = [1,2,3,5,10];
%for k = 1:size(Ks,2)
%    Dmap = task1_7(sprintf('./Report files/task5/task1_5_c_%d.mat', Ks(k)), './Report files/task2/task1_2_M.mat', './Report files/task3/task1_3_evecs.mat', './Report files/task3/task1_3_evals.mat', mean(Xtrn), 200);    
%    save(sprintf('./Report files/task7/task1_7_dmap_%d.mat', Ks(k)), 'Dmap');
%    print(figure(k), '-bestfit', sprintf('./Report files/task7/task1_7_imgs_%d.pdf', Ks(k)), '-dpdf');
%end

%task1_8(Xtrn, 'digits', 10);
%lemonorange = importdata('./Tasks/lemon-orange.txt', '\t', 1);
%task1_8(lemonorange.data, 'lemonorange', 2);
%faithful = importdata('./Tasks/faithful.txt', '\t', 1);
%task1_8(faithful.data, 'faithful', 2);
%iris = importdata('./Tasks/iris.txt', '\t', 1);
%task1_8(iris.data, 'iris', 3);

%Ks = [1,3,5,10,20];
%task2_1(Xtrn, Ytrn, Xtst, Ytst, Ks);

%N=200;
%Ks = [1];%,3];
%for k = 1:size(Ks,2)
%    Dmap = task2_2(Xtrn(1:N,:), Ytrn(1:N), Ks(k), './Report files/task3/task1_3_evecs.mat', './Report files/task3/task1_3_evals.mat', mean(Xtrn), 200);
%    save(sprintf('./Report files/task2_2/task2_2_dmap_%d.mat', Ks(k)), 'Dmap');
%    print(figure(k), '-bestfit', sprintf('./Report files/task2_2/task2_2_imgs_%d.pdf', Ks(k)), '-dpdf');
%end

%task2_3(Xtrn, Ytrn);

task2_5(Xtrn, Ytrn, Xtst, Ytst, 0.01);
