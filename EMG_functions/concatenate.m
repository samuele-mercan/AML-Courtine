function [emg] = concatenate(gait,onset,offset)
% Returns emg signal of all bursts concatenated 

emg = [];
for i = 1:length(onset)
    emg = [emg;gait(onset(i):offset(i))];
end

end

