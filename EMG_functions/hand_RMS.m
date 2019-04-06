function [RMS_env] = hand_RMS(data,window)
% Hand RMS
RMS_env = [];
for i = 1:length(data)
    if i <= (window/2) 
        RMS_env(i) = rms(data(1:i));
    elseif i >= (length(data)-(window/2))
        RMS_env(i) = rms(data(i:end));
    else
        RMS_env(i) = rms(data(i-(window/2):i+(window/2)));
    end
end
end

