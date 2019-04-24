function [env1, env2] = enveloppe_EMG(denoised_emg)

% shifting baseline to 0 and taking abs value
fields = fieldnames(denoised_emg);
window = 250;


for i = 1:length(fields)
    
    % RMS enveloppe

    [~,index] = max(pwelch(denoised_emg.(fields{i}).EMG.LMG));
    if index <= 53 && index >= 50
        env1.(fields{i}).EMG.LMG = [];
        env2.(fields{i}).EMG.LMG = [];
    else
        denoised_emg.(fields{i}).EMG.LMG = abs(denoised_emg.(fields{i}).EMG.LMG ... 
        - mean(denoised_emg.(fields{i}).EMG.LMG));
        [env1.(fields{i}).EMG.LMG,~] = envelope(denoised_emg.(fields{i}).EMG.LMG,window,'rms');
        [env2.(fields{i}).EMG.LMG] = hand_RMS(denoised_emg.(fields{i}).EMG.LMG,window);
    end

    [~,index] = max(pwelch(denoised_emg.(fields{i}).EMG.RMG));
    if index <= 53 && index >= 50
        env1.(fields{i}).EMG.RMG = [];
        env2.(fields{i}).EMG.RMG = [];
    else
        denoised_emg.(fields{i}).EMG.RMG = abs(denoised_emg.(fields{i}).EMG.RMG ...
        - mean(denoised_emg.(fields{i}).EMG.RMG));
        [env1.(fields{i}).EMG.RMG,~] = envelope(denoised_emg.(fields{i}).EMG.RMG,window,'rms');
        [env2.(fields{i}).EMG.RMG] = hand_RMS(denoised_emg.(fields{i}).EMG.RMG,window);
    end

    [~,index] = max(pwelch(denoised_emg.(fields{i}).EMG.LTA));
    if index <= 53 && index >= 50
        env1.(fields{i}).EMG.LTA = [];
        env2.(fields{i}).EMG.LTA = [];
    else
        denoised_emg.(fields{i}).EMG.LTA = abs(denoised_emg.(fields{i}).EMG.LTA ... 
        - mean(denoised_emg.(fields{i}).EMG.LTA));
        [env1.(fields{i}).EMG.LTA,~] = envelope(denoised_emg.(fields{i}).EMG.LTA,window,'rms');
        [env2.(fields{i}).EMG.LTA] = hand_RMS(denoised_emg.(fields{i}).EMG.LTA,window);
    end

    [~,index] = max(pwelch(denoised_emg.(fields{i}).EMG.RTA));
    if index <= 53 && index >= 50
        env1.(fields{i}).EMG.RTA = [];
        env2.(fields{i}).EMG.RTA = [];
    else
        denoised_emg.(fields{i}).EMG.RTA = abs(denoised_emg.(fields{i}).EMG.RTA ... 
        - mean(denoised_emg.(fields{i}).EMG.RTA));
        [env1.(fields{i}).EMG.RTA,~] = envelope(denoised_emg.(fields{i}).EMG.RTA,window,'rms');
        [env2.(fields{i}).EMG.RTA] = hand_RMS(denoised_emg.(fields{i}).EMG.RTA,window);
    end


end
end

