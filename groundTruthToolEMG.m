
[GaitCyclesFloat1,GaitCyclesNoFloat1] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject1_2018/FLOAT/S1_FLOAT.mat', ...
    'Healthy Recordings/Subject1_2018/NO_FLOAT/S1_NO_FLOAT.mat',...
    'HealthyGaitEvents/2018_S1_FLOAT.mat', 'HealthyGaitEvents/2018_S1_NO_FLOAT.mat',leftFoot);

data = GaitCyclesFloat1;
fields = fieldnames(data);

for i = 1:numel(fields)    
    fields2 = fieldnames(data.(fields{i}).EMG);
    for j = 1:4
        figure()
        hold on
        title(strcat(fields2{j}))
        plot(data.(fields{i}).EMG.(fields2{j}));
        [Onsets.(fields{i}).EMG.(fields2{j}), ~] = ginput;
        [Offsets.(fields{i}).EMG.(fields2{j}), ~] = ginput;
    end
end

save([pwd,'/GroundTruthBursts/2018_S1_FLOAT.mat'], 'Onsets','Offsets');





