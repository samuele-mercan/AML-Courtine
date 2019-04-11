function [SCI_GaitCycles_Float, SCI_GaitCycles_noFloat] = SCIsegmentation()

    close all; clear all; 
    %======================================================================
    % Load Data for SCI subject
    %======================================================================
    % Data with Float, no Crutches 

    datasetName1 = 'Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/MAT/FLOAT_NO_CRUTCHES.mat';
    load(datasetName1); % load data structure   

    Float_01 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_03_GAIT.csv');
    Float_02 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_04_GAIT.csv');
    Float_03 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_05_GAIT.csv');
    
    fsKIN_Float_01 = FLOAT_NO_CRUTCHES.T_01.fsKIN;
    fsKIN_Float_02 = FLOAT_NO_CRUTCHES.T_02.fsKIN;
    fsKIN_Float_03 = FLOAT_NO_CRUTCHES.T_03.fsKIN;
    
    fsEMG_Float_01 = FLOAT_NO_CRUTCHES.T_01.fsEMG;
    fsEMG_Float_02 = FLOAT_NO_CRUTCHES.T_02.fsEMG;
    fsEMG_Float_03 = FLOAT_NO_CRUTCHES.T_03.fsEMG;
    
    LASI_Float_01 = FLOAT_NO_CRUTCHES.T_01.Raw.Kin.LASI;
    LASI_Float_02 = FLOAT_NO_CRUTCHES.T_02.Raw.Kin.LASI;
    LASI_Float_03 = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LASI;
    
    RASI_Float_01 = FLOAT_NO_CRUTCHES.T_01.Raw.Kin.RASI;
    RASI_Float_02 = FLOAT_NO_CRUTCHES.T_02.Raw.Kin.RASI;
    RASI_Float_03 = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RASI;
    
    LKNE_Float_01 = FLOAT_NO_CRUTCHES.T_01.Raw.Kin.LKNE;
    LKNE_Float_02 = FLOAT_NO_CRUTCHES.T_02.Raw.Kin.LKNE;
    LKNE_Float_03 = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LKNE;
    
    RKNE_Float_01 = FLOAT_NO_CRUTCHES.T_01.Raw.Kin.RKNE;
    RKNE_Float_02 = FLOAT_NO_CRUTCHES.T_02.Raw.Kin.RKNE;
    RKNE_Float_03 = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RKNE;
    
    LANK_Float_01 = FLOAT_NO_CRUTCHES.T_01.Raw.Kin.LANK;
    LANK_Float_02 = FLOAT_NO_CRUTCHES.T_02.Raw.Kin.LANK;
    LANK_Float_03 = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK;
    
    RANK_Float_01 = FLOAT_NO_CRUTCHES.T_01.Raw.Kin.RANK;
    RANK_Float_02 = FLOAT_NO_CRUTCHES.T_02.Raw.Kin.RANK;
    RANK_Float_03 = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RANK;
    
    LTOE_Float_01 = FLOAT_NO_CRUTCHES.T_01.Raw.Kin.LTOE;
    LTOE_Float_02 = FLOAT_NO_CRUTCHES.T_02.Raw.Kin.LTOE;
    LTOE_Float_03 = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE;
    
    RTOE_Float_01 = FLOAT_NO_CRUTCHES.T_01.Raw.Kin.RTOE;
    RTOE_Float_02 = FLOAT_NO_CRUTCHES.T_02.Raw.Kin.RTOE;
    RTOE_Float_03 = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RTOE;
    
    LTA_Float_01 = FLOAT_NO_CRUTCHES.T_01.Raw.EMG.LTA;
    LTA_Float_02 = FLOAT_NO_CRUTCHES.T_02.Raw.EMG.LTA;
    LTA_Float_03 = FLOAT_NO_CRUTCHES.T_03.Raw.EMG.LTA;
    
    RTA_Float_01 = FLOAT_NO_CRUTCHES.T_01.Raw.EMG.RTA;
    RTA_Float_02 = FLOAT_NO_CRUTCHES.T_02.Raw.EMG.RTA;
    RTA_Float_03 = FLOAT_NO_CRUTCHES.T_03.Raw.EMG.RTA;
    
    LMG_Float_01 = FLOAT_NO_CRUTCHES.T_01.Raw.EMG.LMG;
    LMG_Float_02 = FLOAT_NO_CRUTCHES.T_02.Raw.EMG.LMG;
    LMG_Float_03 = FLOAT_NO_CRUTCHES.T_03.Raw.EMG.LMG;
    
    RMG_Float_01 = FLOAT_NO_CRUTCHES.T_01.Raw.EMG.RMG;
    RMG_Float_02 = FLOAT_NO_CRUTCHES.T_02.Raw.EMG.RMG;
    RMG_Float_03 = FLOAT_NO_CRUTCHES.T_03.Raw.EMG.RMG;
    
    % Data without Float, with Crutches

    datasetName2 = 'Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/MAT/NO_FLOAT_CRUTCHES.mat';
    load(datasetName2); % load data structure   

    noFloat_01 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_01_GAIT.csv');
    noFloat_02 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_02_GAIT.csv');
    noFloat_03 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_03_GAIT.csv');

    fsKIN_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.fsKIN;
    fsKIN_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.fsKIN;
    fsKIN_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.fsKIN;
    
    fsEMG_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.fsEMG;
    fsEMG_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.fsEMG;
    fsEMG_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.fsEMG;
    
    LASI_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.Raw.Kin.LASI;
    LASI_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.Raw.Kin.LASI;
    LASI_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.Raw.Kin.LASI;
    
    RASI_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.Raw.Kin.RASI;
    RASI_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.Raw.Kin.RASI;
    RASI_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.Raw.Kin.RASI;
    
    LKNE_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.Raw.Kin.LKNE;
    LKNE_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.Raw.Kin.LKNE;
    LKNE_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.Raw.Kin.LKNE;
    
    RKNE_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.Raw.Kin.RKNE;
    RKNE_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.Raw.Kin.RKNE;
    RKNE_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.Raw.Kin.RKNE;
    
    LANK_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.Raw.Kin.LANK;
    LANK_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.Raw.Kin.LANK;
    LANK_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.Raw.Kin.LANK;
    
    RANK_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.Raw.Kin.RANK;
    RANK_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.Raw.Kin.RANK;
    RANK_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.Raw.Kin.RANK;
    
    LTOE_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.Raw.Kin.LTOE;
    LTOE_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.Raw.Kin.LTOE;
    LTOE_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.Raw.Kin.LTOE;
    
    RTOE_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.Raw.Kin.RTOE;
    RTOE_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.Raw.Kin.RTOE;
    RTOE_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.Raw.Kin.RTOE;
    
    LTA_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.Raw.EMG.LTA;
    LTA_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.Raw.EMG.LTA;
    LTA_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.Raw.EMG.LTA;
    
    RTA_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.Raw.EMG.RTA;
    RTA_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.Raw.EMG.RTA;
    RTA_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.Raw.EMG.RTA;
    
    LMG_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.Raw.EMG.LMG;
    LMG_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.Raw.EMG.LMG;
    LMG_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.Raw.EMG.LMG;
    
    RMG_noFloat_01 = NO_FLOAT_CRUTCHES.T_01.Raw.EMG.RMG;
    RMG_noFloat_02 = NO_FLOAT_CRUTCHES.T_02.Raw.EMG.RMG;
    RMG_noFloat_03 = NO_FLOAT_CRUTCHES.T_03.Raw.EMG.RMG;
    

    % Create the ground truth based on the csv features 

%% LOAD DATA FROM CSV FILES
    %% Float_01
    Float_01_FS_left=[];
    Float_01_FS_right=[];
    Float_01_FO_left=[];
    Float_01_FO_right=[];
   
    for i = 1:length(Float_01.Name)
        if string(Float_01.Name{i})=='Foot Strike'
            if string(Float_01.Context{i}) == 'Left'
                Float_01_FS_left = [Float_01_FS_left double(Float_01.Time_s_(i))];
            else
                Float_01_FS_right = [Float_01_FS_right double(Float_01.Time_s_(i))];
            end
        elseif string(Float_01.Name{i})=='Foot Off'
            if string(Float_01.Context{i}) == 'Left'
                Float_01_FO_left = [Float_01_FO_left double(Float_01.Time_s_(i))];
            else
                Float_01_FO_right = [Float_01_FO_right double(Float_01.Time_s_(i))];
            end
        end
    end    
    
    %% Float_02
    Float_02_FS_left=[];
    Float_02_FS_right=[];
    Float_02_FO_left=[];
    Float_02_FO_right=[];
   
    for i = 1:length(Float_02.Name)
        if string(Float_02.Name{i})=='Foot Strike'
            if string(Float_02.Context{i}) == 'Left'
                Float_02_FS_left = [Float_02_FS_left double(Float_02.Time_s_(i))];
            else
                Float_02_FS_right = [Float_02_FS_right double(Float_02.Time_s_(i))];
            end
        elseif string(Float_02.Name{i})=='Foot Off'
            if string(Float_02.Context{i}) == 'Left'
                Float_02_FO_left = [Float_02_FO_left double(Float_02.Time_s_(i))];
            else
                Float_02_FO_right = [Float_02_FO_right double(Float_02.Time_s_(i))];
            end
        end
    end
    %% Float_03
    Float_03_FS_left=[];
    Float_03_FS_right=[];
    Float_03_FO_left=[];
    Float_03_FO_right=[];
   
    for i = 1:length(Float_03.Name)
        if string(Float_03.Name{i})=='Foot Strike'
            if string(Float_03.Context{i}) == 'Left'
                Float_03_FS_left = [Float_03_FS_left double(Float_03.Time_s_(i))];
            else
                Float_03_FS_right = [Float_03_FS_right double(Float_03.Time_s_(i))];
            end
        elseif string(Float_03.Name{i})=='Foot Off'
            if string(Float_03.Context{i}) == 'Left'
                Float_03_FO_left = [Float_03_FO_left double(Float_03.Time_s_(i))];
            else
                Float_03_FO_right = [Float_03_FO_right double(Float_03.Time_s_(i))];
            end
        end
    end
    
    
    %% noFloat_01
    noFloat_01_FS_left=[];
    noFloat_01_FS_right=[];
    noFloat_01_FO_left=[];
    noFloat_01_FO_right=[];
   
    for i = 1:length(noFloat_01.Name)
        if string(noFloat_01.Name{i})=='Foot Strike'
            if string(noFloat_01.Context{i}) == 'Left'
                noFloat_01_FS_left = [noFloat_01_FS_left double(noFloat_01.Time_s_(i))];
            else
                noFloat_01_FS_right = [noFloat_01_FS_right double(noFloat_01.Time_s_(i))];
            end
        elseif string(noFloat_01.Name{i})=='Foot Off'
            if string(noFloat_01.Context{i}) == 'Left'
                noFloat_01_FO_left = [noFloat_01_FO_left double(noFloat_01.Time_s_(i))];
            else
                noFloat_01_FO_right = [noFloat_01_FO_right double(noFloat_01.Time_s_(i))];
            end
        end
    end
    %% noFloat_02
    noFloat_02_FS_left=[];
    noFloat_02_FS_right=[];
    noFloat_02_FO_left=[];
    noFloat_02_FO_right=[];
   
    for i = 1:length(noFloat_02.Name)
        if string(noFloat_02.Name{i})=='Foot Strike'
            if string(noFloat_02.Context{i}) == 'Left'
                noFloat_02_FS_left = [noFloat_02_FS_left double(noFloat_02.Time_s_(i))];
            else
                noFloat_02_FS_right = [noFloat_02_FS_right double(noFloat_02.Time_s_(i))];
            end
        elseif string(noFloat_02.Name{i})=='Foot Off'
            if string(noFloat_02.Context{i}) == 'Left'
                noFloat_02_FO_left = [noFloat_02_FO_left double(noFloat_02.Time_s_(i))];
            else
                noFloat_02_FO_right = [noFloat_02_FO_right double(noFloat_02.Time_s_(i))];
            end
        end
    end
    %% noFloat_03
    noFloat_03_FS_left=[];
    noFloat_03_FS_right=[];
    noFloat_03_FO_left=[];
    noFloat_03_FO_right=[];
   
    for i = 1:length(noFloat_03.Name)
        if string(noFloat_03.Name{i})=='Foot Strike'
            if string(noFloat_03.Context{i}) == 'Left'
                noFloat_03_FS_left = [noFloat_03_FS_left double(noFloat_03.Time_s_(i))];
            else
                noFloat_03_FS_right = [noFloat_03_FS_right double(noFloat_03.Time_s_(i))];
            end
        elseif string(noFloat_03.Name{i})=='Foot Off'
            if string(noFloat_03.Context{i}) == 'Left'
                noFloat_03_FO_left = [noFloat_03_FO_left double(noFloat_03.Time_s_(i))];
            else
                noFloat_03_FO_right = [noFloat_03_FO_right double(noFloat_03.Time_s_(i))];
            end
        end
    end
    
%% DATA SEGMENTATION AND STRUCTURE INITIALIZATION 

    % Float data
    
    SCI_GaitCycles_Float = struct();
    
    firstLength = min([length(Float_01_FS_left),length(Float_01_FS_right), length(Float_01_FO_left), length(Float_01_FO_right)]);
    secondLength = min([length(Float_02_FS_left),length(Float_02_FS_right), length(Float_02_FO_left), length(Float_02_FO_right)]);
    thirdLength = min([length(Float_03_FS_left),length(Float_03_FS_right), length(Float_03_FO_left), length(Float_03_FO_right)]);

    %T_01
    for i=1:firstLength
        
        SCI_GaitCycles_Float.(strcat('GC',num2str(i))).Kin = [] ;
        SCI_GaitCycles_Float.(strcat('GC',num2str(i))).EMG = [] ;

        if (i < length(Float_01_FS_left) && i < length(Float_01_FO_left))
        
            if (Float_01_FO_left(i) < Float_01_FS_left(i))
                startIndexKin = int16(Float_01_FO_left(i)*fsKIN_Float_01);
                endIndexKin = int16(Float_01_FS_left(i)*fsKIN_Float_01);
                startIndexEmg = int16(Float_01_FO_left(i)*fsEMG_Float_01);
                endIndexEmg = int16(Float_01_FS_left(i)*fsEMG_Float_01);
            else 
                startIndexKin = int16(Float_01_FS_left(i)*fsKIN_Float_01);
                endIndexKin = int16(Float_01_FO_left(i)*fsKIN_Float_01);
                startIndexEmg = int16(Float_01_FS_left(i)*fsEMG_Float_01);
                endIndexEmg = int16(Float_01_FO_left(i)*fsEMG_Float_01);
            end
        
            SCI_GaitCycles_Float.(strcat('GC',num2str(i))).Kin.LASI = LASI_Float_01(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(i))).Kin.LKNE = LKNE_Float_01(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(i))).Kin.LANK = LANK_Float_01(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(i))).Kin.LTOE = LTOE_Float_01(startIndexKin:endIndexKin,:);
        
            SCI_GaitCycles_Float.(strcat('GC',num2str(i))).EMG.LTA = LTA_Float_01(startIndexEmg:endIndexEmg);
            SCI_GaitCycles_Float.(strcat('GC',num2str(i))).EMG.LMG = LMG_Float_01(startIndexEmg:endIndexEmg);
        end
        
        if (i < length(Float_01_FS_right) && i < length(Float_01_FO_right))
        
            if (Float_01_FO_right(i) < Float_01_FS_right(i))
                startIndexKin = int16(Float_01_FO_right(i)*fsKIN_Float_01);
                endIndexKin = int16(Float_01_FS_right(i)*fsKIN_Float_01);
                startIndexEmg = int16(Float_01_FO_right(i)*fsEMG_Float_01);
                endIndexEmg = int16(Float_01_FS_right(i)*fsEMG_Float_01);
            else 
                startIndexKin = int16(Float_01_FS_right(i)*fsKIN_Float_01);
                endIndexKin = int16(Float_01_FO_right(i)*fsKIN_Float_01);
                startIndexEmg = int16(Float_01_FS_right(i)*fsEMG_Float_01);
                endIndexEmg = int16(Float_01_FO_right(i)*fsEMG_Float_01);
            end
        
            SCI_GaitCycles_Float.(strcat('GC',num2str(i))).Kin.RASI = RASI_Float_01(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(i))).Kin.RKNE = RKNE_Float_01(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(i))).Kin.RANK = RANK_Float_01(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(i))).Kin.RTOE = RTOE_Float_01(startIndexKin:endIndexKin,:);
        
            SCI_GaitCycles_Float.(strcat('GC',num2str(i))).EMG.RTA = RTA_Float_01(startIndexEmg:endIndexEmg);
            SCI_GaitCycles_Float.(strcat('GC',num2str(i))).EMG.RMG = RMG_Float_01(startIndexEmg:endIndexEmg);
        end
        
    end
    
    %T_02
    for j=1:secondLength
        
        SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).Kin = [] ;
        SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).EMG = [] ;

        if (j < length(Float_02_FS_left) && j < length(Float_02_FO_left))
        
            if (Float_02_FO_left(j) < Float_02_FS_left(j))
                startIndexKin = int16(Float_02_FO_left(j)*fsKIN_Float_02);
                endIndexKin = int16(Float_02_FS_left(j)*fsKIN_Float_02);
                startIndexEmg = int16(Float_02_FO_left(j)*fsEMG_Float_02);
                endIndexEmg = int16(Float_02_FS_left(j)*fsEMG_Float_02);    
            else 
                startIndexKin = int16(Float_02_FS_left(j)*fsKIN_Float_02);
                endIndexKin = int16(Float_02_FO_left(j)*fsKIN_Float_02);
                startIndexEmg = int16(Float_02_FS_left(j)*fsEMG_Float_02);
                endIndexEmg = int16(Float_02_FO_left(j)*fsEMG_Float_02);
            end
        
            SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).Kin.LASI = LASI_Float_02(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).Kin.LKNE = LKNE_Float_02(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).Kin.LANK = LANK_Float_02(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).Kin.LTOE = LTOE_Float_02(startIndexKin:endIndexKin,:);
        
            SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).EMG.LTA = LTA_Float_02(startIndexEmg:endIndexEmg);
            SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).EMG.LMG = LMG_Float_02(startIndexEmg:endIndexEmg);
        end
        
        if (j < length(Float_02_FS_right) && j < length(Float_02_FO_right))
        
            if (Float_02_FO_right(j) < Float_02_FS_right(j))
                startIndexKin = int16(Float_02_FO_right(j)*fsKIN_Float_02);
                endIndexKin = int16(Float_02_FS_right(j)*fsKIN_Float_02);
                startIndexEmg = int16(Float_02_FO_right(j)*fsEMG_Float_02);
                endIndexEmg = int16(Float_02_FS_right(j)*fsEMG_Float_02);
            else 
                startIndexKin = int16(Float_02_FS_right(j)*fsKIN_Float_02);
                endIndexKin = int16(Float_02_FO_right(j)*fsKIN_Float_02);
                startIndexEmg = int16(Float_02_FS_right(j)*fsEMG_Float_02);
                endIndexEmg = int16(Float_02_FO_right(j)*fsEMG_Float_02);
            end
        
            SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).Kin.RASI = RASI_Float_02(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).Kin.RKNE = RKNE_Float_02(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).Kin.RANK = RANK_Float_02(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).Kin.RTOE = RTOE_Float_02(startIndexKin:endIndexKin,:);
       
            SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).EMG.RTA = RTA_Float_02(startIndexEmg:endIndexEmg);
            SCI_GaitCycles_Float.(strcat('GC',num2str(j+firstLength))).EMG.RMG = RMG_Float_02(startIndexEmg:endIndexEmg);
        end
        
    end

    %T_03
    for k=1:thirdLength
        
        SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).Kin = [] ;
        SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).EMG = [] ;

        if (k < length(Float_03_FS_left) && k < length(Float_03_FO_left))
        
            if (Float_03_FO_left(k) < Float_03_FS_left(k))
                startIndexKin = int16(Float_03_FO_left(k)*fsKIN_Float_03);
                endIndexKin = int16(Float_03_FS_left(k)*fsKIN_Float_03);
                startIndexEmg = int16(Float_03_FO_left(k)*fsEMG_Float_03);
                endIndexEmg = int16(Float_03_FS_left(k)*fsEMG_Float_03);    
            else 
                startIndexKin = int16(Float_03_FS_left(k)*fsKIN_Float_03);
                endIndexKin = int16(Float_03_FO_left(k)*fsKIN_Float_03);
                startIndexEmg = int16(Float_03_FS_left(k)*fsEMG_Float_03);
                endIndexEmg = int16(Float_03_FO_left(k)*fsEMG_Float_03);
            end
        
            SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.LASI = LASI_Float_03(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.LKNE = LKNE_Float_03(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.LANK = LANK_Float_03(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.LTOE = LTOE_Float_03(startIndexKin:endIndexKin,:);
        
            SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).EMG.LTA = LTA_Float_03(startIndexEmg:endIndexEmg);
            SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).EMG.LMG = LMG_Float_03(startIndexEmg:endIndexEmg);
        end
        
        if (k < length(Float_03_FS_right) && k < length(Float_03_FO_right))
        
            if (Float_03_FO_right(k) < Float_03_FS_right(k))
                startIndexKin = int16(Float_03_FO_right(k)*fsKIN_Float_03);
                endIndexKin = int16(Float_03_FS_right(k)*fsKIN_Float_03);
                startIndexEmg = int16(Float_03_FO_right(k)*fsEMG_Float_03);
                endIndexEmg = int16(Float_03_FS_right(k)*fsEMG_Float_03);
            else 
                startIndexKin = int16(Float_03_FS_right(k)*fsKIN_Float_03);
                endIndexKin = int16(Float_03_FO_right(k)*fsKIN_Float_03);
                startIndexEmg = int16(Float_03_FS_right(k)*fsEMG_Float_03);
                endIndexEmg = int16(Float_03_FO_right(k)*fsEMG_Float_03);
            end
        
            SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.RASI = RASI_Float_03(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.RKNE = RKNE_Float_03(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.RANK = RANK_Float_03(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).Kin.RTOE = RTOE_Float_03(startIndexKin:endIndexKin,:);
       
            SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).EMG.RTA = RTA_Float_03(startIndexEmg:endIndexEmg);
            SCI_GaitCycles_Float.(strcat('GC',num2str(k+firstLength+secondLength))).EMG.RMG = RMG_Float_03(startIndexEmg:endIndexEmg);
        end
        
    end
    
    % noFloat data

    SCI_GaitCycles_noFloat = struct();
    
    firstLengthNF = min([length(noFloat_01_FS_left),length(noFloat_01_FS_right), length(noFloat_01_FO_left), length(noFloat_01_FO_right)]);
    secondLengthNF = min([length(noFloat_02_FS_left),length(noFloat_02_FS_right), length(noFloat_02_FO_left), length(noFloat_02_FO_right)]);
    thirdLengthNF = min([length(noFloat_03_FS_left),length(noFloat_03_FS_right), length(noFloat_03_FO_left), length(noFloat_03_FO_right)]);

    %T_01
    for i=1:firstLengthNF
        
        SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).Kin = [] ;
        SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).EMG = [] ;

        if (i < length(noFloat_01_FS_left) && i < length(noFloat_01_FO_left))
        
            if (noFloat_01_FO_left(i) < noFloat_01_FS_left(i))
                startIndexKin = int16(noFloat_01_FO_left(i)*fsKIN_noFloat_01);
                endIndexKin = int16(noFloat_01_FS_left(i)*fsKIN_noFloat_01);
                startIndexEmg = int16(noFloat_01_FO_left(i)*fsEMG_noFloat_01);
                endIndexEmg = int16(noFloat_01_FS_left(i)*fsEMG_noFloat_01);
            else 
                startIndexKin = int16(noFloat_01_FS_left(i)*fsKIN_noFloat_01);
                endIndexKin = int16(noFloat_01_FO_left(i)*fsKIN_noFloat_01);
                startIndexEmg = int16(noFloat_01_FS_left(i)*fsEMG_noFloat_01);
                endIndexEmg = int16(noFloat_01_FO_left(i)*fsEMG_noFloat_01);
            end
        
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).Kin.LASI = LASI_noFloat_01(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).Kin.LKNE = LKNE_noFloat_01(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).Kin.LANK = LANK_noFloat_01(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).Kin.LTOE = LTOE_noFloat_01(startIndexKin:endIndexKin,:);
        
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).EMG.LTA = LTA_noFloat_01(startIndexEmg:endIndexEmg);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).EMG.LMG = LMG_noFloat_01(startIndexEmg:endIndexEmg);
        end
        
        if (i < length(noFloat_01_FS_right) && i < length(noFloat_01_FO_right))
        
            if (noFloat_01_FO_right(i) < noFloat_01_FS_right(i))
                startIndexKin = int16(noFloat_01_FO_right(i)*fsKIN_noFloat_01);
                endIndexKin = int16(noFloat_01_FS_right(i)*fsKIN_noFloat_01);
                startIndexEmg = int16(noFloat_01_FO_right(i)*fsEMG_noFloat_01);
                endIndexEmg = int16(noFloat_01_FS_right(i)*fsEMG_noFloat_01);
            else 
                startIndexKin = int16(noFloat_01_FS_right(i)*fsKIN_noFloat_01);
                endIndexKin = int16(noFloat_01_FO_right(i)*fsKIN_noFloat_01);
                startIndexEmg = int16(noFloat_01_FS_right(i)*fsEMG_noFloat_01);
                endIndexEmg = int16(noFloat_01_FO_right(i)*fsEMG_noFloat_01);
            end
        
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).Kin.RASI = RASI_noFloat_01(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).Kin.RKNE = RKNE_noFloat_01(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).Kin.RANK = RANK_noFloat_01(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).Kin.RTOE = RTOE_noFloat_01(startIndexKin:endIndexKin,:);
        
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).EMG.RTA = RTA_noFloat_01(startIndexEmg:endIndexEmg);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(i))).EMG.RMG = RMG_noFloat_01(startIndexEmg:endIndexEmg);
        end
        
    end
    
    %T_02
    for j=1:secondLengthNF
        
        SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).Kin = [] ;
        SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).EMG = [] ;

        if (j < length(noFloat_02_FS_left) && j < length(noFloat_02_FO_left))
        
            if (noFloat_02_FO_left(j) < noFloat_02_FS_left(j))
                startIndexKin = int16(noFloat_02_FO_left(j)*fsKIN_noFloat_02);
                endIndexKin = int16(noFloat_02_FS_left(j)*fsKIN_noFloat_02);
                startIndexEmg = int16(noFloat_02_FO_left(j)*fsEMG_noFloat_02);
                endIndexEmg = int16(noFloat_02_FS_left(j)*fsEMG_noFloat_02);    
            else 
                startIndexKin = int16(noFloat_02_FS_left(j)*fsKIN_noFloat_02);
                endIndexKin = int16(noFloat_02_FO_left(j)*fsKIN_noFloat_02);
                startIndexEmg = int16(noFloat_02_FS_left(j)*fsEMG_noFloat_02);
                endIndexEmg = int16(noFloat_02_FO_left(j)*fsEMG_noFloat_02);
            end
        
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).Kin.LASI = LASI_noFloat_02(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).Kin.LKNE = LKNE_noFloat_02(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).Kin.LANK = LANK_noFloat_02(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).Kin.LTOE = LTOE_noFloat_02(startIndexKin:endIndexKin,:);
        
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).EMG.LTA = LTA_noFloat_02(startIndexEmg:endIndexEmg);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).EMG.LMG = LMG_noFloat_02(startIndexEmg:endIndexEmg);
        end
        
        if (j < length(noFloat_02_FS_right) && j < length(noFloat_02_FO_right))
        
            if (noFloat_02_FO_right(j) < noFloat_02_FS_right(j))
                startIndexKin = int16(noFloat_02_FO_right(j)*fsKIN_noFloat_02);
                endIndexKin = int16(noFloat_02_FS_right(j)*fsKIN_noFloat_02);
                startIndexEmg = int16(noFloat_02_FO_right(j)*fsEMG_noFloat_02);
                endIndexEmg = int16(noFloat_02_FS_right(j)*fsEMG_noFloat_02);
            else 
                startIndexKin = int16(noFloat_02_FS_right(j)*fsKIN_noFloat_02);
                endIndexKin = int16(noFloat_02_FO_right(j)*fsKIN_noFloat_02);
                startIndexEmg = int16(noFloat_02_FS_right(j)*fsEMG_noFloat_02);
                endIndexEmg = int16(noFloat_02_FO_right(j)*fsEMG_noFloat_02);
            end
        
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).Kin.RASI = RASI_noFloat_02(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).Kin.RKNE = RKNE_noFloat_02(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).Kin.RANK = RANK_noFloat_02(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).Kin.RTOE = RTOE_noFloat_02(startIndexKin:endIndexKin,:);
       
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).EMG.RTA = RTA_noFloat_02(startIndexEmg:endIndexEmg);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(j+firstLengthNF))).EMG.RMG = RMG_noFloat_02(startIndexEmg:endIndexEmg);
        end
        
    end

    %T_03
    for k=1:thirdLengthNF
        
        SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).Kin = [] ;
        SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).EMG = [] ;

        if (k < length(noFloat_03_FS_left) && k < length(noFloat_03_FO_left))
        
            if (noFloat_03_FO_left(k) < noFloat_03_FS_left(k))
                startIndexKin = int16(noFloat_03_FO_left(k)*fsKIN_noFloat_03);
                endIndexKin = int16(noFloat_03_FS_left(k)*fsKIN_noFloat_03);
                startIndexEmg = int16(noFloat_03_FO_left(k)*fsEMG_noFloat_03);
                endIndexEmg = int16(noFloat_03_FS_left(k)*fsEMG_noFloat_03);    
            else 
                startIndexKin = int16(noFloat_03_FS_left(k)*fsKIN_noFloat_03);
                endIndexKin = int16(noFloat_03_FO_left(k)*fsKIN_noFloat_03);
                startIndexEmg = int16(noFloat_03_FS_left(k)*fsEMG_noFloat_03);
                endIndexEmg = int16(noFloat_03_FO_left(k)*fsEMG_noFloat_03);
            end
        
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).Kin.LASI = LASI_noFloat_03(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).Kin.LKNE = LKNE_noFloat_03(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).Kin.LANK = LANK_noFloat_03(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).Kin.LTOE = LTOE_noFloat_03(startIndexKin:endIndexKin,:);
        
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).EMG.LTA = LTA_noFloat_03(startIndexEmg:endIndexEmg);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).EMG.LMG = LMG_noFloat_03(startIndexEmg:endIndexEmg);
        end
        
        if (k < length(noFloat_03_FS_right) && k < length(noFloat_03_FO_right))
        
            if (noFloat_03_FO_right(k) < noFloat_03_FS_right(k))
                startIndexKin = int16(noFloat_03_FO_right(k)*fsKIN_noFloat_03);
                endIndexKin = int16(noFloat_03_FS_right(k)*fsKIN_noFloat_03);
                startIndexEmg = int16(noFloat_03_FO_right(k)*fsEMG_noFloat_03);
                endIndexEmg = int16(noFloat_03_FS_right(k)*fsEMG_noFloat_03);
            else 
                startIndexKin = int16(noFloat_03_FS_right(k)*fsKIN_noFloat_03);
                endIndexKin = int16(noFloat_03_FO_right(k)*fsKIN_noFloat_03);
                startIndexEmg = int16(noFloat_03_FS_right(k)*fsEMG_noFloat_03);
                endIndexEmg = int16(noFloat_03_FO_right(k)*fsEMG_noFloat_03);
            end
        
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).Kin.RASI = RASI_noFloat_03(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).Kin.RKNE = RKNE_noFloat_03(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).Kin.RANK = RANK_noFloat_03(startIndexKin:endIndexKin,:);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).Kin.RTOE = RTOE_noFloat_03(startIndexKin:endIndexKin,:);
       
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).EMG.RTA = RTA_noFloat_03(startIndexEmg:endIndexEmg);
            SCI_GaitCycles_noFloat.(strcat('GC',num2str(k+firstLengthNF+secondLengthNF))).EMG.RMG = RMG_noFloat_03(startIndexEmg:endIndexEmg);
        end
        
    end


