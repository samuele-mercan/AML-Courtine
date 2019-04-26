
function groundTruthToolEMG(dataName, fileName)

% this tool plots each raw signal for the kinematics with a cursor 
% by looking at the signal, the locations of the gait events are found
% for each signal we find the foot strikes and the foot off 

data = load(dataName);
fields = fieldnames(data);

for i = 1:numel(fields)    
    fields2 = fieldnames(data.(fields{i}));
    for j = 1:4
        figure()
        hold on
        title(strcat(dataName, fields2{j}))
        plot(data.(fields{i}).EMG.(fields2{j}));
        [Onsets.(fields{i}).EMG.(fields2{j}), ~] = ginput;
        [Offsets.(fields{i}).EMG.(fields2{j}), ~] = ginput;
    end
end

save([pwd,'/GroundTruthBursts/2018_S1_FLOAT.mat'], 'Onsets','Offsets');

end



