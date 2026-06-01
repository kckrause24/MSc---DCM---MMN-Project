% check_epoched_dataset.m
% Load one epoched SPM dataset and confirm trial count and conditions.

clear; clc;

% ---- EDIT THIS PATH ON YOUR MACHINE ----
epoched_file = '/Users/klauskrause/Documents/MATLAB/ds004837_spm_test/espmeeg_sub-2247A_ses-0001_task-attnmod_run-01_meg.mat';

% Load epoched dataset
D = spm_eeg_load(epoched_file);

% Basic checks
fprintf('Number of trials: %d\n', ntrials(D));

c = conditions(D)';
[u, ~, ic] = unique(c);
counts = accumarray(ic, 1);

disp('Condition counts:')
disp(table(u, counts, 'VariableNames', {'Condition', 'Count'}))
