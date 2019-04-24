function [RMS_env] = hand_RMS(data,window)
% Hand RMS
RMS_env = zeros(1,length(data));
for i = 1:window:length(data)
    if i >= (length(data)-window)
        RMS_env(i:end) = rms(data(i:end))*ones(1,length(data(i:end)));
    else
        RMS_env(i:i+window-1) = rms(data(i:i+window-1)) * ones(1,window);
    end
end
end

