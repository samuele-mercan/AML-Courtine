
%% EMG Loading 
file = fullfile([pwd,'/Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES_NEW/MAT'],'FLOAT_NO_CRUTCHES_NEW.mat');
data_float = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES_NEW/MAT'],'NO_FLOAT_CRUTCHES_NEW.mat');
data_no_float = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject5/NO_FLOAT'],'S5_NO_FLOAT.mat');
data_healthy = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject4/NO_FLOAT'],'S4_NO_FLOAT.mat');
data_healthy2 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject6/NO_FLOAT'],'S6_NO_FLOAT.mat');
data_healthy3 = load(file);


SCI_float.T1 = data_float.FLOAT_NO_CRUTCHES_NEW.T_01.Raw.EMG;
SCI_float.T2 = data_float.FLOAT_NO_CRUTCHES_NEW.T_02.Raw.EMG;
SCI_float.T3 = data_float.FLOAT_NO_CRUTCHES_NEW.T_03.Raw.EMG;

SCI_no_float.T1 = data_no_float.NO_FLOAT_CRUTCHES_NEW.T_01.Raw.EMG;
SCI_no_float.T2 = data_no_float.NO_FLOAT_CRUTCHES_NEW.T_02.Raw.EMG;
SCI_no_float.T3 = data_no_float.NO_FLOAT_CRUTCHES_NEW.T_03.Raw.EMG;

HP_no_float1.T1 = data_healthy.S5_NO_FLOAT.T_01.Raw.EMG;
HP_no_float1.T2 = data_healthy.S5_NO_FLOAT.T_02.Raw.EMG;
HP_no_float1.T3 = data_healthy.S5_NO_FLOAT.T_03.Raw.EMG;

HP_no_float2.T1 = data_healthy2.S4_NO_FLOAT.T_01.Raw.EMG;
HP_no_float2.T2 = data_healthy2.S4_NO_FLOAT.T_02.Raw.EMG;
HP_no_float2.T3 = data_healthy2.S4_NO_FLOAT.T_03.Raw.EMG;

HP_no_float3.T1 = data_healthy3.S6_NO_FLOAT.T_01.Raw.EMG;
HP_no_float3.T2 = data_healthy3.S6_NO_FLOAT.T_02.Raw.EMG;
HP_no_float3.T3 = data_healthy3.S6_NO_FLOAT.T_03.Raw.EMG;

clear data_no_float data_float file data_healthy data_healthy2 data_healthy3

%% EMG Denoising 

fs_EMG = 1000;

denoised_SCI_float = denoising_EMG(SCI_float,10);
denoised_SCI_no_float = denoising_EMG(SCI_no_float,10);
denoised_HP_no_float1 = denoising_EMG(HP_no_float1,10);
denoised_HP_no_float2 = denoising_EMG(HP_no_float2,10);
denoised_HP_no_float3 = denoising_EMG(HP_no_float3,10);

% figure();
% subplot(4,1,1);
% plot(denoised_SCI_float.T1.LTA)
% hold on;
% plot(SCI_float.T1.LTA)
% legend('before','after');
% subplot(4,1,2);
% plot(denoised_SCI_float.T1.RTA)
% hold on;
% plot(SCI_float.T1.RTA)
% legend('before','after');
% subplot(4,1,3);
% plot(denoised_SCI_float.T1.LMG)
% hold on;
% plot(SCI_float.T1.LMG)
% legend('before','after');
% subplot(4,1,4);
% plot(denoised_SCI_float.T1.RMG);
% hold on;
% plot(SCI_float.T1.RMG)
% legend('before','after');

%% EMG enveloppe 

[env_SCI_float1, env_SCI_float2] = enveloppe_EMG(denoised_SCI_float,200);
[env_SCI_no_float1, env_SCI_no_float2] = enveloppe_EMG(denoised_SCI_no_float,200);
[env_HP_no_float11, env_HP_no_float12] = enveloppe_EMG(denoised_HP_no_float1,200);
[env_HP_no_float21, env_HP_no_float22] = enveloppe_EMG(denoised_HP_no_float2,200);
[env_HP_no_float31, env_HP_no_float32] = enveloppe_EMG(denoised_HP_no_float3,200);

%% Automatic EMG Onset Detection 

[onset_SCI_float1,offset_SCI_float1]=detection_burst(env_SCI_float1);
[onset_SCI_float2,offset_SCI_float2]=detection_burst(env_SCI_float2);

[onset_SCI_no_float1,offset_SCI_no_float1]=detection_burst(env_SCI_no_float1);
[onset_SCI_no_float2,offset_SCI_no_float2]=detection_burst(env_SCI_no_float2);

[onset_HP_no_float11,offset_HP_no_float11]=detection_burst(env_HP_no_float11);
[onset_HP_no_float12,offset_HP_no_float12]=detection_burst(env_HP_no_float12);

[onset_HP_no_float21,offset_HP_no_float21]=detection_burst(env_HP_no_float21);
[onset_HP_no_float22,offset_HP_no_float22]=detection_burst(env_HP_no_float22);

[onset_HP_no_float31,offset_HP_no_float31]=detection_burst(env_HP_no_float31);
[onset_HP_no_float32,offset_HP_no_float32]=detection_burst(env_HP_no_float32);

%% By Hand EMG Onset & Offset Detection

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

%% Burst Duration
duration_SCI_float = duration_EMG(onset_SCI_float,offset_SCI_float);
duration_SCI_no_float = duration_EMG(onset_SCI_no_float,offset_SCI_no_float);
duration_HP_no_float_1 = duration_EMG(onset_HP_float_1,offset_HP_float_1);
duration_HP_no_float_2 = duration_EMG(onset_HP_float_2,offset_HP_float_2);
duration_HP_no_float_3 = duration_EMG(onset_HP_float_3,offset_HP_float_3);

%% RMS Burst

