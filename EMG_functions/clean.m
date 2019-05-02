function [onset,offset] = clean(onset,offset,window)
% Clean detected onset and offsets by merging bursts less than 250 samples
% apart

threshold = window;

% selection based on interval between bursts
if length(onset) >= 2
    interval = onset(2:end) - offset(1:end-1);
    index = interval > threshold;
    onset = onset(logical([1 index]));
    offset = offset(logical([index 1]));
end

if isempty(onset)
    onset = NaN;
end
if isempty(offset)
    offset = NaN;
end

end

