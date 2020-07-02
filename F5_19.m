%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% file: F5_19.m
% To produce the orientation map in Figure 5.19
% By Xiaoguang Feng. 02/18/2003
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%I=double(imread('fingerprint.jpg'));
%I=double(imread('./cluster-6/fig_clustering_67011582_n-0_N-20gray.png'));
I=double(imread('./cluster-5/fig_clustering_low-m2_02_global_2000_2018_band28_29_31_gray_n-0_N-20.jpg'));

OM=Pyramid(I,24,4,3,1,2,2);
%OM=Pyramid(I,14,4,3,1,2,2);
%OM=Pyramid(I,8,4,3,1,2,2);
