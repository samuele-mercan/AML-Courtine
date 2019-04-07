function [onset_index,offset_index] = detection_burst(env_EMG)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


onset_index=[];
offset_index=[];

[onset_index.T1.LMG,offset_index.T1.LMG] = detect(env_EMG.T1.LMG);
[onset_index.T1.RMG,offset_index.T1.RMG] = detect(env_EMG.T1.RMG);
[onset_index.T1.LTA,offset_index.T1.LTA] = detect(env_EMG.T1.LTA);
[onset_index.T1.RTA,offset_index.T1.RTA] = detect(env_EMG.T1.RTA);

[onset_index.T2.LMG,offset_index.T2.LMG] = detect(env_EMG.T2.LMG);
[onset_index.T2.RMG,offset_index.T2.RMG] = detect(env_EMG.T2.RMG);
[onset_index.T2.LTA,offset_index.T2.LTA] = detect(env_EMG.T2.LTA);
[onset_index.T2.RTA,offset_index.T2.RTA] = detect(env_EMG.T2.RTA);

[onset_index.T3.LMG,offset_index.T3.LMG] = detect(env_EMG.T3.LMG);
[onset_index.T3.RMG,offset_index.T3.RMG] = detect(env_EMG.T3.RMG);
[onset_index.T3.LTA,offset_index.T3.LTA] = detect(env_EMG.T3.LTA);
[onset_index.T3.RTA,offset_index.T3.RTA] = detect(env_EMG.T3.RTA);

end

