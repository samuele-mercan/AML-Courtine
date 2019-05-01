function [mean_val] = mean_EMG(onset,offset,gait)
% Mean of bursts measurement 
% Returns structure containing mean value for all bursts and all gaits


fields = fieldnames(onset);
for i = 1:numel(fields)   % for all gait cycles 
    
    % LMG
    nans = isnan(offset.(fields{i}).EMG.LMG);
    if isempty(nans(nans == 1))
        
        % mean of bursts measurement
        mean_val.(fields{i}).EMG.LMG = mean(concatenate(gait.(fields{i}).EMG.LMG,onset.(fields{i}).EMG.LMG, ...
            offset.(fields{i}).EMG.LMG));
    else
        mean_val.(fields{i}).EMG.LMG = NaN; % if no bursts, no features
    end
    
    % RMG
    nans = isnan(offset.(fields{i}).EMG.RMG);   
    if isempty(nans(nans == 1))
        
        % mean of bursts measurement 
        mean_val.(fields{i}).EMG.RMG = mean(concatenate(gait.(fields{i}).EMG.RMG,onset.(fields{i}).EMG.RMG, ...
            offset.(fields{i}).EMG.RMG));
    else
        mean_val.(fields{i}).EMG.RMG = NaN; % if no bursts, no features
    end
    
    % LTA
    nans = isnan(offset.(fields{i}).EMG.LTA);    
    if isempty(nans(nans == 1))
        
        % mean of bursts measurement
        mean_val.(fields{i}).EMG.LTA = mean(concatenate(gait.(fields{i}).EMG.LTA,onset.(fields{i}).EMG.LTA, ...
            offset.(fields{i}).EMG.LTA));
    else
        mean_val.(fields{i}).EMG.LTA = NaN; % if no bursts, no features
    end
    
    % RTA
    nans = isnan(offset.(fields{i}).EMG.RTA);    
    if isempty(nans(nans == 1))
        
        % mean of bursts measurement
        mean_val.(fields{i}).EMG.RTA = mean(concatenate(gait.(fields{i}).EMG.RTA,onset.(fields{i}).EMG.RTA, ...
            offset.(fields{i}).EMG.RTA));
    else
        mean_val.(fields{i}).EMG.RTA = NaN; % if no bursts, no features
    end
    
end

end
