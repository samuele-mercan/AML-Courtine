function [coactivation] = coactivation_EMG(onset,offset,gait)
% Computes coactivation percentage between antagonist muscles on both sides
% Returns structure containing coactivation percentage for each gait cycle

fields = fieldnames(onset);
for i = 1:numel(fields)  % for each gait cycle
    
    % detection of gaits with no bursts on left muscles
    nansLMG = isnan(offset.(fields{i}).EMG.LMG);
    nansLTA = isnan(offset.(fields{i}).EMG.LTA);
    
    % Left side 
    if isempty(nansLMG(nansLMG == 1)) && isempty(nansLTA(nansLTA == 1))
        
        % merge bursts index - LMG
        index_LMG = [];
        for j = 1:length(onset.(fields{i}).EMG.LMG)
            index_LMG = [index_LMG,onset.(fields{i}).EMG.LMG(j): ... 
            offset.(fields{i}).EMG.LMG(j)];
        end
        
        % merge bursts index - LTA
        index_LTA = [];
        for j = 1:length(onset.(fields{i}).EMG.LTA)
            index_LTA = [index_LTA,onset.(fields{i}).EMG.LTA(j): ... 
            offset.(fields{i}).EMG.LTA(j)];
        end
        
        % Compute coactivation
        coactivation.(fields{i}).EMG.Left = sum(ismember(index_LMG,index_LTA))/length(gait.(fields{i}).EMG.LMG);

    else
        coactivation.(fields{i}).EMG.Left = NaN; % if no bursts, no coactivation feature
    end
    
    % detection of gaits with no bursts on right muscles
    nansRMG = isnan(offset.(fields{i}).EMG.RMG);
    nansRTA = isnan(offset.(fields{i}).EMG.RTA); 
    
    % Right Side 
    if isempty(nansRMG(nansRMG == 1)) &&  isempty(nansRTA(nansRTA == 1))
        
        % merge bursts index - RMG
        index_RMG = [];
        for j = 1:length(onset.(fields{i}).EMG.RMG)
            index_RMG = [index_RMG,onset.(fields{i}).EMG.RMG(j): ... 
            offset.(fields{i}).EMG.RMG(j)];
        end
        
        % merge bursts index - RTA
        index_RTA = [];
        for j = 1:length(onset.(fields{i}).EMG.RTA)
            index_RTA = [index_RTA,onset.(fields{i}).EMG.RTA(j): ... 
            offset.(fields{i}).EMG.RTA(j)];
        end  
        
        % Compute coactivation
        coactivation.(fields{i}).EMG.Right = sum(ismember(index_RMG,index_RTA))/length(gait.(fields{i}).EMG.RMG);
    else
        coactivation.(fields{i}).EMG.Right = NaN;  % if no bursts, no coactivation feature
    end   
end

end

