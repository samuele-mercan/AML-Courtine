
%% EMG Loading 

% SCI Patients 
file = fullfile([pwd,'/Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES_NEW/MAT'],'FLOAT_NO_CRUTCHES_NEW.mat');
data_float = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES_NEW/MAT'],'NO_FLOAT_CRUTCHES_NEW.mat');
data_no_float = load(file);

% No float - Healthy Subject 
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 1_2018/NO_FLOAT'],'S1_NO_FLOAT.mat');
data_healthy = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 2_2018/NO_FLOAT'],'S2_NO_FLOAT.mat');
data_healthy2 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 3_2018/NO_FLOAT'],'S3_NO_FLOAT.mat');
data_healthy3 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 4_2018/NO_FLOAT'],'S4_NO_FLOAT.mat');
data_healthy4 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 5_2018/NO_FLOAT'],'S5_NO_FLOAT.mat');
data_healthy5 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 6_2018/NO_FLOAT'],'S6_NO_FLOAT.mat');
data_healthy6 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 1_2018/NO_FLOAT'],'S1_NO_FLOAT.mat');
data_healthy7 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 2_2018/NO_FLOAT'],'S2_NO_FLOAT.mat');
data_healthy8 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 3_2018/NO_FLOAT'],'S3_NO_FLOAT.mat');
data_healthy9 = load(file);

% Float - Healthy Subject
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 1_2018/FLOAT'],'S1_FLOAT.mat');
data_healthy10 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 2_2018/FLOAT'],'S2_FLOAT.mat');
data_healthy11 = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 3_2018/FLOAT'],'S3_FLOAT.mat');
data_healthy12= load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 4_2018/FLOAT'],'S4_FLOAT.mat');
data_healthy13= load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 5_2018/FLOAT'],'S5_FLOAT.mat');
data_healthy14= load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 6_2018/FLOAT'],'S6_FLOAT.mat');
data_healthy15= load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 1_2018/FLOAT'],'S1_FLOAT.mat');
data_healthy16= load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 2_2018/FLOAT'],'S2_FLOAT.mat');
data_healthy17= load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/Healthy Recordings/Subject 3_2018/FLOAT'],'S3_FLOAT.mat');
data_healthy18= load(file);


% Concatenation Trials
SCI_float.T1 = data_float.FLOAT_NO_CRUTCHES_NEW.T_01.Raw.EMG;
SCI_float.T2 = data_float.FLOAT_NO_CRUTCHES_NEW.T_02.Raw.EMG;
SCI_float.T3 = data_float.FLOAT_NO_CRUTCHES_NEW.T_03.Raw.EMG;

SCI_no_float.T1 = data_no_float.NO_FLOAT_CRUTCHES_NEW.T_01.Raw.EMG;
SCI_no_float.T2 = data_no_float.NO_FLOAT_CRUTCHES_NEW.T_02.Raw.EMG;
SCI_no_float.T3 = data_no_float.NO_FLOAT_CRUTCHES_NEW.T_03.Raw.EMG;

HP_no_float1.T1 = data_healthy.S1_NO_FLOAT.T_01.Raw.EMG;
HP_no_float1.T2 = data_healthy.S1_NO_FLOAT.T_02.Raw.EMG;
HP_no_float1.T3 = data_healthy.S1_NO_FLOAT.T_03.Raw.EMG;

HP_no_float1 = [HP_no_float1.T1,HP_no_float1.T2,HP_no_float1.T3];

HP_no_float2.T1 = data_healthy2.S2_NO_FLOAT.T_01.Raw.EMG;
HP_no_float2.T2 = data_healthy2.S2_NO_FLOAT.T_02.Raw.EMG;
HP_no_float2.T3 = data_healthy2.S2_NO_FLOAT.T_03.Raw.EMG;

HP_no_float2 = [HP_no_float2.T1,HP_no_float2.T2,HP_no_float2.T3];

HP_no_float3.T1 = data_healthy3.S3_NO_FLOAT.T_01.Raw.EMG;
HP_no_float3.T2 = data_healthy3.S3_NO_FLOAT.T_02.Raw.EMG;
HP_no_float3.T3 = data_healthy3.S3_NO_FLOAT.T_03.Raw.EMG;

HP_no_float3 = [HP_no_float3.T1,HP_no_float3.T2,HP_no_float3.T3];

HP_no_float4.T1 = data_healthy4.S1_NO_FLOAT.T_01.Raw.EMG;
HP_no_float4.T2 = data_healthy4.S1_NO_FLOAT.T_02.Raw.EMG;
HP_no_float4.T3 = data_healthy4.S1_NO_FLOAT.T_03.Raw.EMG;

HP_no_float4 = [HP_no_float4.T1,HP_no_float4.T2,HP_no_float4.T3];

HP_no_float5.T1 = data_healthy5.S2_NO_FLOAT.T_01.Raw.EMG;
HP_no_float5.T2 = data_healthy5.S2_NO_FLOAT.T_02.Raw.EMG;
HP_no_float5.T3 = data_healthy5.S2_NO_FLOAT.T_03.Raw.EMG;

HP_no_float5 = [HP_no_float5.T1,HP_no_float5.T2,HP_no_float5.T3];

HP_no_float6.T1 = data_healthy6.S3_NO_FLOAT.T_01.Raw.EMG;
HP_no_float6.T2 = data_healthy6.S3_NO_FLOAT.T_02.Raw.EMG;
HP_no_float6.T3 = data_healthy6.S3_NO_FLOAT.T_03.Raw.EMG;

HP_no_float6 = [HP_no_float6.T1,HP_no_float6.T2,HP_no_float6.T3];

HP_no_float7.T1 = data_healthy7.S4_NO_FLOAT.T_01.Raw.EMG;
HP_no_float7.T2 = data_healthy7.S4_NO_FLOAT.T_02.Raw.EMG;
HP_no_float7.T3 = data_healthy7.S4_NO_FLOAT.T_03.Raw.EMG;

HP_no_float7 = [HP_no_float7.T1,HP_no_float7.T2,HP_no_float7.T3];

HP_no_float8.T1 = data_healthy8.S5_NO_FLOAT.T_01.Raw.EMG;
HP_no_float8.T2 = data_healthy8.S5_NO_FLOAT.T_02.Raw.EMG;
HP_no_float8.T3 = data_healthy8.S5_NO_FLOAT.T_03.Raw.EMG;

HP_no_float8 = [HP_no_float8.T1,HP_no_float8.T2,HP_no_float8.T3];

HP_no_float9.T1 = data_healthy9.S6_NO_FLOAT.T_01.Raw.EMG;
HP_no_float9.T2 = data_healthy9.S6_NO_FLOAT.T_02.Raw.EMG;
HP_no_float9.T3 = data_healthy9.S6_NO_FLOAT.T_03.Raw.EMG;

HP_no_float9 = [HP_no_float9.T1,HP_no_float9.T2,HP_no_float9.T3];


% Float - Healthy subject
HP_float1.T1 = data_healthy10.S1_FLOAT.T_01.Raw.EMG;
HP_float1.T2 = data_healthy10.S1_FLOAT.T_02.Raw.EMG;
HP_float1.T3 = data_healthy10.S1_FLOAT.T_03.Raw.EMG;

HP_float1 = [HP_float1.T1,HP_float1.T2,HP_float1.T3];

HP_float2.T1 = data_healthy11.S2_FLOAT.T_01.Raw.EMG;
HP_float2.T2 = data_healthy11.S2_FLOAT.T_02.Raw.EMG;
HP_float2.T3 = data_healthy11.S2_FLOAT.T_03.Raw.EMG;

HP_float2 = [HP_float2.T1,HP_float2.T2,HP_float2.T3];

HP_float3.T1 = data_healthy12.S3_FLOAT.T_01.Raw.EMG;
HP_float3.T2 = data_healthy12.S3_FLOAT.T_02.Raw.EMG;
HP_float3.T3 = data_healthy12.S3_FLOAT.T_03.Raw.EMG;

HP_float3 = [HP_float3.T1,HP_float3.T2,HP_float3.T3];

HP_float4.T1 = data_healthy13.S3_FLOAT.T_01.Raw.EMG;
HP_float4.T2 = data_healthy13.S3_FLOAT.T_02.Raw.EMG;
HP_float4.T3 = data_healthy13.S3_FLOAT.T_03.Raw.EMG;

HP_float4 = [HP_float4.T1,HP_float4.T2,HP_float4.T3];

HP_float5.T1 = data_healthy14.S3_FLOAT.T_01.Raw.EMG;
HP_float5.T2 = data_healthy14.S3_FLOAT.T_02.Raw.EMG;
HP_float5.T3 = data_healthy14.S3_FLOAT.T_03.Raw.EMG;

HP_float5 = [HP_float5.T1,HP_float5.T2,HP_float5.T3];

HP_float6.T1 = data_healthy15.S3_FLOAT.T_01.Raw.EMG;
HP_float6.T2 = data_healthy15.S3_FLOAT.T_02.Raw.EMG;
HP_float6.T3 = data_healthy15.S3_FLOAT.T_03.Raw.EMG;

HP_float6 = [HP_float6.T1,HP_float6.T2,HP_float6.T3];

HP_float7.T1 = data_healthy16.S3_FLOAT.T_01.Raw.EMG;
HP_float7.T2 = data_healthy16.S3_FLOAT.T_02.Raw.EMG;
HP_float7.T3 = data_healthy16.S3_FLOAT.T_03.Raw.EMG;

HP_float7 = [HP_float7.T1,HP_float7.T2,HP_float7.T3];

HP_float8.T1 = data_healthy17.S3_FLOAT.T_01.Raw.EMG;
HP_float8.T2 = data_healthy17.S3_FLOAT.T_02.Raw.EMG;
HP_float8.T3 = data_healthy17.S3_FLOAT.T_03.Raw.EMG;

HP_float8 = [HP_float8.T1,HP_float8.T2,HP_float8.T3];

HP_float9.T1 = data_healthy18.S3_FLOAT.T_01.Raw.EMG;
HP_float9.T2 = data_healthy18.S3_FLOAT.T_02.Raw.EMG;
HP_float9.T3 = data_healthy18.S3_FLOAT.T_03.Raw.EMG;

HP_float9 = [HP_float9.T1,HP_float9.T2,HP_float9.T3];

clear data_no_float data_float file data_healthy data_healthy2 data_healthy3 data_healthy4 data_healthy5 data_healthy6

%% EMG Segmenting 

% healthy patient 
[noFloat_FS_left1, ~, noFloat_FS_right1, ~, Float_FS_left1, ~, Float_FS_right1, ~] = HealthySegmentation('Healthy Recordings/Subject1_2018/FLOAT/S1_FLOAT.mat','Healthy Recordings/Subject1_2018/NO_FLOAT/S1_NO_FLOAT.mat');
[noFloat_FS_left2, ~, noFloat_FS_right2, ~, Float_FS_left2, ~, Float_FS_right2, ~] = HealthySegmentation('Healthy Recordings/Subject2_2018/FLOAT/S2_FLOAT.mat','Healthy Recordings/Subject2_2018/NO_FLOAT/S2_NO_FLOAT.mat');
[noFloat_FS_left3, ~, noFloat_FS_right3, ~, Float_FS_left3, ~, Float_FS_right3, ~] = HealthySegmentation('Healthy Recordings/Subject3_2018/FLOAT/S3_FLOAT.mat','Healthy Recordings/Subject3_2018/NO_FLOAT/S3_NO_FLOAT.mat');
[noFloat_FS_left4, ~, noFloat_FS_right4, ~, Float_FS_left4, ~, Float_FS_right4, ~] = HealthySegmentation('Healthy Recordings/Subject4_2018/FLOAT/S4_FLOAT.mat','Healthy Recordings/Subject4_2018/NO_FLOAT/S4_NO_FLOAT.mat');
[noFloat_FS_left5, ~, noFloat_FS_right5, ~, Float_FS_left5, ~, Float_FS_right5, ~] = HealthySegmentation('Healthy Recordings/Subject5_2018/FLOAT/S5_FLOAT.mat','Healthy Recordings/Subject5_2018/NO_FLOAT/S5_NO_FLOAT.mat');
[noFloat_FS_left6, ~, noFloat_FS_right6, ~, Float_FS_left6, ~, Float_FS_right6, ~] = HealthySegmentation('Healthy Recordings/Subject6_2018/FLOAT/S6_FLOAT.mat','Healthy Recordings/Subject6_2018/NO_FLOAT/S6_NO_FLOAT.mat');
[noFloat_FS_left7, ~, noFloat_FS_right7, ~, Float_FS_left7, ~, Float_FS_right7, ~] = HealthySegmentation('Healthy Recordings/Subject1_2019/FLOAT/S1_FLOAT.mat','Healthy Recordings/Subject1_2019/NO_FLOAT/S1_NO_FLOAT.mat');
[noFloat_FS_left8, ~, noFloat_FS_right8, ~, Float_FS_left8, ~, Float_FS_right8, ~] = HealthySegmentation('Healthy Recordings/Subject2_2019/FLOAT/S2_FLOAT.mat','Healthy Recordings/Subject2_2019/NO_FLOAT/S2_NO_FLOAT.mat');
[noFloat_FS_left9, ~, noFloat_FS_right9, ~, Float_FS_left9, ~, Float_FS_right9, ~] = HealthySegmentation('Healthy Recordings/Subject3_2019/FLOAT/S3_FLOAT.mat','Healthy Recordings/Subject3_2019/NO_FLOAT/S3_NO_FLOAT.mat');

if side == 0
    
    % No Float
    HP_no_float1 = arrayfun(@(x,y) HP_no_float1(x:y), noFloat_FS_left1(1:end-1),noFloat_FS_left1(2:end));
    HP_no_float2 = arrayfun(@(x,y) HP_no_float2(x:y), noFloat_FS_left2(1:end-1),noFloat_FS_left2(2:end));
    HP_no_float3 = arrayfun(@(x,y) HP_no_float3(x:y), noFloat_FS_left3(1:end-1),noFloat_FS_left3(2:end));
    HP_no_float4 = arrayfun(@(x,y) HP_no_float4(x:y), noFloat_FS_left4(1:end-1),noFloat_FS_left4(2:end));
    HP_no_float5 = arrayfun(@(x,y) HP_no_float5(x:y), noFloat_FS_left5(1:end-1),noFloat_FS_left5(2:end));
    HP_no_float6 = arrayfun(@(x,y) HP_no_float6(x:y), noFloat_FS_left6(1:end-1),noFloat_FS_left6(2:end));
    HP_no_float7 = arrayfun(@(x,y) HP_no_float7(x:y), noFloat_FS_left7(1:end-1),noFloat_FS_left7(2:end));
    HP_no_float8 = arrayfun(@(x,y) HP_no_float8(x:y), noFloat_FS_left8(1:end-1),noFloat_FS_left8(2:end));
    HP_no_float9 = arrayfun(@(x,y) HP_no_float9(x:y), noFloat_FS_left9(1:end-1),noFloat_FS_left9(2:end));
    
    % Float
    HP_float1 = arrayfun(@(x,y) HP_float1(x:y), Float_FS_left1(1:end-1),Float_FS_left1(2:end));
    HP_float2 = arrayfun(@(x,y) HP_float2(x:y), Float_FS_left2(1:end-1),Float_FS_left2(2:end));
    HP_float3 = arrayfun(@(x,y) HP_float3(x:y), Float_FS_left3(1:end-1),Float_FS_left3(2:end));
    HP_float4 = arrayfun(@(x,y) HP_float4(x:y), Float_FS_left4(1:end-1),Float_FS_left4(2:end));
    HP_float5 = arrayfun(@(x,y) HP_float5(x:y), Float_FS_left5(1:end-1),Float_FS_left5(2:end));
    HP_float6 = arrayfun(@(x,y) HP_float6(x:y), Float_FS_left6(1:end-1),Float_FS_left6(2:end));
    HP_float7 = arrayfun(@(x,y) HP_float7(x:y), Float_FS_left7(1:end-1),Float_FS_left7(2:end));
    HP_float8 = arrayfun(@(x,y) HP_float8(x:y), Float_FS_left8(1:end-1),Float_FS_left8(2:end));
    HP_float9 = arrayfun(@(x,y) HP_float9(x:y), Float_FS_left9(1:end-1),Float_FS_left9(2:end));
    
elseif side == 1
    
        % No Float
    HP_no_float1 = arrayfun(@(x,y) HP_no_float1(x:y), noFloat_FS_right1(1:end-1),noFloat_FS_right1(2:end));
    HP_no_float2 = arrayfun(@(x,y) HP_no_float2(x:y), noFloat_FS_right2(1:end-1),noFloat_FS_right2(2:end));
    HP_no_float3 = arrayfun(@(x,y) HP_no_float3(x:y), noFloat_FS_right3(1:end-1),noFloat_FS_right3(2:end));
    HP_no_float4 = arrayfun(@(x,y) HP_no_float4(x:y), noFloat_FS_right4(1:end-1),noFloat_FS_right4(2:end));
    HP_no_float5 = arrayfun(@(x,y) HP_no_float5(x:y), noFloat_FS_right5(1:end-1),noFloat_FS_right5(2:end));
    HP_no_float6 = arrayfun(@(x,y) HP_no_float6(x:y), noFloat_FS_right6(1:end-1),noFloat_FS_right6(2:end));
    HP_no_float7 = arrayfun(@(x,y) HP_no_float7(x:y), noFloat_FS_right7(1:end-1),noFloat_FS_right7(2:end));
    HP_no_float8 = arrayfun(@(x,y) HP_no_float8(x:y), noFloat_FS_right8(1:end-1),noFloat_FS_right8(2:end));
    HP_no_float9 = arrayfun(@(x,y) HP_no_float9(x:y), noFloat_FS_right9(1:end-1),noFloat_FS_right9(2:end));
    
    % Float
    HP_float1 = arrayfun(@(x,y) HP_float1(x:y), Float_FS_right1(1:end-1),Float_FS_right1(2:end));
    HP_float2 = arrayfun(@(x,y) HP_float2(x:y), Float_FS_right2(1:end-1),Float_FS_right2(2:end));
    HP_float3 = arrayfun(@(x,y) HP_float3(x:y), Float_FS_right3(1:end-1),Float_FS_right3(2:end));
    HP_float4 = arrayfun(@(x,y) HP_float4(x:y), Float_FS_right4(1:end-1),Float_FS_right4(2:end));
    HP_float5 = arrayfun(@(x,y) HP_float5(x:y), Float_FS_right5(1:end-1),Float_FS_right5(2:end));
    HP_float6 = arrayfun(@(x,y) HP_float6(x:y), Float_FS_right6(1:end-1),Float_FS_right6(2:end));
    HP_float7 = arrayfun(@(x,y) HP_float7(x:y), Float_FS_right7(1:end-1),Float_FS_right7(2:end));
    HP_float8 = arrayfun(@(x,y) HP_float8(x:y), Float_FS_right8(1:end-1),Float_FS_right8(2:end));
    HP_float9 = arrayfun(@(x,y) HP_float9(x:y), Float_FS_right9(1:end-1),Float_FS_right9(2:end));
end


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





