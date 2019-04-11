function [GaitCycles] = segmentation(datasetName, table01, table02, table03)
    %% Load Data
    
    [dataset_01_FS_left, dataset_01_FS_right, dataset_01_FO_left, dataset_01_FO_right, ...
        dataset_02_FS_left, dataset_02_FS_right, dataset_02_FO_left, dataset_02_FO_right, ...
        dataset_03_FS_left, dataset_03_FS_right, dataset_03_FO_left, dataset_03_FO_right] = initializeGaitEvents(table01, table02, table03);

    dataset = load(datasetName);
    fields = fieldnames(dataset);

    
    fsKIN_dataset_01 = dataset.(fields{1}).T_01.fsKIN;
    fsKIN_dataset_02 = dataset.(fields{1}).T_02.fsKIN;
    fsKIN_dataset_03 = dataset.(fields{1}).T_03.fsKIN;
    
    fsEMG_dataset_01 = dataset.(fields{1}).T_01.fsEMG;
    fsEMG_dataset_02 = dataset.(fields{1}).T_02.fsEMG;
    fsEMG_dataset_03 = dataset.(fields{1}).T_03.fsEMG;
    
    LASI_dataset_01 = dataset.(fields{1}).T_01.Raw.Kin.LASI;
    LASI_dataset_02 = dataset.(fields{1}).T_02.Raw.Kin.LASI;
    LASI_dataset_03 = dataset.(fields{1}).T_03.Raw.Kin.LASI;
    
    RASI_dataset_01 = dataset.(fields{1}).T_01.Raw.Kin.RASI;
    RASI_dataset_02 = dataset.(fields{1}).T_02.Raw.Kin.RASI;
    RASI_dataset_03 = dataset.(fields{1}).T_03.Raw.Kin.RASI;
    
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
    
    LTA_dataset_01 = dataset.(fields{1}).T_01.Raw.EMG.LTA;
    LTA_dataset_02 = dataset.(fields{1}).T_02.Raw.EMG.LTA;
    LTA_dataset_03 = dataset.(fields{1}).T_03.Raw.EMG.LTA;
    
    RTA_dataset_01 = dataset.(fields{1}).T_01.Raw.EMG.RTA;
    RTA_dataset_02 = dataset.(fields{1}).T_02.Raw.EMG.RTA;
    RTA_dataset_03 = dataset.(fields{1}).T_03.Raw.EMG.RTA;
    
    LMG_dataset_01 = dataset.(fields{1}).T_01.Raw.EMG.LMG;
    LMG_dataset_02 = dataset.(fields{1}).T_02.Raw.EMG.LMG;
    LMG_dataset_03 = dataset.(fields{1}).T_03.Raw.EMG.LMG;
    
    RMG_dataset_01 = dataset.(fields{1}).T_01.Raw.EMG.RMG;
    RMG_dataset_02 = dataset.(fields{1}).T_02.Raw.EMG.RMG;
    RMG_dataset_03 = dataset.(fields{1}).T_03.Raw.EMG.RMG;
    
    %% Segment the data and initialize the structure 
    
    GaitCycles = struct();
    
    firstLength = min([length(dataset_01_FS_left),length(dataset_01_FS_right), length(dataset_01_FO_left), length(dataset_01_FO_right)]);
    secondLength = min([length(dataset_02_FS_left),length(dataset_02_FS_right), length(dataset_02_FO_left), length(dataset_02_FO_right)]);
    thirdLength = min([length(dataset_03_FS_left),length(dataset_03_FS_right), length(dataset_03_FO_left), length(dataset_03_FO_right)]);

    %T_01
    for i=1:firstLength
        
        GaitCycles.(strcat('GC',num2str(i))).Kin = [] ;
        GaitCycles.(strcat('GC',num2str(i))).EMG = [] ;

        if (i < length(dataset_01_FS_left) && i < length(dataset_01_FO_left))
        
            if (dataset_01_FO_left(i) < dataset_01_FS_left(i))
                startIndexKin = int16(dataset_01_FO_left(i)*fsKIN_dataset_01);
                endIndexKin = int16(dataset_01_FS_left(i)*fsKIN_dataset_01);
                startIndexEmg = int16(dataset_01_FO_left(i)*fsEMG_dataset_01);
                endIndexEmg = int16(dataset_01_FS_left(i)*fsEMG_dataset_01);
            else 
                startIndexKin = int16(dataset_01_FS_left(i)*fsKIN_dataset_01);
                endIndexKin = int16(dataset_01_FO_left(i)*fsKIN_dataset_01);
                startIndexEmg = int16(dataset_01_FS_left(i)*fsEMG_dataset_01);
                endIndexEmg = int16(dataset_01_FO_left(i)*fsEMG_dataset_01);
            end
        
            GaitCycles.(strcat('GC',num2str(i))).Kin.LASI = LASI_dataset_01(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(i))).Kin.LKNE = LKNE_dataset_01(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(i))).Kin.LANK = LANK_dataset_01(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(i))).Kin.LTOE = LTOE_dataset_01(startIndexKin:endIndexKin,:);
        
            GaitCycles.(strcat('GC',num2str(i))).EMG.LTA = LTA_dataset_01(startIndexEmg:endIndexEmg);
            GaitCycles.(strcat('GC',num2str(i))).EMG.LMG = LMG_dataset_01(startIndexEmg:endIndexEmg);
            
        end
        
        if (i < length(dataset_01_FS_right) && i < length(dataset_01_FO_right))
        
            if (dataset_01_FO_right(i) < dataset_01_FS_right(i))
                startIndexKin = int16(dataset_01_FO_right(i)*fsKIN_dataset_01);
                endIndexKin = int16(dataset_01_FS_right(i)*fsKIN_dataset_01);
                startIndexEmg = int16(dataset_01_FO_right(i)*fsEMG_dataset_01);
                endIndexEmg = int16(dataset_01_FS_right(i)*fsEMG_dataset_01);
            else 
                startIndexKin = int16(dataset_01_FS_right(i)*fsKIN_dataset_01);
                endIndexKin = int16(dataset_01_FO_right(i)*fsKIN_dataset_01);
                startIndexEmg = int16(dataset_01_FS_right(i)*fsEMG_dataset_01);
                endIndexEmg = int16(dataset_01_FO_right(i)*fsEMG_dataset_01);
            end
        
            GaitCycles.(strcat('GC',num2str(i))).Kin.RASI = RASI_dataset_01(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(i))).Kin.RKNE = RKNE_dataset_01(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(i))).Kin.RANK = RANK_dataset_01(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(i))).Kin.RTOE = RTOE_dataset_01(startIndexKin:endIndexKin,:);
        
            GaitCycles.(strcat('GC',num2str(i))).EMG.RTA = RTA_dataset_01(startIndexEmg:endIndexEmg);
            GaitCycles.(strcat('GC',num2str(i))).EMG.RMG = RMG_dataset_01(startIndexEmg:endIndexEmg);
        end
        
    end
    
    %T_02
    for j=1:secondLength
        
        GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin = [] ;
        GaitCycles.(strcat('GC',num2str(j+firstLength))).EMG = [] ;

        if (j < length(dataset_02_FS_left) && j < length(dataset_02_FO_left))
        
            if (dataset_02_FO_left(j) < dataset_02_FS_left(j))
                startIndexKin = int16(dataset_02_FO_left(j)*fsKIN_dataset_02);
                endIndexKin = int16(dataset_02_FS_left(j)*fsKIN_dataset_02);
                startIndexEmg = int16(dataset_02_FO_left(j)*fsEMG_dataset_02);
                endIndexEmg = int16(dataset_02_FS_left(j)*fsEMG_dataset_02);    
            else 
                startIndexKin = int16(dataset_02_FS_left(j)*fsKIN_dataset_02);
                endIndexKin = int16(dataset_02_FO_left(j)*fsKIN_dataset_02);
                startIndexEmg = int16(dataset_02_FS_left(j)*fsEMG_dataset_02);
                endIndexEmg = int16(dataset_02_FO_left(j)*fsEMG_dataset_02);
            end
        
            GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.LASI = LASI_dataset_02(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.LKNE = LKNE_dataset_02(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.LANK = LANK_dataset_02(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.LTOE = LTOE_dataset_02(startIndexKin:endIndexKin,:);
        
            GaitCycles.(strcat('GC',num2str(j+firstLength))).EMG.LTA = LTA_dataset_02(startIndexEmg:endIndexEmg);
            GaitCycles.(strcat('GC',num2str(j+firstLength))).EMG.LMG = LMG_dataset_02(startIndexEmg:endIndexEmg);
        end
        
        if (j < length(dataset_02_FS_right) && j < length(dataset_02_FO_right))
        
            if (dataset_02_FO_right(j) < dataset_02_FS_right(j))
                startIndexKin = int16(dataset_02_FO_right(j)*fsKIN_dataset_02);
                endIndexKin = int16(dataset_02_FS_right(j)*fsKIN_dataset_02);
                startIndexEmg = int16(dataset_02_FO_right(j)*fsEMG_dataset_02);
                endIndexEmg = int16(dataset_02_FS_right(j)*fsEMG_dataset_02);
            else 
                startIndexKin = int16(dataset_02_FS_right(j)*fsKIN_dataset_02);
                endIndexKin = int16(dataset_02_FO_right(j)*fsKIN_dataset_02);
                startIndexEmg = int16(dataset_02_FS_right(j)*fsEMG_dataset_02);
                endIndexEmg = int16(dataset_02_FO_right(j)*fsEMG_dataset_02);
            end
        
            GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.RASI = RASI_dataset_02(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.RKNE = RKNE_dataset_02(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.RANK = RANK_dataset_02(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(j+firstLength))).Kin.RTOE = RTOE_dataset_02(startIndexKin:endIndexKin,:);
       
            GaitCycles.(strcat('GC',num2str(j+firstLength))).EMG.RTA = RTA_dataset_02(startIndexEmg:endIndexEmg);
            GaitCycles.(strcat('GC',num2str(j+firstLength))).EMG.RMG = RMG_dataset_02(startIndexEmg:endIndexEmg);
        end
        
    end

    %T_03
    for k=1:thirdLength
        
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin = [] ;
        GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).EMG = [] ;

        if (k < length(dataset_03_FS_left) && k < length(dataset_03_FO_left))
        
            if (dataset_03_FO_left(k) < dataset_03_FS_left(k))
                startIndexKin = int16(dataset_03_FO_left(k)*fsKIN_dataset_03);
                endIndexKin = int16(dataset_03_FS_left(k)*fsKIN_dataset_03);
                startIndexEmg = int16(dataset_03_FO_left(k)*fsEMG_dataset_03);
                endIndexEmg = int16(dataset_03_FS_left(k)*fsEMG_dataset_03);    
            else 
                startIndexKin = int16(dataset_03_FS_left(k)*fsKIN_dataset_03);
                endIndexKin = int16(dataset_03_FO_left(k)*fsKIN_dataset_03);
                startIndexEmg = int16(dataset_03_FS_left(k)*fsEMG_dataset_03);
                endIndexEmg = int16(dataset_03_FO_left(k)*fsEMG_dataset_03);
            end
        
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.LASI = LASI_dataset_03(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.LKNE = LKNE_dataset_03(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.LANK = LANK_dataset_03(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.LTOE = LTOE_dataset_03(startIndexKin:endIndexKin,:);
        
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).EMG.LTA = LTA_dataset_03(startIndexEmg:endIndexEmg);
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).EMG.LMG = LMG_dataset_03(startIndexEmg:endIndexEmg);
        end
        
        if (k < length(dataset_03_FS_right) && k < length(dataset_03_FO_right))
        
            if (dataset_03_FO_right(k) < dataset_03_FS_right(k))
                startIndexKin = int16(dataset_03_FO_right(k)*fsKIN_dataset_03);
                endIndexKin = int16(dataset_03_FS_right(k)*fsKIN_dataset_03);
                startIndexEmg = int16(dataset_03_FO_right(k)*fsEMG_dataset_03);
                endIndexEmg = int16(dataset_03_FS_right(k)*fsEMG_dataset_03);
            else 
                startIndexKin = int16(dataset_03_FS_right(k)*fsKIN_dataset_03);
                endIndexKin = int16(dataset_03_FO_right(k)*fsKIN_dataset_03);
                startIndexEmg = int16(dataset_03_FS_right(k)*fsEMG_dataset_03);
                endIndexEmg = int16(dataset_03_FO_right(k)*fsEMG_dataset_03);
            end
        
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.RASI = RASI_dataset_03(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.RKNE = RKNE_dataset_03(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.RANK = RANK_dataset_03(startIndexKin:endIndexKin,:);
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.RTOE = RTOE_dataset_03(startIndexKin:endIndexKin,:);
       
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).EMG.RTA = RTA_dataset_03(startIndexEmg:endIndexEmg);
            GaitCycles.(strcat('GC',num2str(k+firstLength+secondLength))).EMG.RMG = RMG_dataset_03(startIndexEmg:endIndexEmg);
        end
        
    end
    
    
    