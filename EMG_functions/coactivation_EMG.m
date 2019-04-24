function [coactivation] = coactivation_EMG(onset,offset,gait)


fields = fieldnames(onset);
for i = 1:numel(fields)   
    if ~isnan(onset.(fields{i}).EMG.LMG) &&  ~isnan(onset.(fields{i}).EMG.LTA)
        coactivation.(fields{i}).EMG.Left = sum(ismember(onset.(fields{i}).EMG.LMG(1): ... 
            offset.(fields{i}).EMG.LMG(1), onset.(fields{i}).EMG.LTA(1): ... 
            offset.(fields{i}).EMG.LTA(1)))/length(gait.(fields{i}).EMG.LMG);

    else
        coactivation.(fields{i}).EMG.Left = NaN;
    end
    
        
    if ~isnan(onset.(fields{i}).EMG.RMG) &&  ~isnan(onset.(fields{i}).EMG.RTA)
        coactivation.(fields{i}).EMG.Right = sum(ismember(onset.(fields{i}).EMG.RMG(1): ... 
            offset.(fields{i}).EMG.RMG(1), onset.(fields{i}).EMG.RTA(1): ... 
            offset.(fields{i}).EMG.RTA(1)))/length(gait.(fields{i}).EMG.RMG);
    else
        coactivation.(fields{i}).EMG.Right = NaN;
    end   
end

end

