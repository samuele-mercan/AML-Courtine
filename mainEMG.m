clc
close all;
%% Loading and Denoising and Segmentation of all data 
leftFoot = true;
[SCI_GaitCycles_Float, SCI_GaitCycles_noFloat] = SCIsegmentation(leftFoot);

[GaitCyclesFloat1,GaitCyclesNoFloat1] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject1_2018/FLOAT/S1_FLOAT.mat', ...
    'Healthy Recordings/Subject1_2018/NO_FLOAT/S1_NO_FLOAT.mat',...
    'HealthyGaitEvents/2018_S1_FLOAT.mat', 'HealthyGaitEvents/2018_S1_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat2,GaitCyclesNoFloat2] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject2_2018/FLOAT/S2_FLOAT.mat', ...
    'Healthy Recordings/Subject2_2018/NO_FLOAT/S2_NO_FLOAT.mat', ...
    'HealthyGaitEvents/2018_S2_FLOAT.mat', 'HealthyGaitEvents/2018_S2_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat3,GaitCyclesNoFloat3] = ...
     HealthySubjectSegmentation('Healthy Recordings/Subject3_2018/FLOAT/S3_FLOAT.mat', ...
    'Healthy Recordings/Subject3_2018/NO_FLOAT/S3_NO_FLOAT.mat', ...
    'HealthyGaitEvents/2018_S3_FLOAT.mat', 'HealthyGaitEvents/2018_S3_NO_FLOAT.mat', leftFoot);

[GaitCyclesFloat4,GaitCyclesNoFloat4] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject4_2018/FLOAT/S4_FLOAT.mat', ...
    'Healthy Recordings/Subject4_2018/NO_FLOAT/S4_NO_FLOAT.mat', ...
    'HealthyGaitEvents/2018_S4_FLOAT.mat', 'HealthyGaitEvents/2018_S4_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat5,GaitCyclesNoFloat5] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject5_2018/FLOAT/S5_FLOAT.mat', ...
    'Healthy Recordings/Subject5_2018/NO_FLOAT/S5_NO_FLOAT.mat',...
    'HealthyGaitEvents/2018_S5_FLOAT.mat', 'HealthyGaitEvents/2018_S5_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat6,GaitCyclesNoFloat6] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject6_2018/FLOAT/S6_FLOAT.mat', ...
    'Healthy Recordings/Subject6_2018/NO_FLOAT/S6_NO_FLOAT.mat',...
    'HealthyGaitEvents/2018_S6_FLOAT.mat', 'HealthyGaitEvents/2018_S6_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat7,GaitCyclesNoFloat7] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject1_2019/FLOAT/S1_FLOAT.mat', ...
    'Healthy Recordings/Subject1_2019/NO_FLOAT/S1_NO_FLOAT.mat',...
    'HealthyGaitEvents/2019_S1_FLOAT.mat', 'HealthyGaitEvents/2019_S1_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat8,GaitCyclesNoFloat8] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject2_2019/FLOAT/S2_FLOAT.mat', ...
    'Healthy Recordings/Subject2_2019/NO_FLOAT/S2_NO_FLOAT.mat',...
    'HealthyGaitEvents/2019_S2_FLOAT.mat', 'HealthyGaitEvents/2019_S2_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat9,GaitCyclesNoFloat9] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject3_2019/FLOAT/S3_FLOAT.mat', ...
     'Healthy Recordings/Subject3_2019/NO_FLOAT/S3_NO_FLOAT.mat',...
     'HealthyGaitEvents/2019_S3_FLOAT.mat', 'HealthyGaitEvents/2019_S3_NO_FLOAT.mat',leftFoot);

%% EMG enveloppe 
[env_SCI_float1, env_SCI_float2] = enveloppe_EMG(SCI_GaitCycles_Float);
[env_SCI_nofloat1, env_SCI_nofloat2] = enveloppe_EMG(SCI_GaitCycles_noFloat);

[env_HP1_float1, env_HP1_float2] = enveloppe_EMG(GaitCyclesFloat1);
[env_HP2_float1, env_HP2_float2] = enveloppe_EMG(GaitCyclesFloat2);
[env_HP3_float1, env_HP3_float2] = enveloppe_EMG(GaitCyclesFloat3);
[env_HP4_float1, env_HP4_float2] = enveloppe_EMG(GaitCyclesFloat4);
[env_HP5_float1, env_HP5_float2] = enveloppe_EMG(GaitCyclesFloat5);
[env_HP6_float1, env_HP6_float2] = enveloppe_EMG(GaitCyclesFloat6);
[env_HP7_float1, env_HP7_float2] = enveloppe_EMG(GaitCyclesFloat7);
[env_HP8_float1, env_HP8_float2] = enveloppe_EMG(GaitCyclesFloat8);
[env_HP9_float1, env_HP9_float2] = enveloppe_EMG(GaitCyclesFloat9);

[env_HP1_nofloat1, env_HP1_nofloat2] = enveloppe_EMG(GaitCyclesNoFloat1);
[env_HP2_nofloat1, env_HP2_nofloat2] = enveloppe_EMG(GaitCyclesNoFloat2);
[env_HP3_nofloat1, env_HP3_nofloat2] = enveloppe_EMG(GaitCyclesNoFloat3);
[env_HP4_nofloat1, env_HP4_nofloat2] = enveloppe_EMG(GaitCyclesNoFloat4);
[env_HP5_nofloat1, env_HP5_nofloat2] = enveloppe_EMG(GaitCyclesNoFloat5);
[env_HP6_nofloat1, env_HP6_nofloat2] = enveloppe_EMG(GaitCyclesNoFloat6);
[env_HP7_nofloat1, env_HP7_nofloat2] = enveloppe_EMG(GaitCyclesNoFloat7);
[env_HP8_nofloat1, env_HP8_nofloat2] = enveloppe_EMG(GaitCyclesNoFloat8);
[env_HP9_nofloat1, env_HP9_nofloat2] = enveloppe_EMG(GaitCyclesNoFloat9);

%% Automatic EMG Onset & Offset Detection 

% SCI
%[onset_SCI_float1,offset_SCI_float1]=detection_burst(env_SCI_float1);
[onset_SCI_float2,offset_SCI_float2]=detection_burst(env_SCI_float2);
[onset_SCI_nofloat2,offset_SCI_nofloat2]=detection_burst(env_SCI_nofloat2);


% HP No Float

%[onset_HP1_nofloat1,offset_HP1_nofloat1]=detection_burst(env_HP1_nofloat1);
[onset_HP1_nofloat2,offset_HP1_nofloat2]=detection_burst(env_HP1_nofloat2);

% [onset_HP2_nofloat1,offset_HP2_nofloat1]=detection_burst(env_HP2_nofloat1);
[onset_HP2_nofloat2,offset_HP2_nofloat2]=detection_burst(env_HP2_nofloat2);
% 
% [onset_HP3_nofloat1,offset_HP3_nofloat1]=detection_burst(env_HP3_nofloat1);
[onset_HP3_nofloat2,offset_HP3_nofloat2]=detection_burst(env_HP3_nofloat2);
% 
% [onset_HP4_nofloat1,offset_HP4_nofloat1]=detection_burst(env_HP4_nofloat1);
[onset_HP4_nofloat2,offset_HP4_nofloat2]=detection_burst(env_HP4_nofloat2);
% 
% [onset_HP5_nofloat1,offset_HP5_nofloat1]=detection_burst(env_HP5_nofloat1);
[onset_HP5_nofloat2,offset_HP5_nofloat2]=detection_burst(env_HP5_nofloat2);
% 
% [onset_HP6_nofloat1,offset_HP6_nofloat1]=detection_burst(env_HP6_nofloat1);
[onset_HP6_nofloat2,offset_HP6_nofloat2]=detection_burst(env_HP6_nofloat2);
% 
% [onset_HP7_nofloat1,offset_HP7_nofloat1]=detection_burst(env_HP7_nofloat1);
[onset_HP7_nofloat2,offset_HP7_nofloat2]=detection_burst(env_HP7_nofloat2);
% 
% [onset_HP8_nofloat1,offset_HP8_nofloat1]=detection_burst(env_HP8_nofloat1);
[onset_HP8_nofloat2,offset_HP8_nofloat2]=detection_burst(env_HP8_nofloat2);
% 
% [onset_HP9_nofloat1,offset_HP9_nofloat1]=detection_burst(env_HP9_nofloat1);
[onset_HP9_nofloat2,offset_HP9_nofloat2]=detection_burst(env_HP9_nofloat2);
% 
% % HP Float 
% 
% [onset_HP1_float1,offset_HP1_float1]=detection_burst(env_HP1_float1);
[onset_HP1_float2,offset_HP1_float2]=detection_burst(env_HP1_float2);
% 
% [onset_HP2_float1,offset_HP2_float1]=detection_burst(env_HP2_float1);
[onset_HP2_float2,offset_HP2_float2]=detection_burst(env_HP2_float2);
% 
% [onset_HP3_float1,offset_HP3_float1]=detection_burst(env_HP3_float1);
[onset_HP3_float2,offset_HP3_float2]=detection_burst(env_HP3_float2);
% 
% [onset_HP4_float1,offset_HP4_float1]=detection_burst(env_HP4_float1);
[onset_HP4_float2,offset_HP4_float2]=detection_burst(env_HP4_float2);
% 
% [onset_HP5_float1,offset_HP5_float1]=detection_burst(env_HP5_float1);
 [onset_HP5_float2,offset_HP5_float2]=detection_burst(env_HP5_float2);
% 
% [onset_HP6_float1,offset_HP6_float1]=detection_burst(env_HP6_float1);
[onset_HP6_float2,offset_HP6_float2]=detection_burst(env_HP6_float2);
% 
% [onset_HP7_float1,offset_HP7_float1]=detection_burst(env_HP7_float1);
[onset_HP7_float2,offset_HP7_float2]=detection_burst(env_HP7_float2);
% 
% [onset_HP8_float1,offset_HP8_float1]=detection_burst(env_HP8_float1);
[onset_HP8_float2,offset_HP8_float2]=detection_burst(env_HP8_float2);
% 
% [onset_HP9_float1,offset_HP9_float1]=detection_burst(env_HP9_float1);
[onset_HP9_float2,offset_HP9_float2]=detection_burst(env_HP9_float2);

clear env_HP1_float1 env_HP1_float2 env_HP2_float1 env_HP2_float2 env_HP3_float1 env_HP3_float2 ...
     env_HP4_float1 env_HP4_float2 env_HP5_float1 env_HP5_float2 env_HP6_float1 env_HP6_float2 ...
     env_HP7_float1  env_HP7_float2  env_HP8_float1  env_HP8_float2  env_HP9_float1 env_HP9_float2 ...
     env_HP1_nofloat1 env_HP1_nofloat2 env_HP2_nofloat1 env_HP2_nofloat2 env_HP3_nofloat1 env_HP3_nofloat2 ...
     env_HP4_nofloat1 env_HP4_nofloat2 env_HP5_nofloat1 env_HP5_nofloat2 env_HP6_nofloat1 env_HP6_nofloat2 ...
     env_HP7_nofloat1  env_HP7_nofloat2  env_HP8_nofloat1  env_HP8_nofloat2  env_HP9_nofloat1 env_HP9_nofloat2 ...
     env_SCI_float1 env_SCI_nofloat1 env_SCI_float2 env_SCI_nofloat2  ...
     onset_SCI_float1 offset_SCI_float1 onset_SCI_nofloat1 offset_SCI_nofloat1 onset_HP1_float1 offset_HP1_float1 ...
     onset_HP2_float1 offset_HP2_float1 onset_HP3_float1 offset_HP3_float1 onset_HP4_float1 offset_HP4_float1 ...
     onset_HP5_float1 offset_HP5_float1 onset_HP6_float1 offset_HP6_float1 onset_HP7_float1 offset_HP7_float1 ...
     onset_HP8_float1 offset_HP8_float1 onset_HP9_float1 offset_HP9_float1 onset_HP1_nofloat1 offset_HP1_nofloat1 ...
     onset_HP2_nofloat1 offset_HP2_nofloat1 onset_HP3_nofloat1 offset_HP3_nofloat1 onset_HP4_nofloat1 offset_HP4_nofloat1 ...
     onset_HP5_nofloat1 offset_HP5_nofloat1 onset_HP6_nofloat1 offset_HP6_nofloat1 onset_HP7_nofloat1 offset_HP7_nofloat1 ...
     onset_HP8_nofloat1 offset_HP8_nofloat1 onset_HP9_nofloat1 offset_HP9_nofloat1 env_HP1_float1 env_HP1_nofloat1 ...
     env_HP2_float2 env_HP2_nofloat2 env_HP3_float2 env_HP3_nofloat2 env_HP4_float2 env_HP4_nofloat2 env_HP5_float2 ...
     env_HP5_nofloat2 env_HP6_float2 env_HP6_nofloat2 env_HP7_float2 env_HP7_nofloat2 env_HP8_float2 env_HP8_nofloat2 ...
     env_HP1_float9 env_HP1_nofloat9
     
%% By Hand EMG Onset & Offset Detection - NOT CHANGED YET

% onset_SCI_float = hand_detection(SCI_float,denoised_SCI_float);
% onset_SCI_no_float = hand_detection(SCI_no_float,denoised_SCI_no_float);
% onset_HP_no_float_1 = hand_detection(HP_no_float1,denoised_HO_no_float1);
% onset_HP_no_float_2 = hand_detection(HP_no_float2,denoised_HO_no_float2);
% onset_HP_no_float_3 = hand_detection(HP_no_float3,denoised_HO_no_float3);
% 
% offset_SCI_float = hand_detection(SCI_float,denoised_SCI_float);
% offset_SCI_no_float = hand_detection(SCI_no_float,denoised_SCI_no_float);
% offset_HP_no_float_1 = hand_detection(HP_no_float1,denoised_HO_no_float1);
% offset_HP_no_float_2 = hand_detection(HP_no_float2,denoised_HO_no_float2);
% offset_HP_no_float_3 = hand_detection(HP_no_float3,denoised_HO_no_float3);

%% Burst Duration

% SCI
duration_SCI_float = duration_EMG(onset_SCI_float2,offset_SCI_float2); 
duration_SCI_nofloat = duration_EMG(onset_SCI_nofloat2,offset_SCI_nofloat2); 

% HP Float
duration_HP1_float = duration_EMG(onset_HP1_float2,offset_HP1_float2); 
duration_HP2_float = duration_EMG(onset_HP2_float2,offset_HP2_float2); 
duration_HP3_float = duration_EMG(onset_HP3_float2,offset_HP3_float2); 
duration_HP4_float = duration_EMG(onset_HP4_float2,offset_HP4_float2); 
duration_HP5_float = duration_EMG(onset_HP5_float2,offset_HP5_float2); 
duration_HP6_float = duration_EMG(onset_HP6_float2,offset_HP6_float2); 
duration_HP7_float = duration_EMG(onset_HP7_float2,offset_HP7_float2); 
duration_HP8_float = duration_EMG(onset_HP8_float2,offset_HP8_float2); 
duration_HP9_float = duration_EMG(onset_HP9_float2,offset_HP9_float2); 

% HP no float 
duration_HP1_nofloat = duration_EMG(onset_HP1_nofloat2,offset_HP1_nofloat2); 
duration_HP2_nofloat = duration_EMG(onset_HP2_nofloat2,offset_HP2_nofloat2); 
duration_HP3_nofloat = duration_EMG(onset_HP3_nofloat2,offset_HP3_nofloat2); 
duration_HP4_nofloat = duration_EMG(onset_HP4_nofloat2,offset_HP4_nofloat2); 
duration_HP5_nofloat = duration_EMG(onset_HP5_nofloat2,offset_HP5_nofloat2); 
duration_HP6_nofloat = duration_EMG(onset_HP6_nofloat2,offset_HP6_nofloat2); 
duration_HP7_nofloat = duration_EMG(onset_HP7_nofloat2,offset_HP7_nofloat2); 
duration_HP8_nofloat = duration_EMG(onset_HP8_nofloat2,offset_HP8_nofloat2); 
duration_HP9_nofloat = duration_EMG(onset_HP9_nofloat2,offset_HP9_nofloat2); 

%% Max activation 

% SCI
max_SCI_float = max_EMG(onset_SCI_float2,offset_SCI_float2,SCI_GaitCycles_Float); 
max_SCI_nofloat = max_EMG(onset_SCI_nofloat2,offset_SCI_nofloat2,SCI_GaitCycles_noFloat); 

% HP Float
max_HP1_float = max_EMG(onset_HP1_float2,offset_HP1_float2,GaitCyclesFloat1); 
max_HP2_float = max_EMG(onset_HP2_float2,offset_HP2_float2,GaitCyclesFloat2); 
max_HP3_float = max_EMG(onset_HP3_float2,offset_HP3_float2,GaitCyclesFloat3); 
max_HP4_float = max_EMG(onset_HP4_float2,offset_HP4_float2,GaitCyclesFloat4); 
max_HP5_float = max_EMG(onset_HP5_float2,offset_HP5_float2,GaitCyclesFloat5); 
max_HP6_float = max_EMG(onset_HP6_float2,offset_HP6_float2,GaitCyclesFloat6); 
max_HP7_float = max_EMG(onset_HP7_float2,offset_HP7_float2,GaitCyclesFloat7); 
max_HP8_float = max_EMG(onset_HP8_float2,offset_HP8_float2,GaitCyclesFloat8); 
max_HP9_float = max_EMG(onset_HP9_float2,offset_HP9_float2,GaitCyclesFloat9); 

% HP no float 
max_HP1_nofloat = max_EMG(onset_HP1_nofloat2,offset_HP1_nofloat2,GaitCyclesNoFloat1); 
max_HP2_nofloat = max_EMG(onset_HP2_nofloat2,offset_HP2_nofloat2,GaitCyclesNoFloat2); 
max_HP3_nofloat = max_EMG(onset_HP3_nofloat2,offset_HP3_nofloat2,GaitCyclesNoFloat3); 
max_HP4_nofloat = max_EMG(onset_HP4_nofloat2,offset_HP4_nofloat2,GaitCyclesNoFloat4); 
max_HP5_nofloat = max_EMG(onset_HP5_nofloat2,offset_HP5_nofloat2,GaitCyclesNoFloat5); 
max_HP6_nofloat = max_EMG(onset_HP6_nofloat2,offset_HP6_nofloat2,GaitCyclesNoFloat6); 
max_HP7_nofloat = max_EMG(onset_HP7_nofloat2,offset_HP7_nofloat2,GaitCyclesNoFloat7); 
max_HP8_nofloat = max_EMG(onset_HP8_nofloat2,offset_HP8_nofloat2,GaitCyclesNoFloat8); 
max_HP9_nofloat = max_EMG(onset_HP9_nofloat2,offset_HP9_nofloat2,GaitCyclesNoFloat9); 

%% Mean activation 
% SCI
mean_SCI_float = mean_EMG(onset_SCI_float2,offset_SCI_float2,SCI_GaitCycles_Float); 
mean_SCI_nofloat = mean_EMG(onset_SCI_nofloat2,offset_SCI_nofloat2,SCI_GaitCycles_noFloat); 

% HP Float
mean_HP1_float = mean_EMG(onset_HP1_float2,offset_HP1_float2,GaitCyclesFloat1); 
mean_HP2_float = mean_EMG(onset_HP2_float2,offset_HP2_float2,GaitCyclesFloat2); 
mean_HP3_float = mean_EMG(onset_HP3_float2,offset_HP3_float2,GaitCyclesFloat3); 
mean_HP4_float = mean_EMG(onset_HP4_float2,offset_HP4_float2,GaitCyclesFloat4); 
mean_HP5_float = mean_EMG(onset_HP5_float2,offset_HP5_float2,GaitCyclesFloat5); 
mean_HP6_float = mean_EMG(onset_HP6_float2,offset_HP6_float2,GaitCyclesFloat6); 
mean_HP7_float = mean_EMG(onset_HP7_float2,offset_HP7_float2,GaitCyclesFloat7); 
mean_HP8_float = mean_EMG(onset_HP8_float2,offset_HP8_float2,GaitCyclesFloat8); 
mean_HP9_float = mean_EMG(onset_HP9_float2,offset_HP9_float2,GaitCyclesFloat9); 

% HP no float 
mean_HP1_nofloat = mean_EMG(onset_HP1_nofloat2,offset_HP1_nofloat2,GaitCyclesNoFloat1); 
mean_HP2_nofloat = mean_EMG(onset_HP2_nofloat2,offset_HP2_nofloat2,GaitCyclesNoFloat2); 
mean_HP3_nofloat = mean_EMG(onset_HP3_nofloat2,offset_HP3_nofloat2,GaitCyclesNoFloat3); 
mean_HP4_nofloat = mean_EMG(onset_HP4_nofloat2,offset_HP4_nofloat2,GaitCyclesNoFloat4); 
mean_HP5_nofloat = mean_EMG(onset_HP5_nofloat2,offset_HP5_nofloat2,GaitCyclesNoFloat5); 
mean_HP6_nofloat = mean_EMG(onset_HP6_nofloat2,offset_HP6_nofloat2,GaitCyclesNoFloat6); 
mean_HP7_nofloat = mean_EMG(onset_HP7_nofloat2,offset_HP7_nofloat2,GaitCyclesNoFloat7); 
mean_HP8_nofloat = mean_EMG(onset_HP8_nofloat2,offset_HP8_nofloat2,GaitCyclesNoFloat8); 
mean_HP9_nofloat = mean_EMG(onset_HP9_nofloat2,offset_HP9_nofloat2,GaitCyclesNoFloat9); 

%% Coactivation Percentage
% SCI
coactivation_SCI_float = coactivation_EMG(onset_SCI_float2,offset_SCI_float2,SCI_GaitCycles_Float); 
coactivation_SCI_nofloat = coactivation_EMG(onset_SCI_nofloat2,offset_SCI_nofloat2,SCI_GaitCycles_noFloat); 

% HP Float
coactivation_HP1_float = coactivation_EMG(onset_HP1_float2,offset_HP1_float2,GaitCyclesFloat1); 
coactivation_HP2_float = coactivation_EMG(onset_HP2_float2,offset_HP2_float2,GaitCyclesFloat2); 
coactivation_HP3_float = coactivation_EMG(onset_HP3_float2,offset_HP3_float2,GaitCyclesFloat3); 
coactivation_HP4_float = coactivation_EMG(onset_HP4_float2,offset_HP4_float2,GaitCyclesFloat4); 
coactivation_HP5_float = coactivation_EMG(onset_HP5_float2,offset_HP5_float2,GaitCyclesFloat5); 
coactivation_HP6_float = coactivation_EMG(onset_HP6_float2,offset_HP6_float2,GaitCyclesFloat6); 
coactivation_HP7_float = coactivation_EMG(onset_HP7_float2,offset_HP7_float2,GaitCyclesFloat7); 
coactivation_HP8_float = coactivation_EMG(onset_HP8_float2,offset_HP8_float2,GaitCyclesFloat8); 
coactivation_HP9_float = coactivation_EMG(onset_HP9_float2,offset_HP9_float2,GaitCyclesFloat9); 

% HP no float 
coactivation_HP1_nofloat = coactivation_EMG(onset_HP1_nofloat2,offset_HP1_nofloat2,GaitCyclesNoFloat1); 
coactivation_HP2_nofloat = coactivation_EMG(onset_HP2_nofloat2,offset_HP2_nofloat2,GaitCyclesNoFloat2); 
coactivation_HP3_nofloat = coactivation_EMG(onset_HP3_nofloat2,offset_HP3_nofloat2,GaitCyclesNoFloat3); 
coactivation_HP4_nofloat = coactivation_EMG(onset_HP4_nofloat2,offset_HP4_nofloat2,GaitCyclesNoFloat4); 
coactivation_HP5_nofloat = coactivation_EMG(onset_HP5_nofloat2,offset_HP5_nofloat2,GaitCyclesNoFloat5); 
coactivation_HP6_nofloat = coactivation_EMG(onset_HP6_nofloat2,offset_HP6_nofloat2,GaitCyclesNoFloat6); 
coactivation_HP7_nofloat = coactivation_EMG(onset_HP7_nofloat2,offset_HP7_nofloat2,GaitCyclesNoFloat7); 
coactivation_HP8_nofloat = coactivation_EMG(onset_HP8_nofloat2,offset_HP8_nofloat2,GaitCyclesNoFloat8); 
coactivation_HP9_nofloat = coactivation_EMG(onset_HP9_nofloat2,offset_HP9_nofloat2,GaitCyclesNoFloat9); 

%% RMS 
% SCI
rms_SCI_float = rms_EMG(onset_SCI_float2,offset_SCI_float2,SCI_GaitCycles_Float); 
rms_SCI_nofloat = rms_EMG(onset_SCI_nofloat2,offset_SCI_nofloat2,SCI_GaitCycles_noFloat); 

% HP Float
rms_HP1_float = rms_EMG(onset_HP1_float2,offset_HP1_float2,GaitCyclesFloat1); 
rms_HP2_float = rms_EMG(onset_HP2_float2,offset_HP2_float2,GaitCyclesFloat2); 
rms_HP3_float = rms_EMG(onset_HP3_float2,offset_HP3_float2,GaitCyclesFloat3); 
rms_HP4_float = rms_EMG(onset_HP4_float2,offset_HP4_float2,GaitCyclesFloat4); 
rms_HP5_float = rms_EMG(onset_HP5_float2,offset_HP5_float2,GaitCyclesFloat5); 
rms_HP6_float = rms_EMG(onset_HP6_float2,offset_HP6_float2,GaitCyclesFloat6); 
rms_HP7_float = rms_EMG(onset_HP7_float2,offset_HP7_float2,GaitCyclesFloat7); 
rms_HP8_float = rms_EMG(onset_HP8_float2,offset_HP8_float2,GaitCyclesFloat8); 
rms_HP9_float = rms_EMG(onset_HP9_float2,offset_HP9_float2,GaitCyclesFloat9); 

% HP no float 
rms_HP1_nofloat = rms_EMG(onset_HP1_nofloat2,offset_HP1_nofloat2,GaitCyclesNoFloat1); 
rms_HP2_nofloat = rms_EMG(onset_HP2_nofloat2,offset_HP2_nofloat2,GaitCyclesNoFloat2); 
rms_HP3_nofloat = rms_EMG(onset_HP3_nofloat2,offset_HP3_nofloat2,GaitCyclesNoFloat3); 
rms_HP4_nofloat = rms_EMG(onset_HP4_nofloat2,offset_HP4_nofloat2,GaitCyclesNoFloat4); 
rms_HP5_nofloat = rms_EMG(onset_HP5_nofloat2,offset_HP5_nofloat2,GaitCyclesNoFloat5); 
rms_HP6_nofloat = rms_EMG(onset_HP6_nofloat2,offset_HP6_nofloat2,GaitCyclesNoFloat6); 
rms_HP7_nofloat = rms_EMG(onset_HP7_nofloat2,offset_HP7_nofloat2,GaitCyclesNoFloat7); 
rms_HP8_nofloat = rms_EMG(onset_HP8_nofloat2,offset_HP8_nofloat2,GaitCyclesNoFloat8); 
rms_HP9_nofloat = rms_EMG(onset_HP9_nofloat2,offset_HP9_nofloat2,GaitCyclesNoFloat9); 


%% Create Parameter matrix 
if leftFoot
    Param_SCI_Float_Left = extract_EMG(duration_SCI_float,mean_SCI_float,max_SCI_float,rms_SCI_float,coactivation_SCI_float);
    save([pwd,'/EMGParametersMatrix/Param_SCI_Float_Left.mat'],'Param_SCI_Float_Left');
    Param_SCI_NoFloat_Left = extract_EMG(duration_SCI_nofloat,mean_SCI_nofloat,max_SCI_nofloat,rms_SCI_nofloat,coactivation_SCI_nofloat);
    save([pwd,'/EMGParametersMatrix/Param_SCI_NoFloat_Left.mat'],'Param_SCI_NoFloat_Left');

    Param_Healthy_Float_Left = [];
    Param_Healthy_Float_Left = [Param_Healthy_Float_Left;extract_EMG(duration_HP1_float,mean_HP1_float,max_HP1_float,rms_HP1_float,coactivation_HP1_float)];
    Param_Healthy_Float_Left = [Param_Healthy_Float_Left;extract_EMG(duration_HP3_float,mean_HP3_float,max_HP3_float,rms_HP3_float,coactivation_HP3_float)];
    Param_Healthy_Float_Left = [Param_Healthy_Float_Left;extract_EMG(duration_HP4_float,mean_HP4_float,max_HP4_float,rms_HP4_float,coactivation_HP4_float)];
    Param_Healthy_Float_Left = [Param_Healthy_Float_Left;extract_EMG(duration_HP5_float,mean_HP5_float,max_HP5_float,rms_HP5_float,coactivation_HP5_float)];
    Param_Healthy_Float_Left = [Param_Healthy_Float_Left;extract_EMG(duration_HP6_float,mean_HP6_float,max_HP6_float,rms_HP6_float,coactivation_HP6_float)];
    Param_Healthy_Float_Left = [Param_Healthy_Float_Left;extract_EMG(duration_HP7_float,mean_HP7_float,max_HP7_float,rms_HP7_float,coactivation_HP7_float)];
    Param_Healthy_Float_Left = [Param_Healthy_Float_Left;extract_EMG(duration_HP8_float,mean_HP8_float,max_HP8_float,rms_HP8_float,coactivation_HP8_float)];
    Param_Healthy_Float_Left = [Param_Healthy_Float_Left;extract_EMG(duration_HP9_float,mean_HP9_float,max_HP9_float,rms_HP9_float,coactivation_HP9_float)];
    save([pwd,'/EMGParametersMatrix/Param_Healthy_Float_Left.mat'],'Param_Healthy_Float_Left');

    Param_Healthy_NoFloat_Left = [];
    Param_Healthy_NoFloat_Left = [Param_Healthy_NoFloat_Left;extract_EMG(duration_HP2_nofloat,mean_HP2_nofloat,max_HP2_nofloat,rms_HP2_nofloat,coactivation_HP2_nofloat)];
    Param_Healthy_NoFloat_Left = [Param_Healthy_NoFloat_Left;extract_EMG(duration_HP3_nofloat,mean_HP3_nofloat,max_HP3_nofloat,rms_HP3_nofloat,coactivation_HP3_nofloat)];
    Param_Healthy_NoFloat_Left = [Param_Healthy_NoFloat_Left;extract_EMG(duration_HP4_nofloat,mean_HP4_nofloat,max_HP4_nofloat,rms_HP4_nofloat,coactivation_HP4_nofloat)];
    Param_Healthy_NoFloat_Left = [Param_Healthy_NoFloat_Left;extract_EMG(duration_HP5_nofloat,mean_HP5_nofloat,max_HP5_nofloat,rms_HP5_nofloat,coactivation_HP5_nofloat)];
    Param_Healthy_NoFloat_Left = [Param_Healthy_NoFloat_Left;extract_EMG(duration_HP6_nofloat,mean_HP6_nofloat,max_HP6_nofloat,rms_HP6_nofloat,coactivation_HP6_nofloat)];
    Param_Healthy_NoFloat_Left = [Param_Healthy_NoFloat_Left;extract_EMG(duration_HP7_nofloat,mean_HP7_nofloat,max_HP7_nofloat,rms_HP7_nofloat,coactivation_HP7_nofloat)];
    Param_Healthy_NoFloat_Left = [Param_Healthy_NoFloat_Left;extract_EMG(duration_HP8_nofloat,mean_HP8_nofloat,max_HP8_nofloat,rms_HP8_nofloat,coactivation_HP8_nofloat)];
    Param_Healthy_NoFloat_Left = [Param_Healthy_NoFloat_Left;extract_EMG(duration_HP9_nofloat,mean_HP9_nofloat,max_HP9_nofloat,rms_HP9_nofloat,coactivation_HP9_nofloat)];
    save([pwd,'/EMGParametersMatrix/Param_Healthy_NoFloat_Left.mat'],'Param_Healthy_NoFloat_Left');
    
else
    
    Param_SCI_Float_Right = extract_EMG(duration_SCI_float,mean_SCI_float,max_SCI_float,rms_SCI_float,coactivation_SCI_float);
    save([pwd,'/EMGParametersMatrix/Param_SCI_Float_Right.mat'],'Param_SCI_Float_Right');
    Param_SCI_NoFloat_Right = extract_EMG(duration_SCI_nofloat,mean_SCI_nofloat,max_SCI_nofloat,rms_SCI_nofloat,coactivation_SCI_nofloat);
    save([pwd,'/EMGParametersMatrix/Param_SCI_NoFloat_Right.mat'],'Param_SCI_NoFloat_Right');

    Param_Healthy_Float_Right = [];
    Param_Healthy_Float_Right = [Param_Healthy_Float_Right;extract_EMG(duration_HP1_float,mean_HP1_float,max_HP1_float,rms_HP1_float,coactivation_HP1_float)];
    Param_Healthy_Float_Right = [Param_Healthy_Float_Right;extract_EMG(duration_HP3_float,mean_HP3_float,max_HP3_float,rms_HP3_float,coactivation_HP3_float)];
    Param_Healthy_Float_Right = [Param_Healthy_Float_Right;extract_EMG(duration_HP4_float,mean_HP4_float,max_HP4_float,rms_HP4_float,coactivation_HP4_float)];
    Param_Healthy_Float_Right = [Param_Healthy_Float_Right;extract_EMG(duration_HP5_float,mean_HP5_float,max_HP5_float,rms_HP5_float,coactivation_HP5_float)];
    Param_Healthy_Float_Right = [Param_Healthy_Float_Right;extract_EMG(duration_HP6_float,mean_HP6_float,max_HP6_float,rms_HP6_float,coactivation_HP6_float)];
    Param_Healthy_Float_Right = [Param_Healthy_Float_Right;extract_EMG(duration_HP7_float,mean_HP7_float,max_HP7_float,rms_HP7_float,coactivation_HP7_float)];
    Param_Healthy_Float_Right = [Param_Healthy_Float_Right;extract_EMG(duration_HP8_float,mean_HP8_float,max_HP8_float,rms_HP8_float,coactivation_HP8_float)];
    Param_Healthy_Float_Right = [Param_Healthy_Float_Right;extract_EMG(duration_HP9_float,mean_HP9_float,max_HP9_float,rms_HP9_float,coactivation_HP9_float)];
    save([pwd,'/EMGParametersMatrix/Param_Healthy_Float_Right.mat'],'Param_Healthy_Float_Right');

    Param_Healthy_NoFloat_Right = [];
    Param_Healthy_NoFloat_Right = [Param_Healthy_NoFloat_Right;extract_EMG(duration_HP2_nofloat,mean_HP2_nofloat,max_HP2_nofloat,rms_HP2_nofloat,coactivation_HP2_nofloat)];
    Param_Healthy_NoFloat_Right = [Param_Healthy_NoFloat_Right;extract_EMG(duration_HP3_nofloat,mean_HP3_nofloat,max_HP3_nofloat,rms_HP3_nofloat,coactivation_HP3_nofloat)];
    Param_Healthy_NoFloat_Right = [Param_Healthy_NoFloat_Right;extract_EMG(duration_HP4_nofloat,mean_HP4_nofloat,max_HP4_nofloat,rms_HP4_nofloat,coactivation_HP4_nofloat)];
    Param_Healthy_NoFloat_Right = [Param_Healthy_NoFloat_Right;extract_EMG(duration_HP5_nofloat,mean_HP5_nofloat,max_HP5_nofloat,rms_HP5_nofloat,coactivation_HP5_nofloat)];
    Param_Healthy_NoFloat_Right = [Param_Healthy_NoFloat_Right;extract_EMG(duration_HP6_nofloat,mean_HP6_nofloat,max_HP6_nofloat,rms_HP6_nofloat,coactivation_HP6_nofloat)];
    Param_Healthy_NoFloat_Right = [Param_Healthy_NoFloat_Right;extract_EMG(duration_HP7_nofloat,mean_HP7_nofloat,max_HP7_nofloat,rms_HP7_nofloat,coactivation_HP7_nofloat)];
    Param_Healthy_NoFloat_Right = [Param_Healthy_NoFloat_Right;extract_EMG(duration_HP8_nofloat,mean_HP8_nofloat,max_HP8_nofloat,rms_HP8_nofloat,coactivation_HP8_nofloat)];
    Param_Healthy_NoFloat_Right = [Param_Healthy_NoFloat_Right;extract_EMG(duration_HP9_nofloat,mean_HP9_nofloat,max_HP9_nofloat,rms_HP9_nofloat,coactivation_HP9_nofloat)];
    save([pwd,'/EMGParametersMatrix/Param_Healthy_NoFloat_Right.mat'],'Param_Healthy_NoFloat_Right');
    
end



save('parametersEMG.mat', 'Param_Healthy_Float_Left', 'Param_Healthy_Float_Right','Param_Healthy_NoFloat_Left', 'Param_Healthy_NoFloat_Right','Param_SCI_Float_Left', 'Param_SCI_Float_Right','Param_SCI_NoFloat_Left', 'Param_SCI_NoFloat_Right');



