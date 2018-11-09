%% Test real data
clear all;
close all;
clc;
M = 20;  % ensemble size
% load base clustering results
data = 'bc_pool_IS.mat';
load(data,'members','gt');
E = members;
[a,b] = size(E);
indx = randperm(b);
EC = E(:,indx(1:M));% Base clustering result
K = max(gt);  % clusters                                               

% Test our method
disp('************************************Test DREC****************************')
Out = Test_DREC(EC,K,100);
label = Out.Blable;
E_ARI = rand_index(gt, label);
E_NMI = computeNMI(gt, label);
disp(['The ARI of Ourmethod is' num2str(E_ARI)])
disp(['The NMI of Ourmethod is' num2str(E_NMI)])

