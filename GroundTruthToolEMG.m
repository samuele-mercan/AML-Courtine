function GroundTruthToolEMG(data,fileName)

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

    save([pwd,fileName], 'Onsets','Offsets');
    close all

end

