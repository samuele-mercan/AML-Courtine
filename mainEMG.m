
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
[~, noFloat_FO_left_SCI, ~, noFloat_FO_right_SCI,~, Float_FO_left_SCI,~, Float_FO_right_SCI] = HealthySegmentation([pwd,'/Healthy Recordings Denoised/Subject1_2018/FLOAT/'], datafile2)

[GaitCycles] = segmentation(datasetName, table01, table02, table03, leftFoot)
%% EMG segmentation 
[GaitCycles] = Healthysegmentation2(datasetName, dataset_FS_left,dataset_FO_left, ...
    dataset_FS_right, dataset_FO_right, leftFoot)

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

%% Clean Onset/Offsets

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





