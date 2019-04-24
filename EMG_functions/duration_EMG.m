function [duration] = duration_EMG(onset,offset)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

fields = fieldnames(onset);

for i = 1:numel(fields)

    if ~isnan(offset.(fields{i}).EMG.LMG) && length(offset.(fields{i}).EMG.LMG) == length(onset.(fields{i}).EMG.LMG)
        duration.(fields{i}).EMG.LMG = offset.(fields{i}).EMG.LMG - onset.(fields{i}).EMG.LMG;
    else
        duration.(fields{i}).EMG.LMG = NaN;
    end
    
    if ~isnan(offset.(fields{i}).EMG.RMG) && length(offset.(fields{i}).EMG.RMG) == length(onset.(fields{i}).EMG.RMG)
        duration.(fields{i}).EMG.RMG = offset.(fields{i}).EMG.RMG - onset.(fields{i}).EMG.RMG;
    else
        duration.(fields{i}).EMG.RMG = NaN;
    end
    
    if ~isnan(offset.(fields{i}).EMG.LTA) && length(offset.(fields{i}).EMG.LTA) == length(onset.(fields{i}).EMG.LTA)
        duration.(fields{i}).EMG.LTA = offset.(fields{i}).EMG.LTA - onset.(fields{i}).EMG.LTA;
    else
        duration.(fields{i}).EMG.LTA = NaN;
    end
    
    if ~isnan(offset.(fields{i}).EMG.RTA) && length(offset.(fields{i}).EMG.RTA) == length(onset.(fields{i}).EMG.RTA)
        duration.(fields{i}).EMG.RTA = offset.(fields{i}).EMG.RTA - onset.(fields{i}).EMG.RTA;
    else
        duration.(fields{i}).EMG.RTA = NaN;
    end
end

end

