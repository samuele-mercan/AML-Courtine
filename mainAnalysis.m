
function main()
    close all; clear all; 
    %======================================================================
    % Load Data for SCI subject
    %======================================================================
    % Data with no Crutches 
    
    datasetName1 = 'Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/MAT/FLOAT_NO_CRUTCHES.mat';
    load(datasetName1); % load data structure   
    
    noCrutches_01 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_03_GAIT.csv');
    noCrutches_02 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_04_GAIT.csv');
    noCrutches_03 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_05_GAIT.csv');
    
    % Data with Crutches
    
    datasetName2 = 'Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/MAT/NO_FLOAT_CRUTCHES.mat';
    load(datasetName2); % load data structure   
    
    Crutches_01 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_01_GAIT.csv');
    Crutches_02 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_02_GAIT.csv');
    Crutches_03 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_03_GAIT.csv');
    
    
    % Create the ground truth based on the csv features 
    
%% SEGMENTATION USING CSV FILE     
    L_ANK_01 = FLOAT_NO_CRUTCHES.T_01.Raw.Kin.LANK(:,1);
    
    % create the time vector for plotting
    time_start = 0;
    time_end = (length(L_ANK_01)-1)/FLOAT_NO_CRUTCHES.T_01.fsKIN;
    time_step = 1/FLOAT_NO_CRUTCHES.T_01.fsKIN;
    time = time_start:time_step:time_end;
    A = table2array(noCrutches_01(1:9,4));
    B = round(A*FLOAT_NO_CRUTCHES.T_01.fsKIN,0);
    C = table2array(noCrutches_01(10:17,4));
    D = round(C*FLOAT_NO_CRUTCHES.T_01.fsKIN,0);
    
%     [pks,locs]=findpeaks (L_ANK_01(:,1),'MinPeakDistance',60);
    
    figure()
    plot(time, L_ANK_01)
    hold on
    plot(time, FLOAT_NO_CRUTCHES.T_01.Raw.Kin.LTOE(:,1))
    plot(time, FLOAT_NO_CRUTCHES.T_01.Raw.Kin.LKNE(:,1))

    scatter(A, L_ANK_01(B));
    scatter(C, L_ANK_01(D));
%     scatter(time(locs), pks)
    
   legend('ankle kinematics','Toe kinematics','Knee','foot strike', 'foot off')
%     legend('ankle kinematics','Toe kinematics','Knee','peaks')
%     title("left ankle")
    
    

%%    
    %======================================================================
    % Load Data for Healthy Patient
    %======================================================================
    