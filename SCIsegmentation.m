function [SCI_GaitCycles_Float, SCI_GaitCycles_noFloat] = SCIsegmentation(leftFoot)
    
    % load the gait events for the FLOAT and NO FLOAT for a subject
    
    % calls segmentation for both FLOAT and NO FLOAT data of a SCI subject 
    % to segment the signals into gait cycles and associate each gait cycle 
    % with its related gait events (FS_left,FS_right,FO_left, FO_right)
    
    % leftFoot indicates which foot to use for the segmentation
    
    % Data with Float, no Crutches 
    
    datasetFloatName = 'Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/MAT/FLOAT_NO_CRUTCHES.mat';
    Float_01 = readtable([pwd,'/Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_03_GAIT.csv']);
    Float_02 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_04_GAIT.csv');
    Float_03 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_05_GAIT.csv');
    
    SCI_GaitCycles_Float = segmentation(datasetFloatName, Float_01, Float_02, Float_03, leftFoot); 
    
    % Data without Float, with Crutches

    datasetNoFloat = 'Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/MAT/NO_FLOAT_CRUTCHES.mat';  

    noFloat_01 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_01_GAIT.csv');
    noFloat_02 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_02_GAIT.csv');
    noFloat_03 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_03_GAIT.csv');

    SCI_GaitCycles_noFloat = segmentation(datasetNoFloat, noFloat_01, noFloat_02, noFloat_03, leftFoot); 
    