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

denoised_emg = [];

denoised_emg.T1.LMG = filtfilt(b,a,raw_emg.T1.LMG);
denoised_emg.T1.RMG = filtfilt(b,a,raw_emg.T1.RMG);
denoised_emg.T1.LTA = filtfilt(b,a,raw_emg.T1.LTA);
denoised_emg.T1.RTA = filtfilt(b,a,raw_emg.T1.RTA);

denoised_emg.T2.LMG = filtfilt(b,a,raw_emg.T2.LMG);
denoised_emg.T2.RMG = filtfilt(b,a,raw_emg.T2.RMG);
denoised_emg.T2.LTA = filtfilt(b,a,raw_emg.T2.LTA);
denoised_emg.T2.RTA = filtfilt(b,a,raw_emg.T2.RTA);

denoised_emg.T3.LMG = filtfilt(b,a,raw_emg.T3.LMG);
denoised_emg.T3.RMG = filtfilt(b,a,raw_emg.T3.RMG);
denoised_emg.T3.LTA = filtfilt(b,a,raw_emg.T3.LTA);
denoised_emg.T3.RTA = filtfilt(b,a,raw_emg.T3.RTA);

end

