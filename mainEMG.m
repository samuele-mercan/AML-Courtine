
%% EMG Loading 

% SCI Patients 
file = fullfile([pwd,'/Exercise - Material - SCI Subject Raw/FLOAT_NO_CRUTCHES_NEW/MAT'],'FLOAT_NO_CRUTCHES_NEW.mat');
data_float = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject Raw/NO_FLOAT_CRUTCHES_NEW/MAT'],'NO_FLOAT_CRUTCHES_NEW.mat');
data_no_float = load(file);

% No float - Healthy Subject 
file = fullfile([pwd,'/Healthy Recordings Raw/Subject1_2018/NO_FLOAT'],'S1_NO_FLOAT.mat');
data_healthy1 = load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject2_2018/NO_FLOAT'],'S2_NO_FLOAT.mat');
data_healthy2 = load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject3_2018/NO_FLOAT'],'S3_NO_FLOAT.mat');
data_healthy3 = load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject4_2018/NO_FLOAT'],'S4_NO_FLOAT.mat');
data_healthy4 = load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject5_2018/NO_FLOAT'],'S5_NO_FLOAT.mat');
data_healthy5 = load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject6_2018/NO_FLOAT'],'S6_NO_FLOAT.mat');
data_healthy6 = load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject1_2019/NO_FLOAT'],'S1_NO_FLOAT.mat');
data_healthy7 = load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject2_2019/NO_FLOAT'],'S2_NO_FLOAT.mat');
data_healthy8 = load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject3_2019/NO_FLOAT'],'S3_NO_FLOAT.mat');
data_healthy9 = load(file);

% Float - Healthy Subject
file = fullfile([pwd,'/Healthy Recordings Raw/Subject1_2018/FLOAT'],'S1_FLOAT.mat');
data_healthy10 = load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject2_2018/FLOAT'],'S2_FLOAT.mat');
data_healthy11 = load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject3_2018/FLOAT'],'S3_FLOAT.mat');
data_healthy12= load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject4_2018/FLOAT'],'S4_FLOAT.mat');
data_healthy13= load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject5_2018/FLOAT'],'S5_FLOAT.mat');
data_healthy14= load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject6_2018/FLOAT'],'S6_FLOAT.mat');
data_healthy15= load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject1_2019/FLOAT'],'S1_FLOAT.mat');
data_healthy16= load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject2_2019/FLOAT'],'S2_FLOAT.mat');
data_healthy17= load(file);
file = fullfile([pwd,'/Healthy Recordings Raw/Subject3_2019/FLOAT'],'S3_FLOAT.mat');
data_healthy18= load(file);

%% EMG Denoising & Saving

FLOAT_NO_CRUTCHES_NEW = denoising_EMG(data_float.FLOAT_NO_CRUTCHES_NEW,10);
save([pwd,'/Exercise - Material - SCI Subject Denoised/FLOAT_NO_CRUTCHES_NEW/MAT/FLOAT_NO_CRUTCHES_NEW.mat'],'FLOAT_NO_CRUTCHES_NEW')
NO_FLOAT_CRUTCHES_NEW = denoising_EMG(data_no_float.NO_FLOAT_CRUTCHES_NEW,10);
save([pwd,'/Exercise - Material - SCI Subject Denoised/NO_FLOAT_CRUTCHES_NEW/MAT/NO_FLOAT_CRUTCHES_NEW.mat'],'NO_FLOAT_CRUTCHES_NEW')

S1_NO_FLOAT = denoising_EMG(data_healthy1.S1_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject1_2018/NO_FLOAT/S1_NO_FLOAT.mat'],'S1_NO_FLOAT');
S2_NO_FLOAT = denoising_EMG(data_healthy2.S2_NO_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject2_2018/NO_FLOAT/S2_NO_FLOAT.mat'],'S2_NO_FLOAT');
S3_NO_FLOAT = denoising_EMG(data_healthy3.S3_NO_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject3_2018/NO_FLOAT/S3_NO_FLOAT.mat'],'S3_NO_FLOAT');
S4_NO_FLOAT = denoising_EMG(data_healthy4.S4_NO_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject4_2018/NO_FLOAT/S4_NO_FLOAT.mat'],'S4_NO_FLOAT');
S5_NO_FLOAT = denoising_EMG(data_healthy5.S5_NO_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject5_2018/NO_FLOAT/S5_NO_FLOAT.mat'],'S5_NO_FLOAT');
S6_NO_FLOAT = denoising_EMG(data_healthy6.S6_NO_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject6_2018/NO_FLOAT/S6_NO_FLOAT.mat'],'S6_NO_FLOAT');
S1_NO_FLOAT = denoising_EMG(data_healthy7.S1_NO_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject1_2018/NO_FLOAT/S1_NO_FLOAT.mat'],'S1_NO_FLOAT');
S2_NO_FLOAT = denoising_EMG(data_healthy8.S2_NO_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject2_2018/NO_FLOAT/S2_NO_FLOAT.mat'],'S2_NO_FLOAT');
S3_NO_FLOAT = denoising_EMG(data_healthy9.S3_NO_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject3_2018/NO_FLOAT/S3_NO_FLOAT.mat'],'S3_NO_FLOAT');

S1_FLOAT = denoising_EMG(data_healthy10.S1_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject1_2018/FLOAT/S1_FLOAT.mat'],'S1_FLOAT');
S2_FLOAT = denoising_EMG(data_healthy11.S2_NO_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject2_2018/FLOAT/S2_FLOAT.mat'],'S2_FLOAT');
S3_FLOAT = denoising_EMG(data_healthy12.S3_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject3_2018/FLOAT/S3_FLOAT.mat'],'S3_FLOAT');
S4_FLOAT = denoising_EMG(data_healthy13.S4_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject4_2018/FLOAT/S4_FLOAT.mat'],'S4_FLOAT');
S5_FLOAT = denoising_EMG(data_healthy14.S5_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject5_2018/FLOAT/S5_FLOAT.mat'],'S5_FLOAT');
S6_FLOAT = denoising_EMG(data_healthy15.S6_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject6_2018/FLOAT/S6_FLOAT.mat'],'S6_FLOAT');
S1_FLOAT = denoising_EMG(data_healthy16.S1_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject1_2018/FLOAT/S1_FLOAT.mat'],'S1_FLOAT');
S2_FLOAT = denoising_EMG(data_healthy17.S2_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject2_2018/FLOAT/S2_FLOAT.mat'],'S2_FLOAT');
S3_FLOAT = denoising_EMG(data_healthy18.S3_FLOAT,10);
save([pwd,'/Healthy Recordings Denoised/Subject3_2018/FLOAT/S3_FLOAT.mat'],'S3_FLOAT');

%% Getting gait cycles
[~, noFloat_FO_left_SCI, ~, noFloat_FO_right_SCI,~, Float_FO_left_SCI,~, Float_FO_right_SCI] = HealthySegmentation([pwd,'/Exercise - Material - SCI Subject Denoised/FLOAT_NO_CRUTCHES_NEW/MAT/FLOAT_NO_CRUTCHES_NEW.mat'], ...
    [pwd,'/Exercise - Material - SCI Subject Denoised/NO_FLOAT_CRUTCHES_NEW/MAT/NO_FLOAT_CRUTCHES_NEW.mat']);
[~, Float_FO_left_HR1, ~, noFloat_FO_right_HR1,~, Float_FO_left_HR1,~, Float_FO_right_HR1] = HealthySegmentation([pwd,'/Healthy Recordings Denoised/Subject1_2018/FLOAT/S1_FLOAT.mat'], ...
    [pwd,'/Healthy Recordings Denoised/Subject1_2018/NO_FLOAT/S1_NO_FLOAT.mat']);
[~, Float_FO_left_HR2, ~, noFloat_FO_right_HR2,~, Float_FO_left_HR2,~, Float_FO_right_HR2] = HealthySegmentation([pwd,'/Healthy Recordings Denoised/Subject2_2018/FLOAT/S2_FLOAT.mat'], ...
    [pwd,'/Healthy Recordings Denoised/Subject2_2018/NO_FLOAT/S2_NO_FLOAT.mat']);
[~, Float_FO_left_HR3, ~, noFloat_FO_right_HR3,~, Float_FO_left_HR3,~, Float_FO_right_HR3] = HealthySegmentation([pwd,'/Healthy Recordings Denoised/Subject3_2018/FLOAT/S3_FLOAT.mat'], ...
    [pwd,'/Healthy Recordings Denoised/Subject3_2018/NO_FLOAT/S3_NO_FLOAT.mat']);
[~, Float_FO_left_HR4, ~, noFloat_FO_right_HR4,~, Float_FO_left_HR4,~, Float_FO_right_HR4] = HealthySegmentation([pwd,'/Healthy Recordings Denoised/Subject4_2018/FLOAT/S4_FLOAT.mat'], ...
    [pwd,'/Healthy Recordings Denoised/Subject4_2018/NO_FLOAT/S4_NO_FLOAT.mat']);
[~, Float_FO_left_HR5, ~, noFloat_FO_right_HR5,~, Float_FO_left_HR5,~, Float_FO_right_HR5] = HealthySegmentation([pwd,'/Healthy Recordings Denoised/Subject5_2018/FLOAT/S5_FLOAT.mat'], ...
    [pwd,'/Healthy Recordings Denoised/Subject5_2018/NO_FLOAT/S5_NO_FLOAT.mat']);
[~, Float_FO_left_HR6, ~, noFloat_FO_right_HR6,~, Float_FO_left_HR6,~, Float_FO_right_HR6] = HealthySegmentation([pwd,'/Healthy Recordings Denoised/Subject6_2018/FLOAT/S6_FLOAT.mat'], ...
    [pwd,'/Healthy Recordings Denoised/Subject6_2018/NO_FLOAT/S6_NO_FLOAT.mat']);
[~, Float_FO_left_HR1, ~, noFloat_FO_right_HR1,~, Float_FO_left_HR1,~, Float_FO_right_HR1] = HealthySegmentation([pwd,'/Healthy Recordings Denoised/Subject1_2019/FLOAT/S1_FLOAT.mat'], ...
    [pwd,'/Healthy Recordings Denoised/Subject1_2019/NO_FLOAT/S1_NO_FLOAT.mat']);
[~, Float_FO_left_HR2, ~, noFloat_FO_right_HR2,~, Float_FO_left_HR2,~, Float_FO_right_HR2] = HealthySegmentation([pwd,'/Healthy Recordings Denoised/Subject2_2019/FLOAT/S2_FLOAT.mat'], ...
    [pwd,'/Healthy Recordings Denoised/Subject2_2019/NO_FLOAT/S2_NO_FLOAT.mat']);
[~, Float_FO_left_HR3, ~, noFloat_FO_right_HR3,~, Float_FO_left_HR3,~, Float_FO_right_HR3] = HealthySegmentation([pwd,'/Healthy Recordings Denoised/Subject3_2019/FLOAT/S3_FLOAT.mat'], ...
    [pwd,'/Healthy Recordings Denoised/Subject3_2019/NO_FLOAT/S3_NO_FLOAT.mat']);

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



% [GaitCyclesFloat1,GaitCyclesNoFloat1] = HealthySegmentation1('Healthy Recordings/Subject1_2018/FLOAT/S1_FLOAT.mat', ...
%     'Healthy Recordings/Subject1_2018/NO_FLOAT/S1_NO_FLOAT.mat',leftFoot);
% 
% [GaitCyclesFloat2,GaitCyclesNoFloat2] = HealthySegmentation1('Healthy Recordings/Subject2_2018/FLOAT/S2_FLOAT.mat', ...
%     'Healthy Recordings/Subject2_2018/NO_FLOAT/S2_NO_FLOAT.mat',leftFoot);
% 
% [GaitCyclesFloat3,GaitCyclesNoFloat3] = HealthySegmentation1('Healthy Recordings/Subject3_2018/FLOAT/S3_FLOAT.mat', ...
%     'Healthy Recordings/Subject3_2018/NO_FLOAT/S3_NO_FLOAT.mat',leftFoot);
% 
% [GaitCyclesFloat4,GaitCyclesNoFloat4] = HealthySegmentation1('Healthy Recordings/Subject4_2018/FLOAT/S4_FLOAT.mat', ...
%     'Healthy Recordings/Subject4_2018/NO_FLOAT/S4_NO_FLOAT.mat',leftFoot);
% 
% [GaitCyclesFloat5,GaitCyclesNoFloat5] = HealthySegmentation1('Healthy Recordings/Subject5_2018/FLOAT/S5_FLOAT.mat', ...
%     'Healthy Recordings/Subject5_2018/NO_FLOAT/S5_NO_FLOAT.mat',leftFoot);
% 
% [GaitCyclesFloat6,GaitCyclesNoFloat6] = HealthySegmentation1('Healthy Recordings/Subject6_2018/FLOAT/S6_FLOAT.mat', ...
%     'Healthy Recordings/Subject6_2018/NO_FLOAT/S6_NO_FLOAT.mat',leftFoot);
% 
% [GaitCyclesFloat7,GaitCyclesNoFloat7] = HealthySegmentation1('Healthy Recordings/Subject1_2019/FLOAT/S1_FLOAT.mat', ...
%     'Healthy Recordings/Subject1_2019/NO_FLOAT/S1_NO_FLOAT.mat',leftFoot);
% 
% [GaitCyclesFloat8,GaitCyclesNoFloat8] = HealthySegmentation1('Healthy Recordings/Subject2_2019/FLOAT/S2_FLOAT.mat', ...
%     'Healthy Recordings/Subject2_2019/NO_FLOAT/S2_NO_FLOAT.mat',leftFoot);
% 
% [GaitCyclesFloat9,GaitCyclesNoFloat9] = HealthySegmentation1('Healthy Recordings/Subject3_2019/FLOAT/S3_FLOAT.mat', ...
%     'Healthy Recordings/Subject3_2019/NO_FLOAT/S3_NO_FLOAT.mat',leftFoot);

clear leftFoot
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
[onset_SCI_float1,offset_SCI_float1]=detection_burst(env_SCI_float1);
[onset_SCI_float2,offset_SCI_float2]=detection_burst(env_SCI_float2);

% HP No Float

[onset_SCI_nofloat1,offset_SCI_nofloat1]=detection_burst(env_SCI_nofloat1);
[onset_SCI_nofloat2,offset_SCI_nofloat2]=detection_burst(env_SCI_nofloat2);

[onset_HP1_nofloat1,offset_HP1_nofloat1]=detection_burst(env_HP1_nofloat1);
[onset_HP1_nofloat2,offset_HP1_nofloat2]=detection_burst(env_HP1_nofloat2);

[onset_HP2_nofloat1,offset_HP2_nofloat1]=detection_burst(env_HP2_nofloat1);
[onset_HP2_nofloat2,offset_HP2_nofloat2]=detection_burst(env_HP2_nofloat2);

[onset_HP3_nofloat1,offset_HP3_nofloat1]=detection_burst(env_HP3_nofloat1);
[onset_HP3_nofloat2,offset_HP3_nofloat2]=detection_burst(env_HP3_nofloat2);

[onset_HP4_nofloat1,offset_HP4_nofloat1]=detection_burst(env_HP4_nofloat1);
[onset_HP4_nofloat2,offset_HP4_nofloat2]=detection_burst(env_HP4_nofloat2);

[onset_HP5_nofloat1,offset_HP5_nofloat1]=detection_burst(env_HP5_nofloat1);
[onset_HP5_nofloat2,offset_HP5_nofloat2]=detection_burst(env_HP5_nofloat2);

[onset_HP6_nofloat1,offset_HP6_nofloat1]=detection_burst(env_HP6_nofloat1);
[onset_HP6_nofloat2,offset_HP6_nofloat2]=detection_burst(env_HP6_nofloat2);

[onset_HP7_nofloat1,offset_HP7_nofloat1]=detection_burst(env_HP7_nofloat1);
[onset_HP7_nofloat2,offset_HP7_nofloat2]=detection_burst(env_HP7_nofloat2);

[onset_HP8_nofloat1,offset_HP8_nofloat1]=detection_burst(env_HP8_nofloat1);
[onset_HP8_nofloat2,offset_HP8_nofloat2]=detection_burst(env_HP8_nofloat2);

[onset_HP9_nofloat1,offset_HP9_nofloat1]=detection_burst(env_HP9_nofloat1);
[onset_HP9_nofloat2,offset_HP9_nofloat2]=detection_burst(env_HP9_nofloat2);

% HP Float 

[onset_SCI_float1,offset_SCI_float1]=detection_burst(env_SCI_float1);
[onset_SCI_float2,offset_SCI_float2]=detection_burst(env_SCI_float2);

[onset_HP1_float1,offset_HP1_float1]=detection_burst(env_HP1_float1);
[onset_HP1_float2,offset_HP1_float2]=detection_burst(env_HP1_float2);

[onset_HP2_float1,offset_HP2_float1]=detection_burst(env_HP2_float1);
[onset_HP2_float2,offset_HP2_float2]=detection_burst(env_HP2_float2);

[onset_HP3_float1,offset_HP3_float1]=detection_burst(env_HP3_float1);
[onset_HP3_float2,offset_HP3_float2]=detection_burst(env_HP3_float2);

[onset_HP4_float1,offset_HP4_float1]=detection_burst(env_HP4_float1);
[onset_HP4_float2,offset_HP4_float2]=detection_burst(env_HP4_float2);

[onset_HP5_float1,offset_HP5_float1]=detection_burst(env_HP5_float1);
[onset_HP5_float2,offset_HP5_float2]=detection_burst(env_HP5_float2);

[onset_HP6_float1,offset_HP6_float1]=detection_burst(env_HP6_float1);
[onset_HP6_float2,offset_HP6_float2]=detection_burst(env_HP6_float2);

[onset_HP7_float1,offset_HP7_float1]=detection_burst(env_HP7_float1);
[onset_HP7_float2,offset_HP7_float2]=detection_burst(env_HP7_float2);

[onset_HP8_float1,offset_HP8_float1]=detection_burst(env_HP8_float1);
[onset_HP8_float2,offset_HP8_float2]=detection_burst(env_HP8_float2);

[onset_HP9_float1,offset_HP9_float1]=detection_burst(env_HP9_float1);
[onset_HP9_float2,offset_HP9_float2]=detection_burst(env_HP9_float2);

clear env_HP1_float1 env_HP1_float2 env_HP2_float1 env_HP2_float2 env_HP3_float1 env_HP3_float2 ...
     env_HP4_float1 env_HP4_float2 env_HP5_float1 env_HP5_float2 env_HP6_float1 env_HP6_float2 ...
     env_HP7_float1  env_HP7_float2  env_HP8_float1  env_HP8_float2  env_HP9_float1 env_HP9_float2 ...
     env_HP1_nofloat1 env_HP1_nofloat2 env_HP2_nofloat1 env_HP2_nofloat2 env_HP3_nofloat1 env_HP3_nofloat2 ...
     env_HP4_nofloat1 env_HP4_nofloat2 env_HP5_nofloat1 env_HP5_nofloat2 env_HP6_nofloat1 env_HP6_nofloat2 ...
     env_HP7_nofloat1  env_HP7_nofloat2  env_HP8_nofloat1  env_HP8_nofloat2  env_HP9_nofloat1 env_HP9_nofloat2 ...
     env_SCI_float1 env_SCI_nofloat1 env_SCI_float2 env_SCI_nofloat2  ...
     onset_SCI_float2 offset_SCI_float2 onset_SIC_nofloat2 offset_SCI_nofloat2 onset_HP1_float2 offset_HP1_float2 ...
     onset_HP2_float2 offset_HP2_float2 onset_HP3_float2 offset_HP3_float2 onset_HP4_float2 offset_HP4_float2 ...
     onset_HP5_float2 offset_HP5_float2 onset_HP6_float2 offset_HP6_float2 onset_HP7_float2 offset_HP7_float2 ...
     onset_HP8_float2 offset_HP8_float2 onset_HP9_float2 offset_HP9_float2 onset_HP1_nofloat2 offset_HP1_nofloat2 ...
     onset_HP2_nofloat2 offset_HP2_nofloat2 onset_HP3_nofloat2 offset_HP3_nofloat2 onset_HP4_nofloat2 offset_HP4_nofloat2 ...
     onset_HP5_nofloat2 offset_HP5_nofloat2 onset_HP6_nofloat2 offset_HP6_nofloat2 onset_HP7_nofloat2 offset_HP7_nofloat2 ...
     onset_HP8_nofloat2 offset_HP8_nofloat2 onset_HP9_nofloat2 offset_HP9_nofloat2 env_HP1_float2 env_HP1_nofloat2 ...
     env_HP2_float2 env_HP2_nofloat2 env_HP3_float2 env_HP3_nofloat2 env_HP4_float2 env_HP4_nofloat2 env_HP5_float2 ...
     env_HP5_nofloat2 env_HP6_float2 env_HP6_nofloat2 env_HP7_float2 env_HP7_nofloat2 env_HP8_float2 env_HP8_nofloat2 ...
     env_HP1_float9 env_HP1_nofloat9
     
%% By Hand EMG Onset & Offset Detection - NOT CHANGED YET

onset_SCI_float = hand_detection(SCI_float,denoised_SCI_float);
onset_SCI_no_float = hand_detection(SCI_no_float,denoised_SCI_no_float);
onset_HP_no_float_1 = hand_detection(HP_no_float1,denoised_HO_no_float1);
onset_HP_no_float_2 = hand_detection(HP_no_float2,denoised_HO_no_float2);
onset_HP_no_float_3 = hand_detection(HP_no_float3,denoised_HO_no_float3);

offset_SCI_float = hand_detection(SCI_float,denoised_SCI_float);
offset_SCI_no_float = hand_detection(SCI_no_float,denoised_SCI_no_float);
offset_HP_no_float_1 = hand_detection(HP_no_float1,denoised_HO_no_float1);
offset_HP_no_float_2 = hand_detection(HP_no_float2,denoised_HO_no_float2);
offset_HP_no_float_3 = hand_detection(HP_no_float3,denoised_HO_no_float3);

%% Clean Onset/Offsets

% SCI
offset_SCI_float = clean_offsets(onset_SCI_float1,offset_SCI_float1);
offset_SCI_nofloat = clean_offsets(onset_SCI_nofloat1,offset_SCI_nofloat1);

% HP Float
[onset_HP1_float1,offset_HP1_float1] = clean_offsets(onset_HP1_float1,offset_HP1_float1);
[onset_HP2_float1,offset_HP2_float1] = clean_offsets(onset_HP2_float1,offset_HP2_float1);
[onset_HP3_float1,offset_HP3_float1] = clean_offsets(onset_HP3_float1,offset_HP3_float1);
[onset_HP4_float1,offset_HP4_float1] = clean_offsets(onset_HP4_float1,offset_HP4_float1);
[onset_HP5_float1,offset_HP5_float1] = clean_offsets(onset_HP5_float1,offset_HP5_float1);
[onset_HP6_float1,offset_HP6_float1] = clean_offsets(onset_HP6_float1,offset_HP6_float1);
[onset_HP7_float1,offset_HP7_float1] = clean_offsets(onset_HP7_float1,offset_HP7_float1);
[onset_HP8_float1,offset_HP8_float1] = clean_offsets(onset_HP8_float1,offset_HP8_float1);
[onset_HP9_float1,offset_HP9_float1] = clean_offsets(onset_HP9_float1,offset_HP9_float1);

% HP no Float
[onset_HP1_nofloat1, offset_HP1_nofloat1] = clean_offsets(onset_HP1_nofloat1,offset_HP1_nofloat1);
[onset_HP2_nofloat1, offset_HP2_nofloat1] = clean_offsets(onset_HP2_nofloat1,offset_HP2_nofloat1);
[onset_HP3_nofloat1, offset_HP3_nofloat1] = clean_offsets(onset_HP3_nofloat1,offset_HP3_nofloat1);
[onset_HP4_nofloat1, offset_HP4_nofloat1] = clean_offsets(onset_HP4_nofloat1,offset_HP4_nofloat1);
[onset_HP5_nofloat1, offset_HP5_nofloat1] = clean_offsets(onset_HP5_nofloat1,offset_HP5_nofloat1);
[onset_HP6_nofloat1, offset_HP6_nofloat1] = clean_offsets(onset_HP6_nofloat1,offset_HP6_nofloat1);
[onset_HP7_nofloat1, offset_HP7_nofloat1] = clean_offsets(onset_HP7_nofloat1,offset_HP7_nofloat1);
[onset_HP8_nofloat1, offset_HP8_nofloat1] = clean_offsets(onset_HP8_nofloat1,offset_HP8_nofloat1);
[onset_HP9_nofloat1, offset_HP9_nofloat1] = clean_offsets(onset_HP9_nofloat1,offset_HP9_nofloat1);

%% Burst Duration - Still problem of detection 

% SCI
duration_SCI_float = duration_EMG(onset_SCI_float1,offset_SCI_float1); 
duration_SCI_nofloat = duration_EMG(onset_SCI_nofloat1,offset_SCI_nofloat1); 

% HP Float
duration_HP1_float = duration_EMG(onset_HP1_float1,offset_HP1_float1); 
duration_HP2_float = duration_EMG(onset_HP2_float1,offset_HP2_float1); 
duration_HP3_float = duration_EMG(onset_HP3_float1,offset_HP3_float1); 
duration_HP4_float = duration_EMG(onset_HP4_float1,offset_HP4_float1); 
duration_HP5_float = duration_EMG(onset_HP5_float1,offset_HP5_float1); 
duration_HP6_float = duration_EMG(onset_HP6_float1,offset_HP6_float1); 
duration_HP7_float = duration_EMG(onset_HP7_float1,offset_HP7_float1); 
duration_HP8_float = duration_EMG(onset_HP8_float1,offset_HP8_float1); 
duration_HP9_float = duration_EMG(onset_HP9_float1,offset_HP9_float1); 

% HP no float 
duration_HP1_nofloat = duration_EMG(onset_HP1_nofloat1,offset_HP1_nofloat1); 
duration_HP2_nofloat = duration_EMG(onset_HP2_nofloat1,offset_HP2_nofloat1); 
duration_HP3_nofloat = duration_EMG(onset_HP3_nofloat1,offset_HP3_nofloat1); 
duration_HP4_nofloat = duration_EMG(onset_HP4_nofloat1,offset_HP4_nofloat1); 
duration_HP5_nofloat = duration_EMG(onset_HP5_nofloat1,offset_HP5_nofloat1); 
duration_HP6_nofloat = duration_EMG(onset_HP6_nofloat1,offset_HP6_nofloat1); 
duration_HP7_nofloat = duration_EMG(onset_HP7_nofloat1,offset_HP7_nofloat1); 
duration_HP8_nofloat = duration_EMG(onset_HP8_nofloat1,offset_HP8_nofloat1); 
duration_HP9_nofloat = duration_EMG(onset_HP9_nofloat1,offset_HP9_nofloat1); 

%% Max activation 

% SCI
max_SCI_float = max_EMG(onset_SCI_float1,offset_SCI_float1,SCI_GaitCycles_Float); 
max_SCI_nofloat = max_EMG(onset_SCI_nofloat1,offset_SCI_nofloat1,SCI_GaitCycles_noFloat); 

% HP Float
max_HP1_float = max_EMG(onset_HP1_float1,offset_HP1_float1,GaitCyclesFloat1); 
max_HP2_float = max_EMG(onset_HP2_float1,offset_HP2_float1,GaitCyclesFloat2); 
max_HP3_float = max_EMG(onset_HP3_float1,offset_HP3_float1,GaitCyclesFloat3); 
max_HP4_float = max_EMG(onset_HP4_float1,offset_HP4_float1,GaitCyclesFloat4); 
max_HP5_float = max_EMG(onset_HP5_float1,offset_HP5_float1,GaitCyclesFloat5); 
max_HP6_float = max_EMG(onset_HP6_float1,offset_HP6_float1,GaitCyclesFloat6); 
max_HP7_float = max_EMG(onset_HP7_float1,offset_HP7_float1,GaitCyclesFloat7); 
max_HP8_float = max_EMG(onset_HP8_float1,offset_HP8_float1,GaitCyclesFloat8); 
max_HP9_float = max_EMG(onset_HP9_float1,offset_HP9_float1,GaitCyclesFloat9); 

% HP no float 
max_HP1_nofloat = max_EMG(onset_HP1_nofloat1,offset_HP1_nofloat1,GaitCyclesNoFloat1); 
max_HP2_nofloat = max_EMG(onset_HP2_nofloat1,offset_HP2_nofloat1,GaitCyclesNoFloat2); 
max_HP3_nofloat = max_EMG(onset_HP3_nofloat1,offset_HP3_nofloat1,GaitCyclesNoFloat3); 
max_HP4_nofloat = max_EMG(onset_HP4_nofloat1,offset_HP4_nofloat1,GaitCyclesNoFloat4); 
max_HP5_nofloat = max_EMG(onset_HP5_nofloat1,offset_HP5_nofloat1,GaitCyclesNoFloat5); 
max_HP6_nofloat = max_EMG(onset_HP6_nofloat1,offset_HP6_nofloat1,GaitCyclesNoFloat6); 
max_HP7_nofloat = max_EMG(onset_HP7_nofloat1,offset_HP7_nofloat1,GaitCyclesNoFloat7); 
max_HP8_nofloat = max_EMG(onset_HP8_nofloat1,offset_HP8_nofloat1,GaitCyclesNoFloat8); 
max_HP9_nofloat = max_EMG(onset_HP9_nofloat1,offset_HP9_nofloat1,GaitCyclesNoFloat9); 

%% Mean activation 
% SCI
mean_SCI_float = mean_EMG(onset_SCI_float1,offset_SCI_float1,SCI_GaitCycles_Float); 
mean_SCI_nofloat = mean_EMG(onset_SCI_nofloat1,offset_SCI_nofloat1,SCI_GaitCycles_noFloat); 

% HP Float
mean_HP1_float = mean_EMG(onset_HP1_float1,offset_HP1_float1,GaitCyclesFloat1); 
mean_HP2_float = mean_EMG(onset_HP2_float1,offset_HP2_float1,GaitCyclesFloat2); 
mean_HP3_float = mean_EMG(onset_HP3_float1,offset_HP3_float1,GaitCyclesFloat3); 
mean_HP4_float = mean_EMG(onset_HP4_float1,offset_HP4_float1,GaitCyclesFloat4); 
mean_HP5_float = mean_EMG(onset_HP5_float1,offset_HP5_float1,GaitCyclesFloat5); 
mean_HP6_float = mean_EMG(onset_HP6_float1,offset_HP6_float1,GaitCyclesFloat6); 
mean_HP7_float = mean_EMG(onset_HP7_float1,offset_HP7_float1,GaitCyclesFloat7); 
mean_HP8_float = mean_EMG(onset_HP8_float1,offset_HP8_float1,GaitCyclesFloat8); 
mean_HP9_float = mean_EMG(onset_HP9_float1,offset_HP9_float1,GaitCyclesFloat9); 

% HP no float 
mean_HP1_nofloat = mean_EMG(onset_HP1_nofloat1,offset_HP1_nofloat1,GaitCyclesNoFloat1); 
mean_HP2_nofloat = mean_EMG(onset_HP2_nofloat1,offset_HP2_nofloat1,GaitCyclesNoFloat2); 
mean_HP3_nofloat = mean_EMG(onset_HP3_nofloat1,offset_HP3_nofloat1,GaitCyclesNoFloat3); 
mean_HP4_nofloat = mean_EMG(onset_HP4_nofloat1,offset_HP4_nofloat1,GaitCyclesNoFloat4); 
mean_HP5_nofloat = mean_EMG(onset_HP5_nofloat1,offset_HP5_nofloat1,GaitCyclesNoFloat5); 
mean_HP6_nofloat = mean_EMG(onset_HP6_nofloat1,offset_HP6_nofloat1,GaitCyclesNoFloat6); 
mean_HP7_nofloat = mean_EMG(onset_HP7_nofloat1,offset_HP7_nofloat1,GaitCyclesNoFloat7); 
mean_HP8_nofloat = mean_EMG(onset_HP8_nofloat1,offset_HP8_nofloat1,GaitCyclesNoFloat8); 
mean_HP9_nofloat = mean_EMG(onset_HP9_nofloat1,offset_HP9_nofloat1,GaitCyclesNoFloat9); 
%% Coactivation Percentage
coactivation = arrayfun(@(x,y) arrayfun(@(z,a) rms(z(a(1):a(2))),x,y), denoised, sets);

%% RMS 
% SCI
rms_SCI_float = rms_EMG(onset_SCI_float1,offset_SCI_float1,SCI_GaitCycles_Float); 
rms_SCI_nofloat = rms_EMG(onset_SCI_nofloat1,offset_SCI_nofloat1,SCI_GaitCycles_noFloat); 

% HP Float
rms_HP1_float = rms_EMG(onset_HP1_float1,offset_HP1_float1,GaitCyclesFloat1); 
rms_HP2_float = rms_EMG(onset_HP2_float1,offset_HP2_float1,GaitCyclesFloat2); 
rms_HP3_float = rms_EMG(onset_HP3_float1,offset_HP3_float1,GaitCyclesFloat3); 
rms_HP4_float = rms_EMG(onset_HP4_float1,offset_HP4_float1,GaitCyclesFloat4); 
rms_HP5_float = rms_EMG(onset_HP5_float1,offset_HP5_float1,GaitCyclesFloat5); 
rms_HP6_float = rms_EMG(onset_HP6_float1,offset_HP6_float1,GaitCyclesFloat6); 
rms_HP7_float = rms_EMG(onset_HP7_float1,offset_HP7_float1,GaitCyclesFloat7); 
rms_HP8_float = rms_EMG(onset_HP8_float1,offset_HP8_float1,GaitCyclesFloat8); 
rms_HP9_float = rms_EMG(onset_HP9_float1,offset_HP9_float1,GaitCyclesFloat9); 

% HP no float 
rms_HP1_nofloat = rms_EMG(onset_HP1_nofloat1,offset_HP1_nofloat1,GaitCyclesNoFloat1); 
rms_HP2_nofloat = rms_EMG(onset_HP2_nofloat1,offset_HP2_nofloat1,GaitCyclesNoFloat2); 
rms_HP3_nofloat = rms_EMG(onset_HP3_nofloat1,offset_HP3_nofloat1,GaitCyclesNoFloat3); 
rms_HP4_nofloat = rms_EMG(onset_HP4_nofloat1,offset_HP4_nofloat1,GaitCyclesNoFloat4); 
rms_HP5_nofloat = rms_EMG(onset_HP5_nofloat1,offset_HP5_nofloat1,GaitCyclesNoFloat5); 
rms_HP6_nofloat = rms_EMG(onset_HP6_nofloat1,offset_HP6_nofloat1,GaitCyclesNoFloat6); 
rms_HP7_nofloat = rms_EMG(onset_HP7_nofloat1,offset_HP7_nofloat1,GaitCyclesNoFloat7); 
rms_HP8_nofloat = rms_EMG(onset_HP8_nofloat1,offset_HP8_nofloat1,GaitCyclesNoFloat8); 
rms_HP9_nofloat = rms_EMG(onset_HP9_nofloat1,offset_HP9_nofloat1,GaitCyclesNoFloat9); 





