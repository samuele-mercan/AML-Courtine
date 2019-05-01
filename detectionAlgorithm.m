function detectionAlgorithm(dataFile, fileName)

% Algorithm that detects the gait events, it finds the Foot strikes and Foot offs %

    data = load(dataFile);
    fields = fieldnames(data);
    
    % the detection is done using the y-axis of the kinematic signal of the
    % toe 
    % Find the location of the plateaus, this flat portion of the signal
    % are the stance phases
    
    %% LEFT FOOT, T_01
    
    time_start = 0;
    time_end = (length(data.(fields{1}).T_01.Raw.Kin.LTOE(:,2))-1)/data.(fields{1}).T_01.fsKin;
    time_step = 1/data.(fields{1}).T_01.fsKin;
    time = time_start:time_step:time_end;
    
    [pks, locks] = findpeaks(data.(fields{1}).T_01.Raw.Kin.LTOE(:,2),'MinPeakDistance',100);

    T01_FootStrikes_left = [];
    T01_FootOffs_left = [];
    
    for j=1:length(pks)
        
        stancePos = [];
        
        for i=1:length(data.(fields{1}).T_01.Raw.Kin.LTOE(:,2))
            if abs(data.(fields{1}).T_01.Raw.Kin.LTOE(i,2) - pks(j))<= 30
                stancePos = [stancePos i];
            end   
        end
        
        T01_FootStrikes_left = [T01_FootStrikes_left time(stancePos(1))];
        T01_FootOffs_left = [T01_FootOffs_left time(stancePos(end))];

    end
    
    GaitEvents = [T01_FootStrikes_left(1) T01_FootOffs_left(1)];
    
    for index=2:length(T01_FootStrikes_left)
        if T01_FootStrikes_left(index) > GaitEvents(end) && T01_FootOffs_left(index) > T01_FootStrikes_left(index) && index < length(T01_FootOffs_left)
            GaitEvents = [GaitEvents T01_FootStrikes_left(index) T01_FootOffs_left(index)];
        elseif T01_FootStrikes_left(index) > GaitEvents(end) && T01_FootOffs_left(index) > T01_FootStrikes_left(index) && index > length(T01_FootOffs_left)
            GaitEvents = [GaitEvents T01_FootStrikes_left(index)];
        end
    end
    
    T01_FootStrikes_left = GaitEvents(1:2:end);
    T01_FootOffs_left = GaitEvents(2:2:end);
    
    %% LEFT FOOT, T_02
    
    time_start = 0;
    time_end = (length(data.(fields{1}).T_02.Raw.Kin.LTOE(:,2))-1)/data.(fields{1}).T_02.fsKin;
    time_step = 1/data.(fields{1}).T_02.fsKin;
    time = time_start:time_step:time_end;
    
    [pks, locks] = findpeaks(data.(fields{1}).T_02.Raw.Kin.LTOE(:,2),'MinPeakDistance',100);

    T02_FootStrikes_left = [];
    T02_FootOffs_left = [];
    
    for j=1:length(pks)
        
        stancePos = [];
        
        for i=1:length(data.(fields{1}).T_02.Raw.Kin.LTOE(:,2))
            if abs(data.(fields{1}).T_02.Raw.Kin.LTOE(i,2) - pks(j))<= 30
                stancePos = [stancePos i];
            end   
        end
        
        T02_FootStrikes_left = [T02_FootStrikes_left time(stancePos(1))];
        T02_FootOffs_left = [T02_FootOffs_left time(stancePos(end))];
        
    end
    
    GaitEvents = [T02_FootStrikes_left(1) T02_FootOffs_left(1)];
    
    for index=2:length(T02_FootStrikes_left)
        if T02_FootStrikes_left(index) > GaitEvents(end) && T02_FootOffs_left(index) > T02_FootStrikes_left(index) && index < length(T02_FootOffs_left)
            GaitEvents = [GaitEvents T02_FootStrikes_left(index) T02_FootOffs_left(index)];
        elseif T02_FootStrikes_left(index) > GaitEvents(end) && T02_FootOffs_left(index) > T02_FootStrikes_left(index) && index > length(T02_FootOffs_left)
            GaitEvents = [GaitEvents T02_FootStrikes_left(index)];
        end
    end
    
    T02_FootStrikes_left = GaitEvents(1:2:end);
    T02_FootOffs_left = GaitEvents(2:2:end);
    
    %% LEFT FOOT, T_03
    
    time_start = 0;
    time_end = (length(data.(fields{1}).T_03.Raw.Kin.LTOE(:,2))-1)/data.(fields{1}).T_03.fsKin;
    time_step = 1/data.(fields{1}).T_03.fsKin;
    time = time_start:time_step:time_end;
    
    [pks, locks] = findpeaks(data.(fields{1}).T_03.Raw.Kin.LTOE(:,2),'MinPeakDistance',100);

    T03_FootStrikes_left = [];
    T03_FootOffs_left = [];
    
    for j=1:length(pks)
        
        stancePos = [];
        
        for i=1:length(data.(fields{1}).T_03.Raw.Kin.LTOE(:,2))
            if abs(data.(fields{1}).T_03.Raw.Kin.LTOE(i,2) - pks(j))<= 30
                stancePos = [stancePos i];
            end   
        end
        
        T03_FootStrikes_left = [T03_FootStrikes_left time(stancePos(1))];
        T03_FootOffs_left = [T03_FootOffs_left time(stancePos(end))];
        
    end
    
    GaitEvents = [T03_FootStrikes_left(1) T03_FootOffs_left(1)];
    
    for index=2:length(T03_FootStrikes_left)
        if T03_FootStrikes_left(index) > GaitEvents(end) && T03_FootOffs_left(index) > T03_FootStrikes_left(index) && index < length(T03_FootOffs_left)
            GaitEvents = [GaitEvents T03_FootStrikes_left(index) T03_FootOffs_left(index)];
        elseif T03_FootStrikes_left(index) > GaitEvents(end) && T03_FootOffs_left(index) > T03_FootStrikes_left(index) && index > length(T03_FootOffs_left)
            GaitEvents = [GaitEvents T03_FootStrikes_left(index)];
        end
    end
    
    T03_FootStrikes_left = GaitEvents(1:2:end);
    T03_FootOffs_left = GaitEvents(2:2:end);
    
    %% RIGHT FOOT, T_01
    
    time_start = 0;
    time_end = (length(data.(fields{1}).T_01.Raw.Kin.RTOE(:,2))-1)/data.(fields{1}).T_01.fsKin;
    time_step = 1/data.(fields{1}).T_01.fsKin;
    time = time_start:time_step:time_end;
    
    [pks, locks] = findpeaks(data.(fields{1}).T_01.Raw.Kin.RTOE(:,2),'MinPeakDistance',100);

    T01_FootStrikes_right = [];
    T01_FootOffs_right = [];
    
    for j=1:length(pks)
        
        stancePos = [];
        
        for i=1:length(data.(fields{1}).T_01.Raw.Kin.RTOE(:,2))
            if abs(data.(fields{1}).T_01.Raw.Kin.RTOE(i,2) - pks(j))<= 30
                stancePos = [stancePos i];
            end   
        end
        
        T01_FootStrikes_right = [T01_FootStrikes_right time(stancePos(1))];
        T01_FootOffs_right = [T01_FootOffs_right time(stancePos(end))];
        
    end
    
    GaitEvents = [T01_FootStrikes_right(1) T01_FootOffs_right(1)];
    
    for index=2:length(T01_FootStrikes_right)
        if T01_FootStrikes_right(index) > GaitEvents(end) && T01_FootOffs_right(index) > T01_FootStrikes_right(index) && index < length(T01_FootOffs_right)
            GaitEvents = [GaitEvents T01_FootStrikes_right(index) T01_FootOffs_right(index)];
        elseif T01_FootStrikes_right(index) > GaitEvents(end) && T01_FootOffs_right(index) > T01_FootStrikes_right(index) && index > length(T01_FootOffs_right)
            GaitEvents = [GaitEvents T01_FootStrikes_right(index)];
        end
    end
    
    T01_FootStrikes_right = GaitEvents(1:2:end);
    T01_FootOffs_right = GaitEvents(2:2:end);
    
    %% RIGHT FOOT, T_02
    
    time_start = 0;
    time_end = (length(data.(fields{1}).T_02.Raw.Kin.RTOE(:,2))-1)/data.(fields{1}).T_02.fsKin;
    time_step = 1/data.(fields{1}).T_02.fsKin;
    time = time_start:time_step:time_end;
    
    [pks, locks] = findpeaks(data.(fields{1}).T_02.Raw.Kin.RTOE(:,2),'MinPeakDistance',100);

    T02_FootStrikes_right = [];
    T02_FootOffs_right = [];
    
    for j=1:length(pks)
        
        stancePos = [];
        
        for i=1:length(data.(fields{1}).T_02.Raw.Kin.RTOE(:,2))
            if abs(data.(fields{1}).T_02.Raw.Kin.RTOE(i,2) - pks(j))<= 30
                stancePos = [stancePos i];
            end   
        end
        
        T02_FootStrikes_right = [T02_FootStrikes_right time(stancePos(1))];
        T02_FootOffs_right = [T02_FootOffs_right time(stancePos(end))];
        
    end
    
    GaitEvents = [T02_FootStrikes_right(1) T02_FootOffs_right(1)];
    
    for index=2:length(T02_FootStrikes_right)
        if T02_FootStrikes_right(index) > GaitEvents(end) && T02_FootOffs_right(index) > T02_FootStrikes_right(index) && index < length(T02_FootOffs_right)
            GaitEvents = [GaitEvents T02_FootStrikes_right(index) T02_FootOffs_right(index)];
        elseif T02_FootStrikes_right(index) > GaitEvents(end) && T02_FootOffs_right(index) > T02_FootStrikes_right(index) && index > length(T02_FootOffs_right)
            GaitEvents = [GaitEvents T02_FootStrikes_right(index)];
        end
    end
    
    T02_FootStrikes_right = GaitEvents(1:2:end);
    T02_FootOffs_right = GaitEvents(2:2:end);
    
    %% RIGHT FOOT, T_03
    
    time_start = 0;
    time_end = (length(data.(fields{1}).T_03.Raw.Kin.RTOE(:,2))-1)/data.(fields{1}).T_03.fsKin;
    time_step = 1/data.(fields{1}).T_03.fsKin;
    time = time_start:time_step:time_end;
    
    [pks, locks] = findpeaks(data.(fields{1}).T_03.Raw.Kin.RTOE(:,2),'MinPeakDistance',100);

    T03_FootStrikes_right = [];
    T03_FootOffs_right = [];
    
    for j=1:length(pks)
        
        stancePos = [];
        
        for i=1:length(data.(fields{1}).T_03.Raw.Kin.RTOE(:,2))
            if abs(data.(fields{1}).T_03.Raw.Kin.RTOE(i,2) - pks(j))<= 30
                stancePos = [stancePos i];
            end   
        end
        
        T03_FootStrikes_right = [T03_FootStrikes_right time(stancePos(1))];
        T03_FootOffs_right = [T03_FootOffs_right time(stancePos(end))];
        
    end
    
    GaitEvents = [T03_FootStrikes_right(1) T03_FootOffs_right(1)];
    
    for index=2:length(T03_FootStrikes_right)
        if T03_FootStrikes_right(index) > GaitEvents(end) && T03_FootOffs_right(index) > T03_FootStrikes_right(index) && index < length(T03_FootOffs_right)
            GaitEvents = [GaitEvents T03_FootStrikes_right(index) T03_FootOffs_right(index)];
        elseif T03_FootStrikes_right(index) > GaitEvents(end) && T03_FootOffs_right(index) > T03_FootStrikes_right(index) && index > length(T03_FootOffs_right)
            GaitEvents = [GaitEvents T03_FootStrikes_right(index)];
        end
    end
    
    T03_FootStrikes_right = GaitEvents(1:2:end);
    T03_FootOffs_right = GaitEvents(2:2:end);
    
    % Structure to output the detected gait events 
    
    gaitEvents = struct();

    gaitEvents.T01_FS_left = T01_FootStrikes_left;
    gaitEvents.T01_FO_left = T01_FootOffs_left;
    gaitEvents.T01_FS_right = T01_FootStrikes_right;
    gaitEvents.T01_FO_right = T01_FootOffs_right;
    gaitEvents.T02_FS_left = T02_FootStrikes_left;
    gaitEvents.T02_FO_left = T02_FootOffs_left;
    gaitEvents.T02_FS_right = T02_FootStrikes_right;
    gaitEvents.T02_FO_right = T02_FootOffs_right;
    gaitEvents.T03_FS_left = T03_FootStrikes_left;
    gaitEvents.T03_FO_left = T03_FootOffs_left;
    gaitEvents.T03_FS_right = T03_FootStrikes_right;
    gaitEvents.T03_FO_right = T03_FootOffs_right;

    save(fileName, 'gaitEvents');

end