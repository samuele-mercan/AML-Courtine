function [GaitCycles] = HealthyGaitCyclesSegmentation(datasetName, datasetGaitEvents, leftFoot)

    %% Load Data
    
    GaitEvents = load(datasetGaitEvents);
    fieldsGaitEvents = fieldnames(GaitEvents);
    
    dataset_01_FS_left = GaitEvents.(fieldsGaitEvents{1}).T01_FS_left;
    dataset_01_FS_right = GaitEvents.(fieldsGaitEvents{1}).T01_FS_right;
    dataset_01_FO_left = GaitEvents.(fieldsGaitEvents{1}).T01_FO_left;
    dataset_01_FO_right = GaitEvents.(fieldsGaitEvents{1}).T01_FO_right;
    
    dataset_02_FS_left = GaitEvents.(fieldsGaitEvents{1}).T02_FS_left;
    dataset_02_FS_right = GaitEvents.(fieldsGaitEvents{1}).T02_FS_right;
    dataset_02_FO_left = GaitEvents.(fieldsGaitEvents{1}).T02_FO_left;
    dataset_02_FO_right = GaitEvents.(fieldsGaitEvents{1}).T02_FO_right;
    
    dataset_03_FS_left = GaitEvents.(fieldsGaitEvents{1}).T03_FS_left;
    dataset_03_FS_right = GaitEvents.(fieldsGaitEvents{1}).T03_FS_right;
    dataset_03_FO_left = GaitEvents.(fieldsGaitEvents{1}).T03_FO_left;
    dataset_03_FO_right = GaitEvents.(fieldsGaitEvents{1}).T03_FO_right;
    
    dataset = load(datasetName);
    fields = fieldnames(dataset); 
    
    fsKIN_dataset_01 = dataset.(fields{1}).T_01.fsKin;
    fsKIN_dataset_02 = dataset.(fields{1}).T_02.fsKin;
    fsKIN_dataset_03 = dataset.(fields{1}).T_03.fsKin;
    
    fsEMG_dataset_01 = dataset.(fields{1}).T_01.fsEMG;
    fsEMG_dataset_02 = dataset.(fields{1}).T_02.fsEMG;
    fsEMG_dataset_03 = dataset.(fields{1}).T_03.fsEMG;
    
    LHIP_dataset_01 = dataset.(fields{1}).T_01.Raw.Kin.LHIP;
    LHIP_dataset_02 = dataset.(fields{1}).T_02.Raw.Kin.LHIP;
    LHIP_dataset_03 = dataset.(fields{1}).T_03.Raw.Kin.LHIP;
    
    RHIP_dataset_01 = dataset.(fields{1}).T_01.Raw.Kin.RHIP;
    RHIP_dataset_02 = dataset.(fields{1}).T_02.Raw.Kin.RHIP;
    RHIP_dataset_03 = dataset.(fields{1}).T_03.Raw.Kin.RHIP;
    
    LKNE_dataset_01 = dataset.(fields{1}).T_01.Raw.Kin.LKNE;
    LKNE_dataset_02 = dataset.(fields{1}).T_02.Raw.Kin.LKNE;
    LKNE_dataset_03 = dataset.(fields{1}).T_03.Raw.Kin.LKNE;
    
    RKNE_dataset_01 = dataset.(fields{1}).T_01.Raw.Kin.RKNE;
    RKNE_dataset_02 = dataset.(fields{1}).T_02.Raw.Kin.RKNE;
    RKNE_dataset_03 = dataset.(fields{1}).T_03.Raw.Kin.RKNE;
    
    LANK_dataset_01 = dataset.(fields{1}).T_01.Raw.Kin.LANK;
    LANK_dataset_02 = dataset.(fields{1}).T_02.Raw.Kin.LANK;
    LANK_dataset_03 = dataset.(fields{1}).T_03.Raw.Kin.LANK;
    
    RANK_dataset_01 = dataset.(fields{1}).T_01.Raw.Kin.RANK;
    RANK_dataset_02 = dataset.(fields{1}).T_02.Raw.Kin.RANK;
    RANK_dataset_03 = dataset.(fields{1}).T_03.Raw.Kin.RANK;
    
    LTOE_dataset_01 = dataset.(fields{1}).T_01.Raw.Kin.LTOE;
    LTOE_dataset_02 = dataset.(fields{1}).T_02.Raw.Kin.LTOE;
    LTOE_dataset_03 = dataset.(fields{1}).T_03.Raw.Kin.LTOE;
    
    RTOE_dataset_01 = dataset.(fields{1}).T_01.Raw.Kin.RTOE;
    RTOE_dataset_02 = dataset.(fields{1}).T_02.Raw.Kin.RTOE;
    RTOE_dataset_03 = dataset.(fields{1}).T_03.Raw.Kin.RTOE;
    
    frequency = 10;
    [b,a] = butter(3,frequency/500,'high');    
    
    LTA_dataset_01 = filtfilt(b,a,dataset.(fields{1}).T_01.Raw.EMG.LTA);
    LTA_dataset_02 = filtfilt(b,a,dataset.(fields{1}).T_02.Raw.EMG.LTA);
    LTA_dataset_03 = filtfilt(b,a,dataset.(fields{1}).T_03.Raw.EMG.LTA);
    
    RTA_dataset_01 = filtfilt(b,a,dataset.(fields{1}).T_01.Raw.EMG.RTA);
    RTA_dataset_02 = filtfilt(b,a,dataset.(fields{1}).T_02.Raw.EMG.RTA);
    RTA_dataset_03 = filtfilt(b,a,dataset.(fields{1}).T_03.Raw.EMG.RTA);
    
    LMG_dataset_01 = filtfilt(b,a,dataset.(fields{1}).T_01.Raw.EMG.LMG);
    LMG_dataset_02 = filtfilt(b,a,dataset.(fields{1}).T_02.Raw.EMG.LMG);
    LMG_dataset_03 = filtfilt(b,a,dataset.(fields{1}).T_03.Raw.EMG.LMG);
    
    RMG_dataset_01 = filtfilt(b,a,dataset.(fields{1}).T_01.Raw.EMG.RMG);
    RMG_dataset_02 = filtfilt(b,a,dataset.(fields{1}).T_02.Raw.EMG.RMG);
    RMG_dataset_03 = filtfilt(b,a,dataset.(fields{1}).T_03.Raw.EMG.RMG);
    
    %% Segment the data and initialize the structure 
    
    GaitCycles = struct();
    
    % we take the Foot Strike to segment the data in gait cycles

    %T_01
    
    if (leftFoot)
        firstLength = length(dataset_01_FS_left)-1;
        gaitEventsForSegmentation = dataset_01_FS_left; 
    else
        firstLength = length(dataset_01_FS_right)-1;
        gaitEventsForSegmentation = dataset_01_FS_right; 
    end
    
    for i=1:firstLength
        
        GaitCycles.(strcat('GC',num2str(i))).Kin = [] ;
        GaitCycles.(strcat('GC',num2str(i))).EMG = [] ;
            
        startIndexKin = int16(gaitEventsForSegmentation(i)*fsKIN_dataset_01);
        endIndexKin = int16(gaitEventsForSegmentation(i+1)*fsKIN_dataset_01);
        startIndexEmg = int16(gaitEventsForSegmentation(i)*fsEMG_dataset_01);
        endIndexEmg = int16(gaitEventsForSegmentation(i+1)*fsEMG_dataset_01);
                
        GaitCycles.(strcat('GC',num2str(i))).Kin.LHIP = LHIP_dataset_01(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(i))).Kin.LKNE = LKNE_dataset_01(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(i))).Kin.LANK = LANK_dataset_01(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(i))).Kin.LTOE = LTOE_dataset_01(startIndexKin:endIndexKin,:);
        
        GaitCycles.(strcat('GC',num2str(i))).EMG.LTA = LTA_dataset_01(startIndexEmg:endIndexEmg);
        GaitCycles.(strcat('GC',num2str(i))).EMG.LMG = LMG_dataset_01(startIndexEmg:endIndexEmg);

        GaitCycles.(strcat('GC',num2str(i))).Kin.RHIP = RHIP_dataset_01(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(i))).Kin.RKNE = RKNE_dataset_01(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(i))).Kin.RANK = RANK_dataset_01(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(i))).Kin.RTOE = RTOE_dataset_01(startIndexKin:endIndexKin,:);

        GaitCycles.(strcat('GC',num2str(i))).EMG.RTA = RTA_dataset_01(startIndexEmg:endIndexEmg);
        GaitCycles.(strcat('GC',num2str(i))).EMG.RMG = RMG_dataset_01(startIndexEmg:endIndexEmg);
        
        GaitCycles.(strcat('GC',num2str(i))).fsKIN = fsKIN_dataset_01;
        GaitCycles.(strcat('GC',num2str(i))).fsEMG = fsEMG_dataset_01;
        
        if (leftFoot)
            GaitCycles.(strcat('GC',num2str(i))).FS_left = 0;
            GaitCycles.(strcat('GC',num2str(i))).FO_left = dataset_01_FO_left(dataset_01_FO_left < gaitEventsForSegmentation(i+1) & dataset_01_FO_left > gaitEventsForSegmentation(i))-gaitEventsForSegmentation(i);
            GaitCycles.(strcat('GC',num2str(i))).FS_right = dataset_01_FS_right(dataset_01_FS_right < gaitEventsForSegmentation(i+1) & dataset_01_FS_right > gaitEventsForSegmentation(i))-gaitEventsForSegmentation(i);
            GaitCycles.(strcat('GC',num2str(i))).FO_right = dataset_01_FO_right(dataset_01_FO_right < gaitEventsForSegmentation(i+1) & dataset_01_FO_right > gaitEventsForSegmentation(i))-gaitEventsForSegmentation(i);
        else 
            GaitCycles.(strcat('GC',num2str(i))).FS_left = dataset_01_FS_left(dataset_01_FS_left < gaitEventsForSegmentation(i+1) & dataset_01_FS_left > gaitEventsForSegmentation(i))-gaitEventsForSegmentation(i);
            GaitCycles.(strcat('GC',num2str(i))).FO_left = dataset_01_FO_left(dataset_01_FO_left < gaitEventsForSegmentation(i+1) & dataset_01_FO_left > gaitEventsForSegmentation(i))-gaitEventsForSegmentation(i);
            GaitCycles.(strcat('GC',num2str(i))).FS_right = 0;
            GaitCycles.(strcat('GC',num2str(i))).FO_right = dataset_01_FO_right(dataset_01_FO_right < gaitEventsForSegmentation(i+1) & dataset_01_FO_right > gaitEventsForSegmentation(i))-gaitEventsForSegmentation(i);
        end
         
    end
    
    %T_02
    
    if (leftFoot)
        secondLength = length(dataset_02_FS_left)-1;
        gaitEventsForSegmentation = dataset_02_FS_left; 
    else
        secondLength = length(dataset_02_FS_right)-1;
        gaitEventsForSegmentation = dataset_02_FS_right; 
    end
    
    for j=1:secondLength
        
        GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin = [] ;
        GaitCycles.(strcat('GC',num2str(j+firstLength))).EMG = [] ;
        GaitCycles.(strcat('GC',num2str(j+firstLength))).FS_left = [] ;
        GaitCycles.(strcat('GC',num2str(j+firstLength))).FO_left = [] ;
        GaitCycles.(strcat('GC',num2str(j+firstLength))).FS_right = [] ;
        GaitCycles.(strcat('GC',num2str(j+firstLength))).FO_right = [] ;
            
        startIndexKin = int16(gaitEventsForSegmentation(j)*fsKIN_dataset_02);
        endIndexKin = int16(gaitEventsForSegmentation(j+1)*fsKIN_dataset_02);
        startIndexEmg = int16(gaitEventsForSegmentation(j)*fsEMG_dataset_02);
        endIndexEmg = int16(gaitEventsForSegmentation(j+1)*fsEMG_dataset_02);
                
        GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.LHIP = LHIP_dataset_02(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.LKNE = LKNE_dataset_02(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.LANK = LANK_dataset_02(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.LTOE = LTOE_dataset_02(startIndexKin:endIndexKin,:);
        
        GaitCycles.(strcat('GC',num2str(j+firstLength))).EMG.LTA = LTA_dataset_02(startIndexEmg:endIndexEmg);
        GaitCycles.(strcat('GC',num2str(j+firstLength))).EMG.LMG = LMG_dataset_02(startIndexEmg:endIndexEmg);

        GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.RHIP = RHIP_dataset_02(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.RKNE = RKNE_dataset_02(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.RANK = RANK_dataset_02(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.RTOE = RTOE_dataset_02(startIndexKin:endIndexKin,:);

        GaitCycles.(strcat('GC',num2str(j+firstLength))).EMG.RTA = RTA_dataset_02(startIndexEmg:endIndexEmg);
        GaitCycles.(strcat('GC',num2str(j+firstLength))).EMG.RMG = RMG_dataset_02(startIndexEmg:endIndexEmg);
        
        GaitCycles.(strcat('GC',num2str(j+firstLength))).fsKIN = fsKIN_dataset_02;
        GaitCycles.(strcat('GC',num2str(j+firstLength))).fsEMG = fsEMG_dataset_02;
        
        if (leftFoot)
            GaitCycles.(strcat('GC',num2str(j+firstLength))).FS_left = 0;
            GaitCycles.(strcat('GC',num2str(j+firstLength))).FO_left = dataset_02_FO_left(dataset_02_FO_left < gaitEventsForSegmentation(j+1) & dataset_02_FO_left > gaitEventsForSegmentation(j))-gaitEventsForSegmentation(j);
            GaitCycles.(strcat('GC',num2str(j+firstLength))).FS_right = dataset_02_FS_right(dataset_02_FS_right < gaitEventsForSegmentation(j+1) & dataset_02_FS_right > gaitEventsForSegmentation(j))-gaitEventsForSegmentation(j);
            GaitCycles.(strcat('GC',num2str(j+firstLength))).FO_right = dataset_02_FO_right(dataset_02_FO_right < gaitEventsForSegmentation(j+1) & dataset_02_FO_right > gaitEventsForSegmentation(j))-gaitEventsForSegmentation(j);
        else 
            GaitCycles.(strcat('GC',num2str(j+firstLength))).FS_left = dataset_02_FS_left(dataset_02_FS_left < gaitEventsForSegmentation(j+1) & dataset_02_FS_left > gaitEventsForSegmentation(j))-gaitEventsForSegmentation(j);
            GaitCycles.(strcat('GC',num2str(j+firstLength))).FO_left = dataset_02_FO_left(dataset_02_FO_left < gaitEventsForSegmentation(j+1) & dataset_02_FO_left > gaitEventsForSegmentation(j))-gaitEventsForSegmentation(j);
            GaitCycles.(strcat('GC',num2str(j+firstLength))).FS_right = 0;
            GaitCycles.(strcat('GC',num2str(j+firstLength))).FO_right = dataset_02_FO_right(dataset_02_FO_right < gaitEventsForSegmentation(j+1) & dataset_02_FO_right > gaitEventsForSegmentation(j))-gaitEventsForSegmentation(j);
        end
        
        
    end

    %T_03
    
    if (leftFoot)
        thirdLength = length(dataset_03_FS_left)-1;
        gaitEventsForSegmentation = dataset_03_FS_left; 
    else
        thirdLength = length(dataset_03_FS_right)-1;
        gaitEventsForSegmentation = dataset_03_FS_right; 
    end
    
    for k=1:thirdLength
        
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin = [] ;
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).EMG = [] ;
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).FS_left = [] ;
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).FO_left = [] ;
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).FS_right = [] ;
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).FO_right = [] ;
            
        startIndexKin = int16(gaitEventsForSegmentation(k)*fsKIN_dataset_03);
        endIndexKin = int16(gaitEventsForSegmentation(k+1)*fsKIN_dataset_03);
        startIndexEmg = int16(gaitEventsForSegmentation(k)*fsEMG_dataset_03);
        endIndexEmg = int16(gaitEventsForSegmentation(k+1)*fsEMG_dataset_03);
                
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.LHIP = LHIP_dataset_03(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.LKNE = LKNE_dataset_03(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.LANK = LANK_dataset_03(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.LTOE = LTOE_dataset_03(startIndexKin:endIndexKin,:);
        
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).EMG.LTA = LTA_dataset_03(startIndexEmg:endIndexEmg);
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).EMG.LMG = LMG_dataset_03(startIndexEmg:endIndexEmg);

        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.RHIP = RHIP_dataset_03(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.RKNE = RKNE_dataset_03(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.RANK = RANK_dataset_03(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.RTOE = RTOE_dataset_03(startIndexKin:endIndexKin,:);

        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).EMG.RTA = RTA_dataset_03(startIndexEmg:endIndexEmg);
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).EMG.RMG = RMG_dataset_03(startIndexEmg:endIndexEmg);
        
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).fsKIN = fsKIN_dataset_03;
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).fsEMG = fsEMG_dataset_03;
        
        if (leftFoot)
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).FS_left = 0;
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).FO_left = dataset_03_FO_left(dataset_03_FO_left < gaitEventsForSegmentation(k+1) & dataset_03_FO_left > gaitEventsForSegmentation(k))-gaitEventsForSegmentation(k);
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).FS_right = dataset_03_FS_right(dataset_03_FS_right < gaitEventsForSegmentation(k+1) & dataset_03_FS_right > gaitEventsForSegmentation(k))-gaitEventsForSegmentation(k);
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).FO_right = dataset_03_FO_right(dataset_03_FO_right < gaitEventsForSegmentation(k+1) & dataset_03_FO_right > gaitEventsForSegmentation(k))-gaitEventsForSegmentation(k);
        else 
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).FS_left = dataset_03_FS_left(dataset_03_FS_left < gaitEventsForSegmentation(k+1) & dataset_03_FS_left > gaitEventsForSegmentation(k))-gaitEventsForSegmentation(k);
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).FO_left = dataset_03_FO_left(dataset_03_FO_left < gaitEventsForSegmentation(k+1) & dataset_03_FO_left > gaitEventsForSegmentation(k))-gaitEventsForSegmentation(k);
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).FS_right = 0;
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).FO_right = dataset_03_FO_right(dataset_03_FO_right < gaitEventsForSegmentation(k+1) & dataset_03_FO_right > gaitEventsForSegmentation(k))-gaitEventsForSegmentation(k);
        end
        
    end
    
    
    