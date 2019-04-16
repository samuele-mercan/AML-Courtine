function [denoised_emg] = denoising_EMG(raw_emg,frequency)
%Denoising RAW EMG signal 


% using wavelet transform
%denoised_emg1 = wdenoise(SCI_float.T1.LMG,4,'Wavelet','db6');  % not a real denoising approach 

% using filtering 
%dspec = fdesign.highpass('Fst,Fp,Ast,Ap',18/500,20/500,60,1);
%designedFilter = design(dspec,'equiripple');
%denoised_emg2 = filtfilt(designedFilter, SCI_float.T1.LMG);  % how to handle the shift
%fvtool(designedFilter)

% type I of impolementation
%[z,p,k] = butter(9,10/500,'low'); % zero, poles, gain notation
%sos = zp2sos(z,p,k);
%fvtool(sos,'Analysis','freq');

[b,a] = butter(3,frequency/500,'high');
%freqz(b,a)

denoised_emg = raw_emg;

denoised_emg.T_01.Clean.EMG.LMG = filtfilt(b,a,raw_emg.T_01.Raw.EMG.LMG);
denoised_emg.T_01.Clean.EMG.RMG = filtfilt(b,a,raw_emg.T_01.Raw.EMG.RMG);
denoised_emg.T_01.Clean.EMG.LTA = filtfilt(b,a,raw_emg.T_01.Raw.EMG.LTA);
denoised_emg.T_01.Clean.EMG.RTA = filtfilt(b,a,raw_emg.T_01.Raw.EMG.RTA);

denoised_emg.T_02.Clean.EMG.LMG = filtfilt(b,a,raw_emg.T_02.Raw.EMG.LMG);
denoised_emg.T_02.Clean.EMG.RMG = filtfilt(b,a,raw_emg.T_02.Raw.EMG.RMG);
denoised_emg.T_02.Clean.EMG.LTA = filtfilt(b,a,raw_emg.T_02.Raw.EMG.LTA);
denoised_emg.T_02.Clean.EMG.RTA = filtfilt(b,a,raw_emg.T_02.Raw.EMG.RTA);

denoised_emg.T_03.Clean.EMG.LMG = filtfilt(b,a,raw_emg.T_03.Raw.EMG.LMG);
denoised_emg.T_03.Clean.EMG.RMG = filtfilt(b,a,raw_emg.T_03.Raw.EMG.RMG);
denoised_emg.T_03.Clean.EMG.LTA = filtfilt(b,a,raw_emg.T_03.Raw.EMG.LTA);
denoised_emg.T_03.Clean.EMG.RTA = filtfilt(b,a,raw_emg.T_03.Raw.EMG.RTA);

end

