function [rms_val] = rms_EMG(onset,offset,gait)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here


fields = fieldnames(onset);
for i = 1:numel(fields)
    
    if ~isempty(onset.(fields{i}).EMG.LMG)
        rms_val.(fields{i}).EMG.LMG = rms(gait.(fields{i}).EMG.LMG(onset.(fields{i}).EMG.LMG(1): ...
            offset.(fields{i}).EMG.LMG(1)));
    else
        rms_val.(fields{i}).EMG.LMG = [];
    end
    
        
    if ~isempty(onset.(fields{i}).EMG.RMG)
        rms_val.(fields{i}).EMG.RMG = rms(gait.(fields{i}).EMG.RMG(onset.(fields{i}).EMG.RMG(1): ...
            offset.(fields{i}).EMG.RMG(1)));
    else
        rms_val.(fields{i}).EMG.RMG = [];
    end
    
        
    if ~isempty(onset.(fields{i}).EMG.LTA)
        rms_val.(fields{i}).EMG.LTA = rms(gait.(fields{i}).EMG.LTA(onset.(fields{i}).EMG.LTA(1): ...
            offset.(fields{i}).EMG.LTA(1)));
    else
        rms_val.(fields{i}).EMG.LTA = [];
    end
    
        
    if ~isempty(onset.(fields{i}).EMG.RTA)
        rms_val.(fields{i}).EMG.RTA = rms(gait.(fields{i}).EMG.RTA(onset.(fields{i}).EMG.RTA(1): ...
            offset.(fields{i}).EMG.RTA(1)));
    else
        rms_val.(fields{i}).EMG.RTA = [];
    end
    
end

end

