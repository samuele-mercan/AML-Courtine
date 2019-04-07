function [duration] = duration_EMG(onset,offset)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

fields = fieldnames(onset);

for i = 1:numel(fields)
    fields2 = fieldnames(onset.(fields{i}));
    for j = 1:numel(fields2)
        if length(onset.(fields{i}).(fields2{j})) == length(offset.(fields{i}).(fields2{j}))
            duration.(fields{i}).(fields2{j}) = offset.(fields{i}).(fields2{j}) - onset.(fields{i}).(fields2{j});
        else
            disp('Not the same number of onsets and offsets detected')
        end
    end
end

end

