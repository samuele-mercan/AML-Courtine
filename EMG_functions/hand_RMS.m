function [RMS_env] = hand_RMS(data,window)
% Computation of the RMS enveloppe using a specific window size
% Returns enveloppe of the input signal

RMS_env = zeros(1,length(data));

for i = 1:window:length(data) % sliding through the signal
    
    if i >= (length(data)-window)
        RMS_env(i:end) = rms(data(i:end))*ones(1,length(data(i:end)));
    else
        RMS_env(i:i+window-1) = rms(data(i:i+window-1)) * ones(1,window);
    end
end

end

