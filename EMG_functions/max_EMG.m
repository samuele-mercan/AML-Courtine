function [max_val] = max_EMG(onset,offset,gait)
% Max value of bursts measurement 
% Returns structure containing max of all bursts for all gait cycles


fields = fieldnames(onset);

for i = 1:numel(fields) % for all gait cycles
    
    % LMG
    nans = isnan(offset.(fields{i}).EMG.LMG);
    if isempty(nans(nans == 1))
        
        % max of bursts measurement 
        max_val.(fields{i}).EMG.LMG = max(concatenate(gait.(fields{i}).EMG.LMG,onset.(fields{i}).EMG.LMG, ...
            offset.(fields{i}).EMG.LMG));
    else
        max_val.(fields{i}).EMG.LMG = NaN; % if no bursts, no features
    end
    
    % RMG
    nans = isnan(offset.(fields{i}).EMG.RMG);
    if isempty(nans(nans == 1))
        
        % max of bursts measurement 
        max_val.(fields{i}).EMG.RMG = max(concatenate(gait.(fields{i}).EMG.RMG,onset.(fields{i}).EMG.RMG, ...
            offset.(fields{i}).EMG.RMG));
    else
        max_val.(fields{i}).EMG.RMG = NaN; % if no bursts, no features
    end
    
    % LTA
    nans = isnan(offset.(fields{i}).EMG.LTA);   
    if isempty(nans(nans == 1))
        
        % max of bursts measurement 
        max_val.(fields{i}).EMG.LTA = max(concatenate(gait.(fields{i}).EMG.LTA,onset.(fields{i}).EMG.LTA, ...
            offset.(fields{i}).EMG.LTA));
    else
        max_val.(fields{i}).EMG.LTA = NaN; % if no bursts, no features
    end
    
    % RTA
    nans = isnan(offset.(fields{i}).EMG.RTA);    
    if isempty(nans(nans == 1))
        
        % max of bursts measurement 
        max_val.(fields{i}).EMG.RTA = max(concatenate(gait.(fields{i}).EMG.RTA,onset.(fields{i}).EMG.RTA, ...
            offset.(fields{i}).EMG.RTA));
    else
        max_val.(fields{i}).EMG.RTA = NaN; % if no bursts, no features
    end
    
end

end

