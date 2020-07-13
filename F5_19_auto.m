%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: F5_19_parfor
% To produce the orientation map in Figure 5.19
% Developed by Takuya Kurihana 
% Original By Xiaoguang Feng. 02/18/2003
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

homedir='/home/tkurihana/scratch-midway2/figs/';
%expname='67011582';
expname='m2_02_global_2000_2018_band28_29_31';
expname_suf='low-';
nclusters='20';
%cluster_list ={3};
%cluster_list ={4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19};
cluster_list ={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19};
%index_list = {380,98,103,81,85,379,76,252,91,80};

%IO
%topK=10;
%index_matrix = dlmread(['./tmp/', 'select_', expname, '.txt']);
%disp(index_matrix);
%disp(size(index_matrix));


for j=1:length(cluster_list)
  cluster = int2str(cluster_list{j});
  %for icluster=1:20
  %cluster=int2str(icluster-1);
  datadir=[homedir, expname, '/cluster-', cluster,'_N-',nclusters];
  Files = dir([datadir, '/*low*.*']);
  %parfor i=1:length(Files)
  %for ix=1:length(Files)
  index_list = index_matrix(cluster_list{j}+1,:);
  disp(index_list);
  for ix=1:topK
    %Filenames=Files(i).name;
    i = index_list(ix);
    Filenames= ['/fig_clustering_low-', expname ,'_gray_n-',int2str(i),'_N-',nclusters,'.jpg'];
    [filepath,ifile, ext] = fileparts(Filenames);
    %bname = extractAfter(ifile, expname_suf);
    %ifile = extractBefore(Filenames, '.jpg');

    % dir setting
    %logdir=['./protocol/logs2/',expname,'/cluster-',cluster,'_N-',nclusters];
    logdir=['./protocol/Orients/',expname,'/cluster-',cluster,'_N-',nclusters];
    %logname=[logdir,'/',ifile,'.txt'];
    %logname=[logdir,'/',ifile,'_table.txt'];
    logname=[logdir,'/',ifile,'_table.csv'];
    namedir=['./protocol/results/',expname,'/cluster-',cluster,'_N-',nclusters];
    name=[namedir,'/',ifile];
    
    % make dir
    mkdir(logdir);
    mkdir(namedir);

    %fprintf('Current worker = %1d | Process --> %2s \n', labindex, ifile);
    fprintf('Current worker = %1s | Process --> %2s \n', int2str(i), ifile);
    %disp(name);
    %disp(logname);
     
    I=double(imread([datadir,'/',Filenames]));
    OM=Pyramid(I,400,4,3,1,2,2,name, logname);
  end
end






%------------------------------------------------------------
% Sequential
%------------------------------------------------------------

%%I=double(imread('fingerprint.jpg'));
%img_number=4;
%fname=['fig_clustering_low-m2_02_global_2000_2018_band28_29_31_gray_n-',int2str(img_number),'_N-20.jpg'];
%I=double(imread(['./cluster-5/', fname]));
%name=['./results/cluster-5/pa-m2_02_global_2000_2018_band28_29_31_gray_n-',int2str(img_number),'_N-20'];
%logname=['./logs/cluster-5/log-m2_02_global_2000_2018_band28_29_31_n-',int2str(img_number),'_N-20.txt'];

%%OM=Pyramid(I,14,4,3,1,2,2);
%%OM=Pyramid(I,400,4,3,1,2,2);
%OM=Pyramid(I,400,4,3,1,2,2,name, logname);


