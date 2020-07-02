%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: F5_19_parfor
% To produce the orientation map in Figure 5.19
% Developed by Takuya Kurihana 
% Original By Xiaoguang Feng. 02/18/2003
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

expname='low-';
cluster_list = {5};
%cluster_list = {13};
%cluster_list = {6,9};
for j=1:length(cluster_list)
  cluster = int2str(cluster_list{j});
  datadir=['./cluster-', cluster];
  Files = dir([datadir, '/*low*.*']);
  %parfor i=1:length(Files)
  %for i=1:length(Files)
  for i=1:2
    Filenames=Files(i).name;
    [filepath,ifile, ext] = fileparts(Filenames);
    bname = extractAfter(ifile, expname);
    logname=['./logs/cluster-',cluster,'/',ifile,'.txt'];
    name=['./results/cluster-',cluster,'/',ifile];
    %fprintf('Current worker = %1d | Process --> %2s \n', labindex, ifile);
    fprintf('Current worker = %1s | Process --> %2s \n', int2str(i), ifile);
    disp(name);
    disp(logname);
     
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


