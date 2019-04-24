function [max_val] = max_EMG(onset,offset,gait)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


fields = fieldnames(onset);

for i = 1:numel(fields)
    
    if ~isnan(onset.(fields{i}).EMG.LMG)
        max_val.(fields{i}).EMG.LMG = max(gait.(fields{i}).EMG.LMG(onset.(fields{i}).EMG.LMG(1): ...
            offset.(fields{i}).EMG.LMG(1)));
    else
        max_val.(fields{i}).EMG.LMG = NaN;
    end
    
    if ~isnan(onset.(fields{i}).EMG.RMG)
        max_val.(fields{i}).EMG.RMG = max(gait.(fields{i}).EMG.RMG(onset.(fields{i}).EMG.RMG(1): ...
            offset.(fields{i}).EMG.RMG(1)));
    else
        max_val.(fields{i}).EMG.RMG = NaN;
    end
    
        
    if ~isnan(onset.(fields{i}).EMG.LTA)
        max_val.(fields{i}).EMG.LTA = max(gait.(fields{i}).EMG.LTA(onset.(fields{i}).EMG.LTA(1): ...
            offset.(fields{i}).EMG.LTA(1)));
    else
        max_val.(fields{i}).EMG.LTA = NaN;
    end
    
        
    if ~isnan(onset.(fields{i}).EMG.RTA)
        max_val.(fields{i}).EMG.RTA = max(gait.(fields{i}).EMG.RTA(onset.(fields{i}).EMG.RTA(1): ...
            offset.(fields{i}).EMG.RTA(1)));
    else
        max_val.(fields{i}).EMG.RTA = NaN;
    end
    
end

end

