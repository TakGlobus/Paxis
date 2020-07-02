%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: F5_19.m
% To produce the orientation map in Figure 5.19
% By Xiaoguang Feng. 02/18/2003
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%I=double(imread('fingerprint.jpg'));
img_number=4;
fname=['fig_clustering_low-m2_02_global_2000_2018_band28_29_31_gray_n-',int2str(img_number),'_N-20.jpg'];
I=double(imread(['./cluster-5/', fname]));
name=['./results/cluster-5/pa-m2_02_global_2000_2018_band28_29_31_gray_n-',int2str(img_number),'_N-20'];
logname=['./logs/cluster-5/log-m2_02_global_2000_2018_band28_29_31_n-',int2str(img_number),'_N-20.txt'];

%OM=Pyramid(I,14,4,3,1,2,2);
%OM=Pyramid(I,400,4,3,1,2,2);
OM=Pyramid(I,400,4,3,1,2,2,name, logname);


