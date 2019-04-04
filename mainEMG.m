
%% EMG Loading 
file = fullfile([pwd,'/Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES_NEW/MAT'],'FLOAT_NO_CRUTCHES_NEW.mat');
data_float = load(file);
file = fullfile([pwd,'/Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES_NEW/MAT'],'NO_FLOAT_CRUTCHES_NEW.mat');
data_no_float = load(file);

SCI_float.T1 = data_float.FLOAT_NO_CRUTCHES_NEW.T_01.Raw.EMG;
SCI_float.T2 = data_float.FLOAT_NO_CRUTCHES_NEW.T_02.Raw.EMG;
SCI_float.T3 = data_float.FLOAT_NO_CRUTCHES_NEW.T_03.Raw.EMG;

SCI_no_float.T1 = data_no_float.NO_FLOAT_CRUTCHES_NEW.T_01.Raw.EMG;
SCI_no_float.T2 = data_no_float.NO_FLOAT_CRUTCHES_NEW.T_02.Raw.EMG;
SCI_no_float.T3 = data_no_float.NO_FLOAT_CRUTCHES_NEW.T_03.Raw.EMG;

clear data_no_float data_float file

%% EMG Denoising 

fs_EMG = 1000;

% using wavelet transform
denoised_emg1 = wdenoise(SCI_float.T1.LMG,4,'Wavelet','db6');

% using filtering 
dspec = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2',18,20,500,510,1,40,1,fs_EMG);
designedFilter = design(dspec,'equiripple');
denoised_emg2 = filter(designedFilter, SCI_float.T1.LMG);  % how to handle the shift
fvtool(designedFilter)

figure();
plot(denoised_emg1(1:5000))
hold on;
plot(denoised_emg2(1:5000))
hold on;
plot(SCI_float.T1.LMG(1:5000))
legend();

%% EMG enveloppe 

% RMS enveloppe
[env_upper,env_lower] = envelope(denoised_emg1,100,'rms');

% Filtering enveloppe 
%[z,p,k] = butter(9,10/500,'low'); % zero, poles, gain notation
%sos = zp2sos(z,p,k);
%fvtool(sos,'Analysis','freq');

[b,a] = butter(9,6/500,'low');
freqz(b,a);
env2 = filter(b,a,denoised_emg1);

figure();
plot(yupper)
hold on;
plot(ylower)
hold on;
plot(denoised_emg1);
hold on;
plot(env2)


