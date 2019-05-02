function [count] = count_bursts(onsets,offsets)
% Count the number of bursts detected in ground truth
% Returns an integer

fields = fieldnames(onsets);
count = 0;

for i = 1:length(fields)  % for all gait
    fields2 = fieldnames(onsets.(fields{i}).EMG);
    for j = 1:length(fields2)  % for all muscles   
        % we consider that sometimes, the number of offset and onsets are
        % not the same (human error during GT creation), we consider the
        % max between onsets and offsets
        count = count + max(length(onsets.(fields{i}).EMG.(fields2{j})),length(offsets.(fields{i}).EMG.(fields2{j})));
    end
end
end

