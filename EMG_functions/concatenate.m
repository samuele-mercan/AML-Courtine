function [emg] = concatenate(gait,onset,offset)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

emg = [];
for i = 1:length(onset)
    emg = [emg;gait(onset(i):offset(i))];
end
end

