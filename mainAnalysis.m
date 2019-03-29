
function main()
    close all; clear all; 
    %======================================================================
    % Load Data for SCI subject
    %======================================================================
    % Data with no Crutches 
    
    datasetName1 = 'Exercise_Material_SCI_Subject/FLOAT_NO_CRUTCHES/MAT/FLOAT_NO_CRUTCHES.mat';
    load(datasetName1); % load data structure   
    
    noCrutches_03 = readtable('Exercise_Material_SCI_Subject/FLOAT_NO_CRUTCHES/GAIT_FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_03_GAIT.csv');
    noCrutches_04 = readtable('Exercise_Material_SCI_Subject/FLOAT_NO_CRUTCHES/GAIT_FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_04_GAIT.csv');
    noCrutches_05 = readtable('Exercise_Material_SCI_Subject/FLOAT_NO_CRUTCHES/GAIT_FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_05_GAIT.csv');
    
    % Data with Crutches
    
    datasetName2 = 'Exercise_Material_SCI_Subject/NO_FLOAT_CRUTCHES/MAT/NO_FLOAT_CRUTCHES.mat';
    load(datasetName2); % load data structure   
    
    Crutches_01 = readtable('Exercise_Material_SCI_Subject/NO_FLOAT_CRUTCHES/GAIT_FILES/SCI_HCU_20150505_02OVGa_AD_01_GAIT.csv');
    Crutches_02 = readtable('Exercise_Material_SCI_Subject/NO_FLOAT_CRUTCHES/GAIT_FILES/SCI_HCU_20150505_02OVGa_AD_02_GAIT.csv');
    Crutches_03 = readtable('Exercise_Material_SCI_Subject/NO_FLOAT_CRUTCHES/GAIT_FILES/SCI_HCU_20150505_02OVGa_AD_03_GAIT.csv');
    
    
    % Create the ground truth based on the csv features 
    
      
%%    
    %======================================================================
    % Load Data for Healthy Patient
    %======================================================================
    