function GroundTruthToolEMG(data,fileName)

    % manual detection of the onset and offset of bursts of each muscle for
    % each gait cycle

    fields = fieldnames(data);

    for i = 1:numel(fields) % for each gait cycle   
        fields2 = fieldnames(data.(fields{i}).EMG); % muscles names
        for j = 1:4 % for each muscle for right and left legs (RTA, LTA, RMG, LMG)
            figure()
            hold on
            title(strcat(fields2{j}))
            plot(data.(fields{i}).EMG.(fields2{j}));
            [Onsets.(fields{i}).EMG.(fields2{j}), ~] = ginput;
            [Offsets.(fields{i}).EMG.(fields2{j}), ~] = ginput;
        end
    end

    save([pwd,fileName], 'Onsets','Offsets');
    close all

end

