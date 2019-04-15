
%% EMG Loading 
file = fullfile([pwd,'/Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES_NEW/MAT'],'FLOAT_NO_CRUTCHES_NEW.mat');
data_float = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES_NEW/MAT'],'NO_FLOAT_CRUTCHES_NEW.mat');
data_no_float = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 1/NO_FLOAT'],'S1_NO_FLOAT.mat');
data_healthy = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 2/NO_FLOAT'],'S2_NO_FLOAT.mat');
data_healthy2 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 3/NO_FLOAT'],'S3_NO_FLOAT.mat');
data_healthy3 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 1/FLOAT'],'S1_FLOAT.mat');
data_healthy4 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 2/FLOAT'],'S2_FLOAT.mat');
data_healthy5 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 3/FLOAT'],'S3_FLOAT.mat');
data_healthy6 = load(file);

SCI_float.T1 = data_float.FLOAT_NO_CRUTCHES_NEW.T_01.Raw.EMG;
SCI_float.T2 = data_float.FLOAT_NO_CRUTCHES_NEW.T_02.Raw.EMG;
SCI_float.T3 = data_float.FLOAT_NO_CRUTCHES_NEW.T_03.Raw.EMG;

SCI_no_float.T1 = data_no_float.NO_FLOAT_CRUTCHES_NEW.T_01.Raw.EMG;
SCI_no_float.T2 = data_no_float.NO_FLOAT_CRUTCHES_NEW.T_02.Raw.EMG;
SCI_no_float.T3 = data_no_float.NO_FLOAT_CRUTCHES_NEW.T_03.Raw.EMG;

HP_no_float1.T1 = data_healthy.S1_NO_FLOAT.T_01.Raw.EMG;
HP_no_float1.T2 = data_healthy.S1_NO_FLOAT.T_02.Raw.EMG;
HP_no_float1.T3 = data_healthy.S1_NO_FLOAT.T_03.Raw.EMG;

HP_no_float2.T1 = data_healthy2.S2_NO_FLOAT.T_01.Raw.EMG;
HP_no_float2.T2 = data_healthy2.S2_NO_FLOAT.T_02.Raw.EMG;
HP_no_float2.T3 = data_healthy2.S2_NO_FLOAT.T_03.Raw.EMG;

HP_no_float3.T1 = data_healthy3.S3_NO_FLOAT.T_01.Raw.EMG;
HP_no_float3.T2 = data_healthy3.S3_NO_FLOAT.T_02.Raw.EMG;
HP_no_float3.T3 = data_healthy3.S3_NO_FLOAT.T_03.Raw.EMG;

HP_float1.T1 = data_healthy4.S1_FLOAT.T_01.Raw.EMG;
HP_float1.T2 = data_healthy4.S1_FLOAT.T_02.Raw.EMG;
HP_float1.T3 = data_healthy4.S1_FLOAT.T_03.Raw.EMG;

HP_float2.T1 = data_healthy5.S2_FLOAT.T_01.Raw.EMG;
HP_float2.T2 = data_healthy5.S2_FLOAT.T_02.Raw.EMG;
HP_float2.T3 = data_healthy5.S2_FLOAT.T_03.Raw.EMG;

HP_float3.T1 = data_healthy6.S3_FLOAT.T_01.Raw.EMG;
HP_float3.T2 = data_healthy6.S3_FLOAT.T_02.Raw.EMG;
HP_float3.T3 = data_healthy6.S3_FLOAT.T_03.Raw.EMG;

clear data_no_float data_float file data_healthy data_healthy2 data_healthy3 data_healthy4 data_healthy5 data_healthy6

%% EMG Segmenting 


%% EMG Denoising 

fs_EMG = 1000;
frequency = 10;
[b,a] = butter(3,frequency/500,'high');
denoised = arrayfun(@(x) filtfilt(b,a,x),segmented);

%% EMG enveloppe 
envelopes = arrayfun(@(x) abs(x - mean(x)), denoised);

%% Automatic EMG Onset & Offset Detection 

[onset_SCI_float1,offset_SCI_float1]=detection_burst(env_SCI_float1);
[onset_SCI_float2,offset_SCI_float2]=detection_burst(env_SCI_float2);

[onset_SCI_no_float1,offset_SCI_no_float1]=detection_burst(env_SCI_no_float1);
[onset_SCI_no_float2,offset_SCI_no_float2]=detection_burst(env_SCI_no_float2);

[onset_HP_no_float11,offset_HP_no_float11]=detection_burst(env_HP_no_float11);
[onset_HP_no_float12,offset_HP_no_float12]=detection_burst(env_HP_no_float12);

[onset_HP_no_float21,offset_HP_no_float21]=detection_burst(env_HP_no_float21);
[onset_HP_no_float22,offset_HP_no_float22]=detection_burst(env_HP_no_float22);

[onset_HP_no_float31,offset_HP_no_float31]=detection_burst(env_HP_float31);
[onset_HP_no_float32,offset_HP_no_float32]=detection_burst(env_HP_float32);

[onset_HP_float11,offset_HP_float11]=detection_burst(env_HP_float11);
[onset_HP_float12,offset_HP_float12]=detection_burst(env_HP_float12);

[onset_HP_float21,offset_HP_float21]=detection_burst(env_HP_float21);
[onset_HP_float22,offset_HP_float22]=detection_burst(env_HP_float22);

[onset_HP_float31,offset_HP_float31]=detection_burst(env_HP_float31);
[onset_HP_float32,offset_HP_float32]=detection_burst(env_HP_float32);

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
durations = arrayfun(@(x) x(2)-x(1),[onsets,offsets]);
durations= arrayfun(@(x) arrayfun(@(z,a) rms(z(a(1):a(2))) ,x,y), denoised, sets);



%% Max activation 
max_act = arrayfun(@(x,y) arrayfun(@(z,a) max(z(a(1):a(2))),x,y), denoised, sets);

%% Mean activation 
mean_act = arrayfun(@(x,y) arrayfun(@(z,a) mean(z(a(1):a(2))),x,y), denoised, sets);

%% Coactivation Percentage
coactivation = arrayfun(@(x,y) arrayfun(@(z,a) rms(z(a(1):a(2))),x,y), denoised, sets);

%% RMS 
rms_val = arrayfun(@(x,y) arrayfun(@(z,a) rms(z(a(1):a(2))),x,y), denoised, sets);





