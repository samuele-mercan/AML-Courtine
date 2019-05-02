function [onset_index,offset_index] = detect(data)
% 
%   Detailed explanation goes here
onset_index = [];
offset_index = [];

if ~isempty(data)
    %threshold = mean(data) + std(data);
    threshold = 0.5 * (max(data) - min(data)) + min(data);
    data(data >= threshold) =1;
    data(data ~= 1) =0;
    thresholded = diff(data);
    [onset_index] = find(thresholded == 1);
    [offset_index] = find(thresholded == -1);
    
    if data(1) == 1
        onset_index = [1 onset_index];
    end
    if data(end) == 1
        offset_index = [offset_index length(data)];
    end
    
    
end
  

end

