function [env1, env2] = enveloppe_EMG(denoised_emg)

% shifting baseline to 0 and taking abs value
fields = fieldnames(denoised_emg);
window = 200;

for i = 1:length(fields)

    denoised_emg.(fields{i}).EMG.LMG = abs(denoised_emg.(fields{i}).EMG.LMG ... 
        - mean(denoised_emg.(fields{i}).EMG.LMG));
    denoised_emg.(fields{i}).EMG.RMG = abs(denoised_emg.(fields{i}).EMG.RMG ...
        - mean(denoised_emg.(fields{i}).EMG.RMG));
    denoised_emg.(fields{i}).T1.LTA = abs(denoised_emg.(fields{i}).EMG.LTA ... 
        - mean(denoised_emg.(fields{i}).EMG.LTA));
    denoised_emg.(fields{i}).EMG.RTA = abs(denoised_emg.(fields{i}).EMG.RTA ...
        - mean(denoised_emg.(fields{i}).EMG.RTA));

    % RMS enveloppe
    [env1.(fields{i}).EMG.LMG,~] = envelope(denoised_emg.(fields{i}).EMG.LMG,window,'rms');% problem is that we have upper and lower enveloppe
    [env1.(fields{i}).EMG.RMG,~] = envelope(denoised_emg.(fields{i}).EMG.RMG,window,'rms');
    [env1.(fields{i}).EMG.LTA,~] = envelope(denoised_emg.(fields{i}).EMG.LTA,window,'rms');
    [env1.(fields{i}).EMG.RTA,~] = envelope(denoised_emg.(fields{i}).EMG.RTA,window,'rms');
    % RMS enveloppe
    [env2.(fields{i}).EMG.LMG] = hand_RMS(denoised_emg.(fields{i}).EMG.LMG,window);% problem is that we have upper and lower enveloppe
    [env2.(fields{i}).EMG.RMG] = hand_RMS(denoised_emg.(fields{i}).EMG.RMG,window);
    [env2.(fields{i}).EMG.LTA] = hand_RMS(denoised_emg.(fields{i}).EMG.LTA,window);
    [env2.(fields{i}).EMG.RTA] = hand_RMS(denoised_emg.(fields{i}).EMG.RTA,window);


end
end

