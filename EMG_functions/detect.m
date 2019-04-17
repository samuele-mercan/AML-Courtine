function [onset_index,offset_index] = detect(data)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

threshold = mean(data) + 2*std(data);
data(data >= threshold) =1;
data(data ~= 1) =0;
thresholded = diff(data);
[onset_index] = find(thresholded == 1);
[offset_index] = find(thresholded == -1);

end

