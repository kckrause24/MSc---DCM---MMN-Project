% inspect_meg_events.m
% Load one converted SPM MEG file and inspect event codes.

clear; clc;

% ---- EDIT THIS PATH ON YOUR MACHINE ----
spm_file = '/Users/klauskrause/Documents/MATLAB/ds004837_spm_test/spmeeg_sub-2247A_ses-0001_task-attnmod_run-01_meg.mat';

% Load dataset
D = spm_eeg_load(spm_file);

% Extract events
ev = events(D);
types = string({ev.type})';
vals  = cellfun(@double, {ev.value})';
times = [ev.time]';

% Count unique event values
u = unique(vals);
counts = arrayfun(@(x) sum(vals == x), u);

disp('Unique event values and counts:')
disp(table(u, counts))

% Show non-zero "up" triggers only
idx = vals ~= 0 & endsWith(types, "_up");
T = table(types(idx), vals(idx), times(idx), ...
    'VariableNames', {'Type', 'Value', 'TimeSec'});

disp('First 30 non-zero "up" triggers:')
disp(T(1:min(30, height(T)), :))
