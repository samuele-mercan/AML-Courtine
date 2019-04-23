function [gait_params] = extract_EMG(duration,mean_emg,max_emg,rms_emg,coactivation)

gait_params = [];
fields = fieldnames(duration);
for i = 1:numel(fields)
    
    gait_params(end,:) = [duration.(fields{i}).EMG.LMG,duration.(fields{i}).EMG.RMG,duration.(fields{i}).EMG.LTA, ...
        duration.(fields{i}).EMG.RTA, mean_emg.(fields{i}).EMG.LMG, mean_emg.(fields{i}).EMG.RMG, mean_emg.(fields{i}).EMG.LTA, ...
        mean_emg.(fields{i}).EMG.RTA, max_emg.(fields{i}).EMG.LMG, max_emg.(fields{i}).EMG.RMG, max_emg.(fields{i}).EMG.LTA, ...
        max_emg.(fields{i}).EMG.RTA, rms_emg.(fields{i}).EMG.LMG, rms_emg.(fields{i}).EMG.RMG, rms_emg.(fields{i}).EMG.LTA, ...
        rms_emg.(fields{i}).EMG.RTA, coactivation.(fields{i}).EMG.Left, coactivation(fields{i}).EMG.Right]; 
    
end

end

