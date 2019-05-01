function [env2] = enveloppe_EMG(denoised_emg)
% Computation of the RMS enveloppe of denoised EMG gaits
% Returns structure with the enveloppe for each gait and muscle

fields = fieldnames(denoised_emg);
window = 250;  % window for RMS computation

for i = 1:length(fields) % for each gait
    
    %% LMG
    
    % analysis of frequency spectrum for detached sensor detection
    [max_vals,index] = maxk(pwelch(denoised_emg.(fields{i}).EMG.LMG),5);
    index = index(max_vals>= mean(pwelch(denoised_emg.(fields{i}).EMG.LMG))+std(pwelch(denoised_emg.(fields{i}).EMG.LMG)));
    
    if length(index(index >= 50 & index <= 55)) == length(index) % if detached sensor
        
        % if only electromagnetic noise, no enveloppe computed
        env2.(fields{i}).EMG.LMG = [];
    else
        % enveloppe measurement 
        denoised_emg.(fields{i}).EMG.LMG = abs(denoised_emg.(fields{i}).EMG.LMG ... 
        - mean(denoised_emg.(fields{i}).EMG.LMG)); % shifting baseline to 0 and taking abs value
        [env2.(fields{i}).EMG.LMG] = hand_RMS(denoised_emg.(fields{i}).EMG.LMG,window); % enveloppe measurement 
    end
    
    %% RMG
    
    % analysis of frequency spectrum for detached sensor detection
    [max_vals,index] = maxk(pwelch(denoised_emg.(fields{i}).EMG.RMG),5);
    index = index(max_vals>= mean(pwelch(denoised_emg.(fields{i}).EMG.RMG))+std(pwelch(denoised_emg.(fields{i}).EMG.RMG)));
    
    if length(index(index >= 50 & index <= 55)) == length(index) % if detached sensor
        
        % if only electromagnetic noise, no enveloppe computed
        env2.(fields{i}).EMG.RMG = [];
    else
        
        % enveloppe measurement 
        denoised_emg.(fields{i}).EMG.RMG = abs(denoised_emg.(fields{i}).EMG.RMG ...
        - mean(denoised_emg.(fields{i}).EMG.RMG)); % shifting baseline to 0 and taking abs value
        [env2.(fields{i}).EMG.RMG] = hand_RMS(denoised_emg.(fields{i}).EMG.RMG,window); % enveloppe measurement 
    end

    %% LTA
    
    % analysis of frequency spectrum for detached sensor detection
    [max_vals,index] = maxk(pwelch(denoised_emg.(fields{i}).EMG.LTA),5);
    index = index(max_vals>= mean(pwelch(denoised_emg.(fields{i}).EMG.LTA))+std(pwelch(denoised_emg.(fields{i}).EMG.LTA)));
    
    if length(index(index >= 50 & index <= 55)) == length(index)
        
        % if only electromagnetic noise, no enveloppe computed
        env2.(fields{i}).EMG.LTA = [];
    else
        
        % enveloppe measurement 
        denoised_emg.(fields{i}).EMG.LTA = abs(denoised_emg.(fields{i}).EMG.LTA ... 
        - mean(denoised_emg.(fields{i}).EMG.LTA)); % shifting baseline to 0 and taking abs value
        [env2.(fields{i}).EMG.LTA] = hand_RMS(denoised_emg.(fields{i}).EMG.LTA,window); % enveloppe measurement 
    end

    %% RTA
    
    % analysis of frequency spectrum for detached sensor detection
    [max_vals,index] = maxk(pwelch(denoised_emg.(fields{i}).EMG.RTA),5);
    index = index(max_vals>= mean(pwelch(denoised_emg.(fields{i}).EMG.RTA))+std(pwelch(denoised_emg.(fields{i}).EMG.RTA)));
    
    if length(index(index >= 50 & index <= 55)) == length(index)
        
        % if only electromagnetic noise, no enveloppe computed
        env2.(fields{i}).EMG.RTA = [];
    else
        denoised_emg.(fields{i}).EMG.RTA = abs(denoised_emg.(fields{i}).EMG.RTA ... 
        - mean(denoised_emg.(fields{i}).EMG.RTA)); % shifting baseline to 0 and taking abs value
        [env2.(fields{i}).EMG.RTA] = hand_RMS(denoised_emg.(fields{i}).EMG.RTA,window); % enveloppe measurement 
    end
end
end

