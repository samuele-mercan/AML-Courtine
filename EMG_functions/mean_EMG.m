function [mean_val] = mean_EMG(onset,offset,gait)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


fields = fieldnames(onset);
for i = 1:numel(fields)
    
    if ~isnan(onset.(fields{i}).EMG.LMG)
        mean_val.(fields{i}).EMG.LMG = mean(gait.(fields{i}).EMG.LMG(onset.(fields{i}).EMG.LMG(1): ...
            offset.(fields{i}).EMG.LMG(1)));
    else
        mean_val.(fields{i}).EMG.LMG = NaN;
    end
    
        
    if ~isnan(onset.(fields{i}).EMG.RMG)
        mean_val.(fields{i}).EMG.RMG = mean(gait.(fields{i}).EMG.RMG(onset.(fields{i}).EMG.RMG(1): ...
            offset.(fields{i}).EMG.RMG(1)));
    else
        mean_val.(fields{i}).EMG.RMG = NaN;
    end
    
        
    if ~isnan(onset.(fields{i}).EMG.LTA)
        mean_val.(fields{i}).EMG.LTA = mean(gait.(fields{i}).EMG.LTA(onset.(fields{i}).EMG.LTA(1): ...
            offset.(fields{i}).EMG.LTA(1)));
    else
        mean_val.(fields{i}).EMG.LTA = NaN;
    end
    
        
    if ~isnan(onset.(fields{i}).EMG.RTA)
        mean_val.(fields{i}).EMG.RTA = mean(gait.(fields{i}).EMG.RTA(onset.(fields{i}).EMG.RTA(1): ...
            offset.(fields{i}).EMG.RTA(1)));
    else
        mean_val.(fields{i}).EMG.RTA = NaN;
    end
    
end

end
