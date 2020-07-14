%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: F5_19_parfor
% To produce the orientation map in Figure 5.19
% Developed by Takuya Kurihana 
% Original By Xiaoguang Feng. 02/18/2003
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nclusters='20';
%cluster_list ={0};

cluster_list ={2};
%cluster_list ={1,3,4,5,6,7,8,9};
%cluster_list ={10,11,12,13,14,15,16,17,18,19};

%cluster_list ={4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19};
%cluster_list ={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19};
%index_list = {380,98,103,81,85,379,76,252,91,80};

%angle_list = {0,-90, -180, -270};
%angle_list = {0,-90, -180, -270};


for j=1:length(cluster_list)
%parfor j=1:length(cluster_list)
  homedir='/home/tkurihana/scratch-midway2/figs/';
  expname='67011582';
  %expname='m2_02_global_2000_2018_band28_29_31';
  expname_suf='low-';

  angle_list = {0,-90, -180, -270};

  cluster = int2str(cluster_list{j});
  datadir=[homedir, expname, '/cluster-', cluster,'_N-',nclusters];
  Files = dir([datadir, '/*low*.*']);

  %for ix=1:length(Files)
  for ix=1:length(Files)
    %Filenames=Files(i).name;
    %i = index_list(ix);
    i = ix - 1;
    Filenames= ['/fig_clustering_low-', expname ,'_gray_n-',int2str(i),'_N-',nclusters,'.jpg'];
    [filepath,ifile, ext] = fileparts(Filenames);

    fprintf('Current worker = %1s | Process --> %2s \n', int2str(i), ifile);

    I=double(imread([datadir,'/',Filenames]));

    for iy=1:length(angle_list)
      iangle = angle_list{iy};

      %rotate image
      J = imrotate(I, iangle);

      % dir setting
      logdir=['./protocol/rotation/log_rot',int2str(iangle),'/',expname,'/cluster-',cluster,'_N-',nclusters];
      logdir2=['./protocol/rotation/Orients_rot',int2str(iangle),'/',expname,'/cluster-',cluster,'_N-',nclusters];
      logname=[logdir,'/',ifile,'.txt'];
      logname2=[logdir2,'/',ifile,'_table.csv'];
      namedir=['./protocol/results_rot',int2str(iangle),'/',expname,'/cluster-',cluster,'_N-',nclusters];
      name=[namedir,'/',ifile];
    
      % make dir
      mkdir(logdir);
      mkdir(logdir2);
      %mkdir(namedir);

     
      OM=Pyramid(I,400,4,3,1,2,2,name, logname, logname2);
      clear J;
      clear OM;
    end
    clear I;
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


