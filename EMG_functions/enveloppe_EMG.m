function [env1, env2] = enveloppe_EMG(denoised_emg,window)

% shifting baseline to 0 and taking abs value
denoised_emg.T1.LMG = abs(denoised_emg.T1.LMG - mean(denoised_emg.T1.LMG));
denoised_emg.T1.RMG = abs(denoised_emg.T1.RMG - mean(denoised_emg.T1.RMG));
denoised_emg.T1.LTA = abs(denoised_emg.T1.LTA - mean(denoised_emg.T1.LTA));
denoised_emg.T1.RTA = abs(denoised_emg.T1.RTA - mean(denoised_emg.T1.RTA));

denoised_emg.T2.LMG = abs(denoised_emg.T2.LMG - mean(denoised_emg.T2.LMG));
denoised_emg.T2.RMG = abs(denoised_emg.T2.RMG - mean(denoised_emg.T2.RMG));
denoised_emg.T2.LTA = abs(denoised_emg.T2.LTA - mean(denoised_emg.T2.LTA));
denoised_emg.T2.RTA = abs(denoised_emg.T2.RTA - mean(denoised_emg.T2.RTA));

denoised_emg.T3.LMG = abs(denoised_emg.T3.LMG - mean(denoised_emg.T3.LMG));
denoised_emg.T3.RMG = abs(denoised_emg.T3.RMG - mean(denoised_emg.T3.RMG));
denoised_emg.T3.LTA = abs(denoised_emg.T3.LTA - mean(denoised_emg.T3.LTA));
denoised_emg.T3.RTA = abs(denoised_emg.T3.RTA - mean(denoised_emg.T3.RTA));

% RMS enveloppe
[env1.T1.LMG,~] = envelope(denoised_emg.T1.LMG,200,'rms');% problem is that we have upper and lower enveloppe
[env1.T1.RMG,~] = envelope(denoised_emg.T1.RMG,200,'rms');
[env1.T1.LTA,~] = envelope(denoised_emg.T1.LTA,200,'rms');
[env1.T1.RTA,~] = envelope(denoised_emg.T1.RTA,200,'rms');

[env1.T2.LMG,~] = envelope(denoised_emg.T2.LMG,200,'rms');% problem is that we have upper and lower enveloppe
[env1.T2.RMG,~] = envelope(denoised_emg.T2.RMG,200,'rms');
[env1.T2.LTA,~] = envelope(denoised_emg.T2.LTA,200,'rms');
[env1.T2.RTA,~] = envelope(denoised_emg.T2.RTA,200,'rms');

[env1.T3.LMG,~] = envelope(denoised_emg.T3.LMG,200,'rms');% problem is that we have upper and lower enveloppe
[env1.T3.RMG,~] = envelope(denoised_emg.T3.RMG,200,'rms');
[env1.T3.LTA,~] = envelope(denoised_emg.T3.LTA,200,'rms');
[env1.T3.RTA,~] = envelope(denoised_emg.T3.RTA,200,'rms');

% Hand RMS
[env2.T1.LMG] =hand_RMS(denoised_emg.T1.LMG,200);% problem is that we have upper and lower enveloppe
[env2.T1.RMG] =hand_RMS(denoised_emg.T1.RMG,200);
[env2.T1.LTA] =hand_RMS(denoised_emg.T1.LTA,200);
[env2.T1.RTA] =hand_RMS(denoised_emg.T1.RTA,200);

[env2.T2.LMG] =hand_RMS(denoised_emg.T2.LMG,200);% problem is that we have upper and lower enveloppe
[env2.T2.RMG] =hand_RMS(denoised_emg.T2.RMG,200);
[env2.T2.LTA] =hand_RMS(denoised_emg.T2.LTA,200);
[env2.T2.RTA] =hand_RMS(denoised_emg.T2.RTA,200);

[env2.T3.LMG] =hand_RMS(denoised_emg.T3.LMG,200);% problem is that we have upper and lower enveloppe
[env2.T3.RMG] =hand_RMS(denoised_emg.T3.RMG,200);
[env2.T3.LTA] =hand_RMS(denoised_emg.T3.LTA,200);
[env2.T3.RTA] =hand_RMS(denoised_emg.T3.RTA,200);
end

