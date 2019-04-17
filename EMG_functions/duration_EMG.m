function [duration] = duration_EMG(onset,offset)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

fields = fieldnames(onset);

for i = 1:numel(fields)
    if ~isempty(offset.(fields{i}).EMG.LMG) && length(offset.(fields{i}).EMG.LMG) == length(onset.(fields{i}).EMG.LMG)
        duration.(fields{i}).EMG.LMG = offset.(fields{i}).EMG.LMG - onset.(fields{i}).EMG.LMG;
    else
        duration.(fields{i}).EMG.LMG = [];
        disp(['Not same number of off sets than onsets LMG'])
    end
    
    if ~isempty(offset.(fields{i}).EMG.RMG) && length(offset.(fields{i}).EMG.RMG) == length(onset.(fields{i}).EMG.RMG)
        duration.(fields{i}).EMG.RMG = offset.(fields{i}).EMG.RMG - onset.(fields{i}).EMG.RMG;
    else
        duration.(fields{i}).EMG.RMG = [];
        disp(['Not same number of off sets than onsets RMG'])
    end
    
    if ~isempty(offset.(fields{i}).EMG.LTA) && length(offset.(fields{i}).EMG.LTA) == length(onset.(fields{i}).EMG.LTA)
        duration.(fields{i}).EMG.LTA = offset.(fields{i}).EMG.LTA - onset.(fields{i}).EMG.LTA;
    else
        duration.(fields{i}).EMG.LTA = [];
        disp(['Not same number of off sets than onsets LTA'])
    end
    
    if ~isempty(offset.(fields{i}).EMG.RTA) && length(offset.(fields{i}).EMG.RTA) == length(onset.(fields{i}).EMG.RTA)
        duration.(fields{i}).EMG.RTA = offset.(fields{i}).EMG.RTA - onset.(fields{i}).EMG.RTA;
    else
        duration.(fields{i}).EMG.RTA = [];
        disp(['Not same number of off sets than onsets RTA'])
    end
end

end

