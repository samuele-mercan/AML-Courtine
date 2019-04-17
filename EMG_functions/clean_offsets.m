function [onset,offset] = clean_offsets(onset, offset)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

fields = fieldnames(onset);

for i = 1:length(fields)
 if ~isempty(onset.(fields{i}).EMG.LMG) && ~isempty(offset.(fields{i}).EMG.LMG)
    offset.(fields{i}).EMG.LMG = offset.(fields{i}).EMG.LMG(offset.(fields{i}).EMG.LMG ...
        > onset.(fields{i}).EMG.LMG(1));
    if ~isempty(offset.(fields{i}).EMG.LMG)
        onset.(fields{i}).EMG.LMG = onset.(fields{i}).EMG.LMG(onset.(fields{i}).EMG.LMG ...
            < offset.(fields{i}).EMG.LMG(end));
    else
        offset.(fields{i}).EMG.LMG = [];
        onset.(fields{i}).EMG.LMG = [];
    end
 else
   offset.(fields{i}).EMG.LMG = [];
   onset.(fields{i}).EMG.LMG = [];
   
 end
 
 if ~isempty(onset.(fields{i}).EMG.RMG) && ~isempty(offset.(fields{i}).EMG.RMG)
    offset.(fields{i}).EMG.RMG = offset.(fields{i}).EMG.RMG(offset.(fields{i}).EMG.RMG ...
        > onset.(fields{i}).EMG.RMG(1));
    if ~isempty(offset.(fields{i}).EMG.RMG)
        onset.(fields{i}).EMG.RMG = onset.(fields{i}).EMG.RMG(onset.(fields{i}).EMG.RMG ...
            < offset.(fields{i}).EMG.RMG(end)); 
    else
        offset.(fields{i}).EMG.RMG = [];
        onset.(fields{i}).EMG.RMG = [];
    end
    
 else
   offset.(fields{i}).EMG.RMG = [];
   onset.(fields{i}).EMG.RMG = [];
 end
 
 if ~isempty(onset.(fields{i}).EMG.LTA) && ~isempty(offset.(fields{i}).EMG.LTA)
    offset.(fields{i}).EMG.LTA = offset.(fields{i}).EMG.LTA(offset.(fields{i}).EMG.LTA ...
        > onset.(fields{i}).EMG.LTA(1));
    if  ~isempty(offset.(fields{i}).EMG.LTA)
        onset.(fields{i}).EMG.LTA = onset.(fields{i}).EMG.LTA(onset.(fields{i}).EMG.LTA ...
            < offset.(fields{i}).EMG.LTA(end));
    else
        offset.(fields{i}).EMG.LTA = [];
        onset.(fields{i}).EMG.LTA = [];
    end
 else
   offset.(fields{i}).EMG.LTA = [];
   onset.(fields{i}).EMG.LTA = [];
 end
 
 if ~isempty(onset.(fields{i}).EMG.RTA) && ~isempty(offset.(fields{i}).EMG.RTA)
    offset.(fields{i}).EMG.RTA = offset.(fields{i}).EMG.RTA(offset.(fields{i}).EMG.RTA ...
        > onset.(fields{i}).EMG.RTA(1));
    if ~isempty(offset.(fields{i}).EMG.RTA)
        onset.(fields{i}).EMG.RTA = onset.(fields{i}).EMG.RTA(onset.(fields{i}).EMG.RTA ...
            < offset.(fields{i}).EMG.RTA(end));
    else
        offset.(fields{i}).EMG.RTA = [];
        onset.(fields{i}).EMG.RTA = [];
    end
 else
   offset.(fields{i}).EMG.RTA = [];
   onset.(fields{i}).EMG.RTA = [];
 end
end


end

