function [onset,offset] = clean(onset,offset,window)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
threshold = window;
threshold2 = window;

% selection based on interval between bursts
if length(onset) >= 2
    interval = onset(2:end) - offset(1:end-1);
    index = interval > threshold2;
    onset = onset(logical([1 index]));
    offset = offset(logical([index 1]));
end

if length(onset) >= 2
    duration = offset - onset;
    [~,index] = max(duration);
    onset = onset(index);
    offset = offset(index);
end

if isempty(onset)
    onset = NaN;
end
if isempty(offset)
    offset = NaN;
end

end

