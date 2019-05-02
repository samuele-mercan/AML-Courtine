function [rms_val] = rms_EMG(onset,offset,gait)
% Root mean square of bursts measurement 
% Returns a structure containing the RMS value for each burst and each gait


fields = fieldnames(onset);
for i = 1:numel(fields) % for each gait 
    
    % LMG
    nans = isnan(offset.(fields{i}).EMG.LMG);
    if isempty(nans(nans == 1))
        
        % Root mean square measurement 
        rms_val.(fields{i}).EMG.LMG = rms(concatenate(gait.(fields{i}).EMG.LMG,onset.(fields{i}).EMG.LMG, ...
            offset.(fields{i}).EMG.LMG));
    else
        rms_val.(fields{i}).EMG.LMG = NaN; % if no bursts, no feature
    end
    
    % RMG
    nans = isnan(offset.(fields{i}).EMG.RMG);    
    if isempty(nans(nans == 1))
        
        % Root mean square measurement 
        rms_val.(fields{i}).EMG.RMG = rms(concatenate(gait.(fields{i}).EMG.RMG,onset.(fields{i}).EMG.RMG, ...
            offset.(fields{i}).EMG.RMG));
    else
        rms_val.(fields{i}).EMG.RMG = NaN; % if no bursts, no feature
    end
    
    % LTA
    nans = isnan(offset.(fields{i}).EMG.LTA);    
    if isempty(nans(nans == 1))
        
        % Root mean square measurement 
        rms_val.(fields{i}).EMG.LTA = rms(concatenate(gait.(fields{i}).EMG.LTA,onset.(fields{i}).EMG.LTA, ...
            offset.(fields{i}).EMG.LTA));
    else
        rms_val.(fields{i}).EMG.LTA = NaN; % if no bursts, no feature
    end
    
    % RTA
    nans = isnan(offset.(fields{i}).EMG.RTA);    
    if isempty(nans(nans == 1))
        
        % Root mean square measurement 
        rms_val.(fields{i}).EMG.RTA = rms(concatenate(gait.(fields{i}).EMG.LMG,onset.(fields{i}).EMG.RTA, ...
            offset.(fields{i}).EMG.RTA));
    else
        rms_val.(fields{i}).EMG.RTA = NaN; % if no bursts, no feature
    end
    
end

end

