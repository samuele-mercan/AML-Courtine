function [noFloat_FS_left, noFloat_FO_left, noFloat_FS_right, noFloat_FO_right, Float_FS_left, Float_FO_left, Float_FS_right, Float_FO_right] = HealthySegmentation(datafile1, datafile2)
    %======================================================================
    % Load Data for Healthy Patient, and return the foot off and foot strike
    % gait events for conditions of Float and no Float, for both right and
    % left legs. 
    %======================================================================
    
    % Data with no Crutches => FLOAT 
    datasetName1 = datafile1;
    data_struct = load(datasetName1); % load data structure
    fields = fieldnames(data_struct);
    
    LHIP_kin_Float = [data_struct.(fields{1}).T_01.Raw.Kin.LHIP; data_struct.(fields{1}).T_02.Raw.Kin.LHIP; data_struct.(fields{1}).T_03.Raw.Kin.LHIP];
    RHIP_kin_Float = [data_struct.(fields{1}).T_01.Raw.Kin.RHIP; data_struct.(fields{1}).T_02.Raw.Kin.RHIP; data_struct.(fields{1}).T_03.Raw.Kin.RHIP];
    
    LKNE_kin_Float = [data_struct.(fields{1}).T_01.Raw.Kin.LKNE; data_struct.(fields{1}).T_02.Raw.Kin.LKNE; data_struct.(fields{1}).T_03.Raw.Kin.LKNE];
    RKNE_kin_Float = [data_struct.(fields{1}).T_01.Raw.Kin.RKNE; data_struct.(fields{1}).T_02.Raw.Kin.RKNE; data_struct.(fields{1}).T_03.Raw.Kin.RKNE];
   
    LANK_kin_Float = [data_struct.(fields{1}).T_01.Raw.Kin.LANK; data_struct.(fields{1}).T_02.Raw.Kin.LANK; data_struct.(fields{1}).T_03.Raw.Kin.LANK];
    RANK_kin_Float = [data_struct.(fields{1}).T_01.Raw.Kin.RANK; data_struct.(fields{1}).T_02.Raw.Kin.RANK; data_struct.(fields{1}).T_03.Raw.Kin.RANK];
    
    LTOE_kin_Float = [data_struct.(fields{1}).T_01.Raw.Kin.LTOE; data_struct.(fields{1}).T_02.Raw.Kin.LTOE; data_struct.(fields{1}).T_03.Raw.Kin.LTOE];
    RTOE_kin_Float = [data_struct.(fields{1}).T_01.Raw.Kin.RTOE; data_struct.(fields{1}).T_02.Raw.Kin.RTOE; data_struct.(fields{1}).T_03.Raw.Kin.RTOE];
    
    % Data with Crutches => NO FLOAT
    datasetName2 = datafile2;
    data_struct = load(datasetName2); % load data structure
    fields = fieldnames(data_struct);
    
    LHIP_kin_noFloat = [data_struct.(fields{1}).T_01.Raw.Kin.LHIP; data_struct.(fields{1}).T_02.Raw.Kin.LHIP; data_struct.(fields{1}).T_03.Raw.Kin.LHIP];
    RHIP_kin_noFloat = [data_struct.(fields{1}).T_01.Raw.Kin.RHIP; data_struct.(fields{1}).T_02.Raw.Kin.RHIP; data_struct.(fields{1}).T_03.Raw.Kin.RHIP];
    
    LKNE_kin_noFloat = [data_struct.(fields{1}).T_01.Raw.Kin.LKNE; data_struct.(fields{1}).T_02.Raw.Kin.LKNE; data_struct.(fields{1}).T_03.Raw.Kin.LKNE];
    RKNE_kin_noFloat = [data_struct.(fields{1}).T_01.Raw.Kin.RKNE; data_struct.(fields{1}).T_02.Raw.Kin.RKNE; data_struct.(fields{1}).T_03.Raw.Kin.RKNE];
    
    LANK_kin_noFloat = [data_struct.(fields{1}).T_01.Raw.Kin.LANK; data_struct.(fields{1}).T_02.Raw.Kin.LANK; data_struct.(fields{1}).T_03.Raw.Kin.LANK];
    RANK_kin_noFloat = [data_struct.(fields{1}).T_01.Raw.Kin.RANK; data_struct.(fields{1}).T_02.Raw.Kin.RANK; data_struct.(fields{1}).T_03.Raw.Kin.RANK];
    
    LTOE_kin_noFloat = [data_struct.(fields{1}).T_01.Raw.Kin.LTOE; data_struct.(fields{1}).T_02.Raw.Kin.LTOE; data_struct.(fields{1}).T_03.Raw.Kin.LTOE];
    RTOE_kin_noFloat = [data_struct.(fields{1}).T_01.Raw.Kin.RTOE; data_struct.(fields{1}).T_02.Raw.Kin.RTOE; data_struct.(fields{1}).T_03.Raw.Kin.RTOE];

    %% SEGMENTATION OF THE DATA
    
    % based on the signals observation (VISUAL INSPECTION)
    
    % we extract the gait events, FO and FS, from the foot kinematics, by
    % knowing that: the maxima of the signals correspond to the Foot Strike, 
    % and the minima to the Foot Off (the marker is on the tip of the foot).
    
    %we compute the time vector to express the gait events as time events
    time_start = 0;
    fs_Kin = 100; %the sampling frequency for the kinematics signals
    
    % For the LEFT foot
    
    time_end = (length(LTOE_kin_noFloat(:,3))-1)/fs_Kin;
    time_step = 1/fs_Kin;
    time = time_start:time_step:time_end;
    
    [pks1, locks1] = findpeaks(LTOE_kin_noFloat(:,3),'MinPeakDistance',50);

   	noFloat_FS_left = time(locks1(pks1 > 120)); %VISUAL INSPECTION to find this threshold 
    
    %we use the mirror signal (*(-1)) to get the minima
    [pks1r, locks1r] = findpeaks(-LTOE_kin_noFloat(:,3),'MinPeakDistance',100);
    
    noFloat_FO_left = time(locks1r(pks1r > -55)); %VISUAL INSPECTION to find this threshold 
    
    % new time vector for the Float data
    time_end = (length(LTOE_kin_Float(:,3))-1)/fs_Kin;
    time_step = 1/fs_Kin;
    time = time_start:time_step:time_end;
    
    [pks2, locks2] = findpeaks(LTOE_kin_Float(:,3),'MinPeakDistance',100);
    
    Float_FS_left = time(locks2(pks2 > 90)); %VISUAL INSPECTION to find this threshold 
    
    [pks2r, locks2r] = findpeaks(-LTOE_kin_Float(:,3),'MinPeakDistance',100);
    
    Float_FO_left = time(locks2r(pks2r > -30)); %VISUAL INSPECTION to find this threshold 

    % For the RIGHT foot 
    
    %time vector
    time_end = (length(RTOE_kin_noFloat(:,3))-1)/fs_Kin;
    time_step = 1/fs_Kin;
    time = time_start:time_step:time_end;
    
    [pks3, locks3] = findpeaks(RTOE_kin_noFloat(:,3),'MinPeakDistance',50);

   	noFloat_FS_right = time(locks3(pks3 > 120)); %VISUAL INSPECTION to find this threshold 
    
    %we use the mirror signal (*(-1)) to get the minima
    [pks3r, locks3r] = findpeaks(-RTOE_kin_noFloat(:,3),'MinPeakDistance',100);
    
    noFloat_FO_right = time(locks3r(pks3r ~= 0)); %VISUAL INSPECTION to find this threshold 
    
    % new time vector for the Float data
    time_end = (length(RTOE_kin_Float(:,3))-1)/fs_Kin;
    time_step = 1/fs_Kin;
    time = time_start:time_step:time_end;
    
    [pks4, locks4] = findpeaks(RTOE_kin_Float(:,3),'MinPeakDistance',100);
    
    Float_FS_right = time(locks4(pks4 > 80)); %VISUAL INSPECTION to find this threshold 
    
    [pks4r, locks4r] = findpeaks(-RTOE_kin_Float(:,3),'MinPeakDistance',70);
    
    Float_FO_right = time(locks4r(pks4r ~= 0 & pks4r > -35)); %VISUAL INSPECTION to find this threshold 

end
