function [GaitCycles] = Healthysegmentation2(datasetName, dataset_FS_left,dataset_FO_left, ...
    dataset_FS_right, dataset_FO_right, leftFoot)

    % LOAD THE DATA
    
    dataset = load(datasetName);
    fields = fieldnames(dataset);
    
    LKNE_dataset = [dataset.(fields{1}).T_01.Raw.Kin.LKNE; dataset.(fields{1}).T_02.Raw.Kin.LKNE; dataset.(fields{1}).T_03.Raw.Kin.LKNE];
    
    RKNE_dataset = [dataset.(fields{1}).T_01.Raw.Kin.RKNE; dataset.(fields{1}).T_02.Raw.Kin.RKNE; dataset.(fields{1}).T_03.Raw.Kin.RKNE];
    
    LANK_dataset = [dataset.(fields{1}).T_01.Raw.Kin.LANK; dataset.(fields{1}).T_02.Raw.Kin.LANK; dataset.(fields{1}).T_03.Raw.Kin.LANK];
    
    RANK_dataset = [dataset.(fields{1}).T_01.Raw.Kin.RANK; dataset.(fields{1}).T_02.Raw.Kin.RANK; dataset.(fields{1}).T_03.Raw.Kin.RANK];
    
    LTOE_dataset = [dataset.(fields{1}).T_01.Raw.Kin.LTOE; dataset.(fields{1}).T_02.Raw.Kin.LTOE; dataset.(fields{1}).T_03.Raw.Kin.LTOE];
    
    RTOE_dataset = [dataset.(fields{1}).T_01.Raw.Kin.RTOE; dataset.(fields{1}).T_02.Raw.Kin.RTOE; dataset.(fields{1}).T_03.Raw.Kin.RTOE];
    
    LTA_dataset = [dataset.(fields{1}).T_01.Clean.EMG.LTA; dataset.(fields{1}).T_02.Clean.EMG.LTA; dataset.(fields{1}).T_03.Clean.EMG.LTA];
    
    RTA_dataset = [dataset.(fields{1}).T_01.Clean.EMG.RTA; dataset.(fields{1}).T_02.Clean.EMG.RTA; dataset.(fields{1}).T_03.Clean.EMG.RTA];
    
    LMG_dataset = [dataset.(fields{1}).T_01.Clean.EMG.LMG; dataset.(fields{1}).T_02.Clean.EMG.LMG; dataset.(fields{1}).T_03.Clean.EMG.LMG];
    
    RMG_dataset = [dataset.(fields{1}).T_01.Clean.EMG.RMG; dataset.(fields{1}).T_02.Clean.EMG.RMG; dataset.(fields{1}).T_03.Clean.EMG.RMG];
    
    fsKIN_dataset = dataset.(fields{1}).T_01.fsKin;
    fsEMG_dataset = dataset.(fields{1}).T_01.fsEMG;
    
    
    % SEGMENT DATA AND INITIALIZE STRUCTURE
    
    GaitCycles = struct();
    
    % we take the Foot Strike to segment the data in gait cycles
    
    if (leftFoot)
        firstLength = length(dataset_FS_left)-1;
        gaitEventsForSegmentation = dataset_FS_left; 
    else
        firstLength = length(dataset_FS_right)-1;
        gaitEventsForSegmentation = dataset_FS_right; 
    end
    
    for i=1:firstLength
        
        GaitCycles.(strcat('GC',num2str(i))).Kin = [] ;
        GaitCycles.(strcat('GC',num2str(i))).EMG = [] ;
            
        startIndexKin = int16(gaitEventsForSegmentation(i)*fsKIN_dataset);
        endIndexKin = int16(gaitEventsForSegmentation(i+1)*fsKIN_dataset);
        startIndexEmg = int16(gaitEventsForSegmentation(i)*fsEMG_dataset);
        endIndexEmg = int16(gaitEventsForSegmentation(i+1)*fsEMG_dataset);
                
        GaitCycles.(strcat('GC',num2str(i))).Kin.LKNE = LKNE_dataset(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(i))).Kin.LANK = LANK_dataset(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(i))).Kin.LTOE = LTOE_dataset(startIndexKin:endIndexKin,:);
        
        GaitCycles.(strcat('GC',num2str(i))).EMG.LTA = LTA_dataset(startIndexEmg:endIndexEmg);
        GaitCycles.(strcat('GC',num2str(i))).EMG.LMG = LMG_dataset(startIndexEmg:endIndexEmg);

        GaitCycles.(strcat('GC',num2str(i))).Kin.RKNE = RKNE_dataset(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(i))).Kin.RANK = RANK_dataset(startIndexKin:endIndexKin,:);
        GaitCycles.(strcat('GC',num2str(i))).Kin.RTOE = RTOE_dataset(startIndexKin:endIndexKin,:);

        GaitCycles.(strcat('GC',num2str(i))).EMG.RTA = RTA_dataset(startIndexEmg:endIndexEmg);
        GaitCycles.(strcat('GC',num2str(i))).EMG.RMG = RMG_dataset(startIndexEmg:endIndexEmg);
        
        GaitCycles.(strcat('GC',num2str(i))).fsKIN = fsKIN_dataset;
        GaitCycles.(strcat('GC',num2str(i))).fsEMG = fsEMG_dataset;
        
        if (leftFoot)
            GaitCycles.(strcat('GC',num2str(i))).FS_left = 0;
            GaitCycles.(strcat('GC',num2str(i))).FO_left = dataset_FO_left(dataset_FO_left < gaitEventsForSegmentation(i+1) & dataset_FO_left > gaitEventsForSegmentation(i))-gaitEventsForSegmentation(i);
            GaitCycles.(strcat('GC',num2str(i))).FS_right = dataset_FS_right(dataset_FS_right < gaitEventsForSegmentation(i+1) & dataset_FS_right > gaitEventsForSegmentation(i))-gaitEventsForSegmentation(i);
            GaitCycles.(strcat('GC',num2str(i))).FO_right = dataset_FO_right(dataset_FO_right < gaitEventsForSegmentation(i+1) & dataset_FO_right > gaitEventsForSegmentation(i))-gaitEventsForSegmentation(i);
        else 
            GaitCycles.(strcat('GC',num2str(i))).FS_left = dataset_FS_left(dataset_FS_left < gaitEventsForSegmentation(i+1) & dataset_FS_left > gaitEventsForSegmentation(i))-gaitEventsForSegmentation(i);
            GaitCycles.(strcat('GC',num2str(i))).FO_left = dataset_FO_left(dataset_FO_left < gaitEventsForSegmentation(i+1) & dataset_FO_left > gaitEventsForSegmentation(i))-gaitEventsForSegmentation(i);
            GaitCycles.(strcat('GC',num2str(i))).FS_right = 0;
            GaitCycles.(strcat('GC',num2str(i))).FO_right = dataset_FO_right(dataset_FO_right < gaitEventsForSegmentation(i+1) & dataset_FO_right > gaitEventsForSegmentation(i))-gaitEventsForSegmentation(i);
        end
         
    end
end
    

    