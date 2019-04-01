
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
    %% noCrutches_01
    noCrutches_01_FS_left=[];
    noCrutches_01_FS_right=[];
    noCrutches_01_FO_left=[];
    noCrutches_01_FO_right=[];
   
    for i = 1:length(noCrutches_01.Name)
        if string(noCrutches_01.Name{i})=='Foot Strike'
            if string(noCrutches_01.Context{i}) == 'Left'
                noCrutches_01_FS_left = [noCrutches_01_FS_left double(noCrutches_01.Time_s_(i))];
            else
                noCrutches_01_FS_right = [noCrutches_01_FS_right double(noCrutches_01.Time_s_(i))];
            end
        elseif string(noCrutches_01.Name{i})=='Foot Off'
            if string(noCrutches_01.Context{i}) == 'Left'
                noCrutches_01_FO_left = [noCrutches_01_FO_left double(noCrutches_01.Time_s_(i))];
            else
                noCrutches_01_FO_right = [noCrutches_01_FO_right double(noCrutches_01.Time_s_(i))];
            end
        end
    end    
    
    %% noCrutches_02
    noCrutches_02_FS_left=[];
    noCrutches_02_FS_right=[];
    noCrutches_02_FO_left=[];
    noCrutches_02_FO_right=[];
   
    for i = 1:length(noCrutches_02.Name)
        if string(noCrutches_02.Name{i})=='Foot Strike'
            if string(noCrutches_02.Context{i}) == 'Left'
                noCrutches_02_FS_left = [noCrutches_02_FS_left double(noCrutches_02.Time_s_(i))];
            else
                noCrutches_02_FS_right = [noCrutches_02_FS_right double(noCrutches_02.Time_s_(i))];
            end
        elseif string(noCrutches_02.Name{i})=='Foot Off'
            if string(noCrutches_02.Context{i}) == 'Left'
                noCrutches_02_FO_left = [noCrutches_02_FO_left double(noCrutches_02.Time_s_(i))];
            else
                noCrutches_02_FO_right = [noCrutches_02_FO_right double(noCrutches_02.Time_s_(i))];
            end
        end
    end
    %% noCrutches_03
    noCrutches_03_FS_left=[];
    noCrutches_03_FS_right=[];
    noCrutches_03_FO_left=[];
    noCrutches_03_FO_right=[];
   
    for i = 1:length(noCrutches_03.Name)
        if string(noCrutches_03.Name{i})=='Foot Strike'
            if string(noCrutches_03.Context{i}) == 'Left'
                noCrutches_03_FS_left = [noCrutches_03_FS_left double(noCrutches_03.Time_s_(i))];
            else
                noCrutches_03_FS_right = [noCrutches_03_FS_right double(noCrutches_03.Time_s_(i))];
            end
        elseif string(noCrutches_03.Name{i})=='Foot Off'
            if string(noCrutches_03.Context{i}) == 'Left'
                noCrutches_03_FO_left = [noCrutches_03_FO_left double(noCrutches_03.Time_s_(i))];
            else
                noCrutches_03_FO_right = [noCrutches_03_FO_right double(noCrutches_03.Time_s_(i))];
            end
        end
    end
    
    
    %% Crutches_01
    Crutches_01_FS_left=[];
    Crutches_01_FS_right=[];
    Crutches_01_FO_left=[];
    Crutches_01_FO_right=[];
   
    for i = 1:length(Crutches_01.Name)
        if string(Crutches_01.Name{i})=='Foot Strike'
            if string(Crutches_01.Context{i}) == 'Left'
                Crutches_01_FS_left = [Crutches_01_FS_left double(Crutches_01.Time_s_(i))];
            else
                Crutches_01_FS_right = [Crutches_01_FS_right double(Crutches_01.Time_s_(i))];
            end
        elseif string(Crutches_01.Name{i})=='Foot Off'
            if string(Crutches_01.Context{i}) == 'Left'
                Crutches_01_FO_left = [Crutches_01_FO_left double(Crutches_01.Time_s_(i))];
            else
                Crutches_01_FO_right = [Crutches_01_FO_right double(Crutches_01.Time_s_(i))];
            end
        end
    end
%% Crutches_02
    Crutches_02_FS_left=[];
    Crutches_02_FS_right=[];
    Crutches_02_FO_left=[];
    Crutches_02_FO_right=[];
   
    for i = 1:length(Crutches_02.Name)
        if string(Crutches_02.Name{i})=='Foot Strike'
            if string(Crutches_02.Context{i}) == 'Left'
                Crutches_02_FS_left = [Crutches_02_FS_left double(Crutches_02.Time_s_(i))];
            else
                Crutches_02_FS_right = [Crutches_02_FS_right double(Crutches_02.Time_s_(i))];
            end
        elseif string(Crutches_02.Name{i})=='Foot Off'
            if string(Crutches_02.Context{i}) == 'Left'
                Crutches_02_FO_left = [Crutches_02_FO_left double(Crutches_02.Time_s_(i))];
            else
                Crutches_02_FO_right = [Crutches_02_FO_right double(Crutches_02.Time_s_(i))];
            end
        end
    end
%% Crutches_03
    Crutches_03_FS_left=[];
    Crutches_03_FS_right=[];
    Crutches_03_FO_left=[];
    Crutches_03_FO_right=[];
   
    for i = 1:length(Crutches_03.Name)
        if string(Crutches_03.Name{i})=='Foot Strike'
            if string(Crutches_03.Context{i}) == 'Left'
                Crutches_03_FS_left = [Crutches_03_FS_left double(Crutches_03.Time_s_(i))];
            else
                Crutches_03_FS_right = [Crutches_03_FS_right double(Crutches_03.Time_s_(i))];
            end
        elseif string(Crutches_03.Name{i})=='Foot Off'
            if string(Crutches_03.Context{i}) == 'Left'
                Crutches_03_FO_left = [Crutches_03_FO_left double(Crutches_03.Time_s_(i))];
            else
                Crutches_03_FO_right = [Crutches_03_FO_right double(Crutches_03.Time_s_(i))];
            end
        end
    end

%%    
    %======================================================================
    % Load Data for Healthy Patient
    %======================================================================
    