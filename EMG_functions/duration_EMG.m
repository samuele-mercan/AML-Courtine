function [duration] = duration_EMG(onset,offset)
%Duration of burst measurement 
% Returns structure containing duration of each burst for each gait cycle

fields = fieldnames(onset);

for i = 1:numel(fields) % for each gait cycle 
    
    % LMG
    nans = isnan(offset.(fields{i}).EMG.LMG); % detection of nan
    if isempty(nans(nans == 1)) && length(offset.(fields{i}).EMG.LMG) == length(onset.(fields{i}).EMG.LMG)
        %measurement of duration
        duration.(fields{i}).EMG.LMG = sum(offset.(fields{i}).EMG.LMG - onset.(fields{i}).EMG.LMG);
    else
        duration.(fields{i}).EMG.LMG = NaN; % if no burst detected, no feature
    end
    
    % RMG
    nans = isnan(offset.(fields{i}).EMG.RMG); % detection of nan
    if isempty(nans(nans == 1)) && length(offset.(fields{i}).EMG.RMG) == length(onset.(fields{i}).EMG.RMG)
        %measurement of duration
        duration.(fields{i}).EMG.RMG = sum(offset.(fields{i}).EMG.RMG - onset.(fields{i}).EMG.RMG);
    else
        duration.(fields{i}).EMG.RMG = NaN; % if no burst detected, no feature
    end
    
    %LTA
    nans = isnan(offset.(fields{i}).EMG.LTA); % detection of nan 
    if isempty(nans(nans == 1)) && length(offset.(fields{i}).EMG.LTA) == length(onset.(fields{i}).EMG.LTA)
        %measurement of duration
        duration.(fields{i}).EMG.LTA = sum(offset.(fields{i}).EMG.LTA - onset.(fields{i}).EMG.LTA);
    else
        duration.(fields{i}).EMG.LTA = NaN; % if no burst detected, no feature
    end
    
    %RTA
    nans = isnan(offset.(fields{i}).EMG.RTA); % detection of nan
    if isempty(nans(nans == 1)) && length(offset.(fields{i}).EMG.RTA) == length(onset.(fields{i}).EMG.RTA)
        %measurement of duration
        duration.(fields{i}).EMG.RTA = sum(offset.(fields{i}).EMG.RTA - onset.(fields{i}).EMG.RTA);
    else
        duration.(fields{i}).EMG.RTA = NaN; % if no burst detected, no feature
    end
end

end

