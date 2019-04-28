function [mean_val] = mean_EMG(onset,offset,gait)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


fields = fieldnames(onset);
for i = 1:numel(fields)
    
    nans = isnan(offset.(fields{i}).EMG.LMG);
    if isempty(nans(nans == 1))
        mean_val.(fields{i}).EMG.LMG = mean(concatenate(gait.(fields{i}).EMG.LMG,onset.(fields{i}).EMG.LMG, ...
            offset.(fields{i}).EMG.LMG));
    else
        mean_val.(fields{i}).EMG.LMG = NaN;
    end
    
    nans = isnan(offset.(fields{i}).EMG.RMG);   
    if isempty(nans(nans == 1))
        mean_val.(fields{i}).EMG.RMG = mean(concatenate(gait.(fields{i}).EMG.RMG,onset.(fields{i}).EMG.RMG, ...
            offset.(fields{i}).EMG.RMG));
    else
        mean_val.(fields{i}).EMG.RMG = NaN;
    end
    
    nans = isnan(offset.(fields{i}).EMG.LTA);    
    if isempty(nans(nans == 1))
        mean_val.(fields{i}).EMG.LTA = mean(concatenate(gait.(fields{i}).EMG.LTA,onset.(fields{i}).EMG.LTA, ...
            offset.(fields{i}).EMG.LTA));
    else
        mean_val.(fields{i}).EMG.LTA = NaN;
    end
    
    nans = isnan(offset.(fields{i}).EMG.RTA);    
    if isempty(nans(nans == 1))
        mean_val.(fields{i}).EMG.RTA = mean(concatenate(gait.(fields{i}).EMG.RTA,onset.(fields{i}).EMG.RTA, ...
            offset.(fields{i}).EMG.RTA));
    else
        mean_val.(fields{i}).EMG.RTA = NaN;
    end
    
end

end
