
function main()
    close all; clear all; 
    %======================================================================
    % Load Data for SCI subject
    %======================================================================
    % Data with no Crutches 
    
    datasetName1 = 'Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/MAT/FLOAT_NO_CRUTCHES.mat';
    load(datasetName1); % load data structure   
    
    noCrutches_03 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_03_GAIT.csv');
    noCrutches_04 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_04_GAIT.csv');
    noCrutches_05 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_05_GAIT.csv');
    
    % Data with Crutches
    
    datasetName2 = 'Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/MAT/NO_FLOAT_CRUTCHES.mat';
    load(datasetName2); % load data structure   
    
    Crutches_01 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_01_GAIT.csv');
    Crutches_02 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_02_GAIT.csv');
    Crutches_03 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_03_GAIT.csv');
    
    
    % Create the ground truth based on the csv features 
    
%% SEGMENTATION USING CSV FILE     
    L_ANK_02 = NO_FLOAT_CRUTCHES.T_02.Raw.Kin.LANK;
    
    % create the time vector for plotting
    time_start = 0;
    time_end = (length(L_ANK_02)-1)/NO_FLOAT_CRUTCHES.T_02.fsKIN;
    time_step = 1/NO_FLOAT_CRUTCHES.T_02.fsKIN;
    time = time_start:time_step:time_end;
    A = table2array(Crutches_02(1:9,4));
    B = round(A*NO_FLOAT_CRUTCHES.T_02.fsKIN,0);
    C = table2array(Crutches_02(10:17,4));
    D = round(C*NO_FLOAT_CRUTCHES.T_02.fsKIN,0);
    
    figure()
    plot(time, L_ANK_02(:,1))
    hold on
    scatter(A, L_ANK_02(B,1));
    scatter(C, L_ANK_02(D,1));
    title("left ankle")
    legend('ankle kinematics','foot strike', 'foot off')
    
    figure()
    plot(time, NO_FLOAT_CRUTCHES.T_02.Raw.Kin.LTOE(:,1))
    hold on
    scatter(A, NO_FLOAT_CRUTCHES.T_02.Raw.Kin.LTOE(B,1));
    scatter(C, NO_FLOAT_CRUTCHES.T_02.Raw.Kin.LTOE(D,1));
    legend('foot kinematics','foot strike', 'foot off')
    title("left toe")
    
    

%%    
    %======================================================================
    % Load Data for Healthy Patient
    %======================================================================
    