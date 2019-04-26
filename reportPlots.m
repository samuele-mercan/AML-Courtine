function reportPlots()

    load('Healthy Recordings/Subject3_2019/NO_FLOAT/S3_NO_FLOAT.mat');
    load('HealthyGaitEvents/2019_S3_NO_FLOAT.mat');
    
    figure()
    hold on
    
    time_start = 0;
    time_end = (length(S3_NO_FLOAT.T_02.Raw.Kin.LANK(:,3))-1)/S3_NO_FLOAT.T_02.fsKin;
    time_step = 1/S3_NO_FLOAT.T_02.fsKin;
    time = time_start:time_step:time_end;
    
    plot(time, S3_NO_FLOAT.T_02.Raw.Kin.LHIP(:,3));
    plot(time, S3_NO_FLOAT.T_02.Raw.Kin.LKNE(:,3));
    plot(time, S3_NO_FLOAT.T_02.Raw.Kin.LANK(:,3));
    plot(time, S3_NO_FLOAT.T_02.Raw.Kin.LTOE(:,3));
    
    
    for idx = 1 : length(gaitEvents.T02_FS_left)
        plot([gaitEvents.T02_FS_left(idx) gaitEvents.T02_FS_left(idx)], [0 1200], '-k', 'LineWidth', 1);
    end
    
    legend('Hip z-axis', 'Knee z-axis', 'Ankle z-axis', 'Toe z-axis', 'Gait Cycles');
    
    xlim([0 time_end])   
    ylim([0 1200])
    
    figure()
    
    % Stick diagram 
    
    hold on
    
    for j=1:length(S3_NO_FLOAT.T_02.Raw.Kin.LHIP(:,1))
        
        x = [S3_NO_FLOAT.T_02.Raw.Kin.LHIP(j,1) S3_NO_FLOAT.T_02.Raw.Kin.LKNE(j,1) S3_NO_FLOAT.T_02.Raw.Kin.LANK(j,1) S3_NO_FLOAT.T_02.Raw.Kin.LTOE(j,1)];
        z = [S3_NO_FLOAT.T_02.Raw.Kin.LHIP(j,3) S3_NO_FLOAT.T_02.Raw.Kin.LKNE(j,3) S3_NO_FLOAT.T_02.Raw.Kin.LANK(j,3) S3_NO_FLOAT.T_02.Raw.Kin.LTOE(j,3)];

        plot(x,z, '-b');
        
    end
    
    
    figure()
    
    hold on
    
    time_start = 0;
    time_end = (length(S3_NO_FLOAT.T_02.Raw.EMG.LTA)-1)/S3_NO_FLOAT.T_02.fsEMG;
    time_step = 1/S3_NO_FLOAT.T_02.fsEMG;
    time = time_start:time_step:time_end;
    
    plot(time, S3_NO_FLOAT.T_02.Raw.EMG.LTA, '-r');
    plot(time, S3_NO_FLOAT.T_02.Raw.EMG.LMG, '-b');
    
    for idx = 1 : length(gaitEvents.T02_FS_left)
        plot([gaitEvents.T02_FS_left(idx) gaitEvents.T02_FS_left(idx)], [-12e-5 8e-5], '-k', 'LineWidth', 1);
    end
    
    legend('Left TA','Left MG', 'Gait cycles');
    
    xlim([0 time_end])   
    ylim([-12e-5 8e-5])
    
end
