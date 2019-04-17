
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
     
   
    
%% Grand truth gait events detection

[data_01_FS_leftFloat1, data_01_FS_rightFloat1,data_01_FO_leftFloat1, data_01_FO_rightFloat1, ...
    data_02_FS_leftFloat1, data_02_FS_rightFloat1, data_02_FO_leftFloat1, data_02_FO_rightFloat1, ...
    data_03_FS_leftFloat1, data_03_FS_rightFloat1,data_03_FO_leftFloat1, ...
    data_03_FO_rightFloat1] = groundTruthTool('Healthy Recordings/Subject1_2018/FLOAT/S1_FLOAT.mat');

[data_01_FS_leftNoFloat1, data_01_FS_rightNoFloat1, data_01_FO_leftNoFloat1, data_01_FO_rightNoFloat1, ...
    data_02_FS_leftNoFloat1, data_02_FS_rightNoFloat1, data_02_FO_leftNoFloat1, data_02_FO_rightNoFloat1, ...
    data_03_FS_leftNoFloat1, data_03_FS_rightNoFloat1, data_03_FO_leftNoFloat1,...
    data_03_FO_rightNoFloat1] = groundTruthTool('Healthy Recordings/Subject1_2018/NO_FLOAT/S1_NO_FLOAT.mat');

[data_01_FS_leftFloat2, data_01_FS_rightFloat2,data_01_FO_leftFloat2, data_01_FO_rightFloat2, ...
    data_02_FS_leftFloat2, data_02_FS_rightFloat2, data_02_FO_leftFloat2, data_02_FO_rightFloat2, ...
    data_03_FS_leftFloat2, data_03_FS_rightFloat2,data_03_FO_leftFloat2, ...
    data_03_FO_rightFloat2] = groundTruthTool('Healthy Recordings/Subject2_2018/FLOAT/S2_FLOAT.mat');

[data_01_FS_leftNoFloat2, data_01_FS_rightNoFloat2, data_01_FO_leftNoFloat2, data_01_FO_rightNoFloat2, ...
    data_02_FS_leftNoFloat2, data_02_FS_rightNoFloat2, data_02_FO_leftNoFloat2, data_02_FO_rightNoFloat2, ...
    data_03_FS_leftNoFloat2, data_03_FS_rightNoFloat2, data_03_FO_leftNoFloat2,...
    data_03_FO_rightNoFloat2] = groundTruthTool('Healthy Recordings/Subject2_2018/NO_FLOAT/S2_NO_FLOAT.mat');

[data_01_FS_leftFloat3, data_01_FS_rightFloat3,data_01_FO_leftFloat3, data_01_FO_rightFloat3, ...
    data_02_FS_leftFloat3, data_02_FS_rightFloat3, data_02_FO_leftFloat3, data_02_FO_rightFloat3, ...
    data_03_FS_leftFloat3, data_03_FS_rightFloat3,data_03_FO_leftFloat3, ...
    data_03_FO_rightFloat3] = groundTruthTool('Healthy Recordings/Subject3_2018/FLOAT/S3_FLOAT.mat');

[data_01_FS_leftNoFloat3, data_01_FS_rightNoFloat3, data_01_FO_leftNoFloat3, data_01_FO_rightNoFloat3, ...
    data_02_FS_leftNoFloat3, data_02_FS_rightNoFloat3, data_02_FO_leftNoFloat3, data_02_FO_rightNoFloat3, ...
    data_03_FS_leftNoFloat3, data_03_FS_rightNoFloat3, data_03_FO_leftNoFloat3,...
    data_03_FO_rightNoFloat3] = groundTruthTool('Healthy Recordings/Subject3_2018/NO_FLOAT/S3_NO_FLOAT.mat');

[data_01_FS_leftFloat4, data_01_FS_rightFloat4,data_01_FO_leftFloat4, data_01_FO_rightFloat4, ...
    data_02_FS_leftFloat4, data_02_FS_rightFloat4, data_02_FO_leftFloat4, data_02_FO_rightFloat4, ...
    data_03_FS_leftFloat4, data_03_FS_rightFloat4,data_03_FO_leftFloat4, ...
    data_03_FO_rightFloat4] = groundTruthTool('Healthy Recordings/Subject4_2018/FLOAT/S4_FLOAT.mat');

[data_01_FS_leftNoFloat4, data_01_FS_rightNoFloat4, data_01_FO_leftNoFloat4, data_01_FO_rightNoFloat4, ...
    data_02_FS_leftNoFloat4, data_02_FS_rightNoFloat4, data_02_FO_leftNoFloat4, data_02_FO_rightNoFloat4, ...
    data_03_FS_leftNoFloat4, data_03_FS_rightNoFloat4, data_03_FO_leftNoFloat4,...
    data_03_FO_rightNoFloat4] = groundTruthTool('Healthy Recordings/Subject4_2018/NO_FLOAT/S4_NO_FLOAT.mat');

[data_01_FS_leftFloat5, data_01_FS_rightFloat5,data_01_FO_leftFloat5, data_01_FO_rightFloat5, ...
    data_02_FS_leftFloat5, data_02_FS_rightFloat5, data_02_FO_leftFloat5, data_02_FO_rightFloat5, ...
    data_03_FS_leftFloat5, data_03_FS_rightFloat5,data_03_FO_leftFloat5, ...
    data_03_FO_rightFloat5] = groundTruthTool('Healthy Recordings/Subject5_2018/FLOAT/S5_FLOAT.mat');

[data_01_FS_leftNoFloat5, data_01_FS_rightNoFloat5, data_01_FO_leftNoFloat5, data_01_FO_rightNoFloat5, ...
    data_02_FS_leftNoFloat5, data_02_FS_rightNoFloat5, data_02_FO_leftNoFloat5, data_02_FO_rightNoFloat5, ...
    data_03_FS_leftNoFloat5, data_03_FS_rightNoFloat5, data_03_FO_leftNoFloat5,...
    data_03_FO_rightNoFloat5] = groundTruthTool('Healthy Recordings/Subject5_2018/NO_FLOAT/S5_NO_FLOAT.mat');

[data_01_FS_leftFloat6, data_01_FS_rightFloat6,data_01_FO_leftFloat6, data_01_FO_rightFloat6, ...
    data_02_FS_leftFloat6, data_02_FS_rightFloat6, data_02_FO_leftFloat6, data_02_FO_rightFloat6, ...
    data_03_FS_leftFloat6, data_03_FS_rightFloat6,data_03_FO_leftFloat6, ...
    data_03_FO_rightFloat6] = groundTruthTool('Healthy Recordings/Subject6_2018/FLOAT/S6_FLOAT.mat');

[data_01_FS_leftNoFloat6, data_01_FS_rightNoFloat6, data_01_FO_leftNoFloat6, data_01_FO_rightNoFloat6, ...
    data_02_FS_leftNoFloat6, data_02_FS_rightNoFloat6, data_02_FO_leftNoFloat6, data_02_FO_rightNoFloat6, ...
    data_03_FS_leftNoFloat6, data_03_FS_rightNoFloat6, data_03_FO_leftNoFloat6,...
    data_03_FO_rightNoFloat6] = groundTruthTool('Healthy Recordings/Subject6_2018/NO_FLOAT/S6_NO_FLOAT.mat');

[data_01_FS_leftFloat7, data_01_FS_rightFloat7,data_01_FO_leftFloat7, data_01_FO_rightFloat7, ...
    data_02_FS_leftFloat7, data_02_FS_rightFloat7, data_02_FO_leftFloat7, data_02_FO_rightFloat7, ...
    data_03_FS_leftFloat7, data_03_FS_rightFloat7,data_03_FO_leftFloat7, ...
    data_03_FO_rightFloat7] = groundTruthTool('Healthy Recordings/Subject1_2019/FLOAT/S1_FLOAT.mat');

[data_01_FS_leftNoFloat7, data_01_FS_rightNoFloat7, data_01_FO_leftNoFloat7, data_01_FO_rightNoFloat7, ...
    data_02_FS_leftNoFloat7, data_02_FS_rightNoFloat7, data_02_FO_leftNoFloat7, data_02_FO_rightNoFloat7, ...
    data_03_FS_leftNoFloat7, data_03_FS_rightNoFloat7, data_03_FO_leftNoFloat7,...
    data_03_FO_rightNoFloat7] = groundTruthTool('Healthy Recordings/Subject1_2019/NO_FLOAT/S1_NO_FLOAT.mat');

[data_01_FS_leftFloat8, data_01_FS_rightFloat8,data_01_FO_leftFloat8, data_01_FO_rightFloat8, ...
    data_02_FS_leftFloat8, data_02_FS_rightFloat8, data_02_FO_leftFloat8, data_02_FO_rightFloat8, ...
    data_03_FS_leftFloat8, data_03_FS_rightFloat8,data_03_FO_leftFloat8, ...
    data_03_FO_rightFloat8] = groundTruthTool('Healthy Recordings/Subject2_2019/FLOAT/S2_FLOAT.mat');

[data_01_FS_leftNoFloat8, data_01_FS_rightNoFloat8, data_01_FO_leftNoFloat8, data_01_FO_rightNoFloat8, ...
    data_02_FS_leftNoFloat8, data_02_FS_rightNoFloat8, data_02_FO_leftNoFloat8, data_02_FO_rightNoFloat8, ...
    data_03_FS_leftNoFloat8, data_03_FS_rightNoFloat8, data_03_FO_leftNoFloat8,...
    data_03_FO_rightNoFloat8] = groundTruthTool('Healthy Recordings/Subject2_2019/NO_FLOAT/S2_NO_FLOAT.mat');

[data_01_FS_leftFloat9, data_01_FS_rightFloat9,data_01_FO_leftFloat9, data_01_FO_rightFloat9, ...
    data_02_FS_leftFloat9, data_02_FS_rightFloat9, data_02_FO_leftFloat9, data_02_FO_rightFloat9, ...
    data_03_FS_leftFloat9, data_03_FS_rightFloat9,data_03_FO_leftFloat9, ...
    data_03_FO_rightFloat9] = groundTruthTool('Healthy Recordings/Subject3_2019/FLOAT/S3_FLOAT.mat');

[data_01_FS_leftNoFloat9, data_01_FS_rightNoFloat9, data_01_FO_leftNoFloat9, data_01_FO_rightNoFloat9, ...
    data_02_FS_leftNoFloat9, data_02_FS_rightNoFloat9, data_02_FO_leftNoFloat9, data_02_FO_rightNoFloat9, ...
    data_03_FS_leftNoFloat9, data_03_FS_rightNoFloat9, data_03_FO_leftNoFloat9,...
    data_03_FO_rightNoFloat9] = groundTruthTool('Healthy Recordings/Subject3_2019/NO_FLOAT/S3_NO_FLOAT.mat');

%% GAIT CYCLES SEGMENTATION
leftFoot = false;

% SCI SUBJECT

% pour le moment left foot par defaut : A CHANGER !!!!!!
[SCI_GaitCycles_Float, SCI_GaitCycles_noFloat] = SCIsegmentation(leftFoot);

% % HEALTHY SUBJECT

[GaitCyclesFloat1,GaitCyclesNoFloat1] = HealthySegmentation1('Healthy Recordings/Subject1_2018/FLOAT/S1_FLOAT.mat', ...
    'Healthy Recordings/Subject1_2018/NO_FLOAT/S1_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat2,GaitCyclesNoFloat2] = HealthySegmentation1('Healthy Recordings/Subject2_2018/FLOAT/S2_FLOAT.mat', ...
    'Healthy Recordings/Subject2_2018/NO_FLOAT/S2_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat3,GaitCyclesNoFloat3] = HealthySegmentation1('Healthy Recordings/Subject3_2018/FLOAT/S3_FLOAT.mat', ...
    'Healthy Recordings/Subject3_2018/NO_FLOAT/S3_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat4,GaitCyclesNoFloat4] = HealthySegmentation1('Healthy Recordings/Subject4_2018/FLOAT/S4_FLOAT.mat', ...
    'Healthy Recordings/Subject4_2018/NO_FLOAT/S4_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat5,GaitCyclesNoFloat5] = HealthySegmentation1('Healthy Recordings/Subject5_2018/FLOAT/S5_FLOAT.mat', ...
    'Healthy Recordings/Subject5_2018/NO_FLOAT/S5_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat6,GaitCyclesNoFloat6] = HealthySegmentation1('Healthy Recordings/Subject6_2018/FLOAT/S6_FLOAT.mat', ...
    'Healthy Recordings/Subject6_2018/NO_FLOAT/S6_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat7,GaitCyclesNoFloat7] = HealthySegmentation1('Healthy Recordings/Subject1_2019/FLOAT/S1_FLOAT.mat', ...
    'Healthy Recordings/Subject1_2019/NO_FLOAT/S1_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat8,GaitCyclesNoFloat8] = HealthySegmentation1('Healthy Recordings/Subject2_2019/FLOAT/S2_FLOAT.mat', ...
    'Healthy Recordings/Subject2_2019/NO_FLOAT/S2_NO_FLOAT.mat',leftFoot);

[GaitCyclesFloat9,GaitCyclesNoFloat9] = HealthySegmentation1('Healthy Recordings/Subject3_2019/FLOAT/S3_FLOAT.mat', ...
     'Healthy Recordings/Subject3_2019/NO_FLOAT/S3_NO_FLOAT.mat',leftFoot);

% exemple des features pour un gait cycle
rightLeg = true;
PCA_parameters_matrix = [];
SCI = false;
number_subjects = 10;

result = initialize_matrix(GaitCyclesNoFloat8.GC1,SCI,rightLeg);



%% calculate all parameters for all gait cycles

% rightLeg is True if the right leg is used as reference to segment the
% gait cycles and is False if the left leg is used

% sampling_frequency_kin is the sampling frequency of the kinetics
% measures

function parameters = initialize_matrix(GaitCycle, SCI, rightLeg)
    
    %kinematic parameters
    [max_angle_HIP_right, max_angle_KNE_right, max_angle_ANK_right,...
        max_vAng_ANK_right] = calculate_jointAngles(GaitCycle, 1, SCI);
    [max_angle_HIP_left, max_angle_KNE_left, max_angle_ANK_left,...
        max_vAng_ANK_left]= calculate_jointAngles(GaitCycle, 0, SCI);
    [max_elevationangle_THIGH_right, max_elevationangle_SHANK_right,...
        max_elevationangle_FOOT_right] = calculate_elevationAngles(GaitCycle, 1, SCI);
    [max_elevationangle_THIGH_left, max_elevationangle_SHANK_left,...
        max_elevationangle_FOOT_left] = calculate_elevationAngles(GaitCycle, 0, SCI);
    strideLength_right = calculate_strideLength(GaitCycle, 1);
    strideLength_left = calculate_strideLength(GaitCycle, 0);
    [peakSwingVelocity_right, peakSwingAcceleration_right] = calculate_peakSwing (GaitCycle, 1);
    [peakSwingVelocity_left, peakSwingAcceleration_left] = calculate_peakSwing (GaitCycle, 0);
       
    [right_step_width,left_step_width] = calculate_step_width(GaitCycle, ...
        rightLeg);
    [max_clearance_toe_right, max_clearance_toe_left, max_clearance_heel_right, ...
        max_clearance_heel_left] = calculate_max_clearance(GaitCycle);
    [step_length_right,step_length_left] = step_length(GaitCycle,rightLeg);
    [step_period_left,step_period_right] = calculate_step_period(GaitCycle,rightLeg);
    [initial_double_support,terminal_double_support] = calculate_double_support(...
        GaitCycle,rightLeg);
    [stance_left, stance_right] = calculate_stance(GaitCycle, rightLeg);
    [swing_left,swing_right] = calculate_swing(GaitCycle, rightLeg);
    [cadence] = calculate_cadence(GaitCycle);
    [swing_SI, swing_SR, stance_SI, stance_SR, step_period_SI, step_period_SR, ...
        step_length_SI, step_length_SR, max_clearance_toe_SI,max_clearance_toe_SR, ...
        max_clearance_heel_SI,max_clearance_heel_SR, step_width_SI,step_width_SR] = ...
        calculate_gait_cycle_symmetry(GaitCycle, rightLeg);


    %emg parameters
    
    % CHOISIR UNE SEULE VALEUR DANS LE VECTEUR DE VALEURS !!!!!
    % angle_HIP_right, angle_KNE_right, angle_ANK_right
    % elevationangle_THIGH_right, elevationangle_SHANK_right, elevationangle_FOOT_right
    % angle_HIP_left, angle_KNE_left, angle_ANK_left
    % elevationangle_THIGH_left, elevationangle_SHANK_left, elevationangle_FOOT_left
    
    
    %collect all calculated parameters into one vector
    parameters = [max_angle_HIP_right, max_angle_KNE_right, max_angle_ANK_right,...
        max_vAng_ANK_right, ...
        max_angle_HIP_left, max_angle_KNE_left, max_angle_ANK_left, ...
        max_vAng_ANK_left, ...
        max_elevationangle_THIGH_right, max_elevationangle_SHANK_right, max_elevationangle_FOOT_right, ...
        max_elevationangle_THIGH_left, max_elevationangle_SHANK_left, max_elevationangle_FOOT_left, ...
        strideLength_right, strideLength_left, ...
        peakSwingVelocity_right, peakSwingAcceleration_right,...
        peakSwingVelocity_left, peakSwingAcceleration_left, ...
        right_step_width,left_step_width, ...
        max_clearance_toe_right, max_clearance_toe_left, max_clearance_heel_right, max_clearance_heel_left, ...
        step_length_right, step_length_left, ...
        swing_SI, swing_SR, stance_SI, stance_SR, step_period_SI, step_period_SR, step_length_SI, step_length_SR, ...
        max_clearance_toe_SI, max_clearance_toe_SR, max_clearance_heel_SI, max_clearance_heel_SR, ...
        step_width_SI, step_width_SR, ...        
        step_period_left, step_period_right, ...
        initial_double_support, terminal_double_support, ...
        stance_left, stance_right, ...
        swing_left, swing_right, ...
        cadence];
    
end

%% calculate different angles
function [max_angle_HIP, max_angle_KNE, max_angle_ANK, max_vAng_ANK] = calculate_jointAngles(data,rightLeg, SCI)
    %calculates hip, knee and ankle angle from a given kinematic data structure
    %and max angular velocity of angle
    if rightLeg
        if SCI
            Hip = data.Kin.RASI;
        else
            Hip = data.Kin.RHIP;
        end
        Toe = data.Kin.RTOE;
        Ankle = data.Kin.RANK;
        Knee = data.Kin.RKNE;         
    else
        if SCI
            Hip = data.Kin.LASI;
        else
            Hip = data.Kin.LHIP;
        end
        Toe = data.Kin.LTOE;
        Ankle = data.Kin.LANK;
        Knee = data.Kin.LKNE;    
    end
    
    angle_ANK = zeros(size(Hip,1),1);
    angle_KNE = zeros(size(Hip,1),1);
    angle_HIP = zeros(size(Hip,1),1);
    
    for i=1:length(Hip(:,1))
        pt1 = Hip(i,:);
        pt2 = Knee(i,:);
        pt3 = Ankle(i,:);
        pt4 = Toe(i,:);
        
        %triangle hip knee ankle with sides a b c
        a = norm(Hip(i,:)-Ankle(i,:)); 
        b = norm(Knee(i,:)-Hip(i,:));
        c = norm(Ankle(i,:)-Knee(i,:));
        %calculation of angle using the law of cosines
        angle_KNE(i) = acosd((b*b + c*c -a*a)/(2*b*c));
        angle_HIP(i) = acosd((a*a + b*b -c*c)/(2*a*b));
        
        
        %triangle knee ankle toe
        a = norm(Toe(i,:)-Ankle(i,:));
        b = norm(Knee(i,:)-Toe(i,:));
        c = norm(Ankle(i,:)-Knee(i,:));
        angle_ANK(i) = acosd((a*a + c*c -b*b)/(2*a*c));
    end
    
    max_angle_HIP = max(angle_HIP);
    max_angle_KNE = max(angle_KNE);
    max_angle_ANK = max(angle_ANK);
    max_vAng_ANK = max(diff(angle_ANK));
end

%% calculate elevation angles 
function [max_elevationangle_THIGH, max_elevationangle_SHANK,...
    max_elevationangle_FOOT] = calculate_elevationAngles(data,rightLeg, SCI)
    %calculates knee and ankle angle from a given kinematic data structure
    if rightLeg
        if SCI
            Hip = data.Kin.RASI;
        else
            Hip = data.Kin.RHIP;
        end
        Toe = data.Kin.RTOE;
        Ankle = data.Kin.RANK;
        Knee = data.Kin.RKNE;         
    else
        if SCI
            Hip = data.Kin.LASI;
        else
            Hip = data.Kin.LHIP;
        end
        Toe = data.Kin.LTOE;
        Ankle = data.Kin.LANK;
        Knee = data.Kin.LKNE;    
    end
    
    elevationangle_THIGH = zeros(size(Hip,1),1);
    elevationangle_SHANK = zeros(size(Hip,1),1);
    elevationangle_FOOT = zeros(size(Hip,1),1);
    
    %gravity vector with length 1
    g = [0,-1,0];
    
    for i=1:length(Hip(:,1))
        pt1 = Hip(i,:);
        pt2 = Knee(i,:);
        pt3 = Ankle(i,:);
        pt4 = Toe(i,:);
        
        a = (Hip(i,:)-Knee(i,:))/norm(Hip(i,:)-Knee(i,:)); 
        b = (Knee(i,:)-Ankle(i,:))/norm(Knee(i,:)-Ankle(i,:));
        c = (Ankle(i,:)-Toe(i,:))/norm(Ankle(i,:)-Toe(i,:));
        
        elevationangle_THIGH(i)    = acosd(g/a);
        elevationangle_SHANK(i)    = acosd(g/b);
        elevationangle_FOOT(i)     = acosd(g/c);
    end
    
    max_elevationangle_THIGH = max(elevationangle_THIGH);
    max_elevationangle_SHANK = max(elevationangle_SHANK);
    max_elevationangle_FOOT = max(elevationangle_FOOT);
end

%% calculate elevation angles 
function strideLength = calculate_strideLength(data, rightLeg)
    if rightLeg
        Ankle = data.Kin.RANK;         
    else
        Ankle = data.Kin.LANK;    
    end
    
    strideLength = norm(Ankle(end,:)-Ankle(1,:));
end

%% calculate peak swing velocity and acceleration

function [peakSwingVelocity, peakSwingAcceleration] = calculate_peakSwing (data,rightLeg)
    if rightLeg
        Knee = data.Kin.RKNE;
        Ankle = data.Kin.RANK;
    else
        Knee = data.Kin.LKNE;
        Ankle = data.Kin.LANK;
    end
    
    peakSwingVelocity = max(diff(Ankle(:,2)));
    peakSwingAcceleration = max(diff(diff(Ankle(:,2))));
    
end

%% Cadence

function [cadence] = calculate_cadence(GaitCycle)
    GCT = length(GaitCycle.Kin.LANK(:,1))/GaitCycle.fsKIN;
    cadence = 120/GCT;  
end

%% Swing

% rightLeg is a variable with value True or False to indicate whether the
% foot used to determine the gait cycles is the right foot or the left foot

function [swing_left,swing_right] = calculate_swing(GaitCycle, rightLeg)
    
    reference_foot_strike = length(GaitCycle.Kin.LANK(:,1))/GaitCycle.fsKIN;
    
    if rightLeg % the reference foot is the right foot
        
        FS_right = reference_foot_strike;
        
        if ~  isempty(GaitCycle.FS_left) && ~  isempty(GaitCycle.FO_left)
            swing_left = GaitCycle.FS_left - GaitCycle.FO_left ;
        else
            swing_left = [];
        end
        
        if ~  isempty(GaitCycle.FO_right)
            swing_right = FS_right - GaitCycle.FO_right;
        else
            swing_right = [];
        end
        
    else  % reference is the left foot
        FS_left = reference_foot_strike;
        
        if ~  isempty(GaitCycle.FS_right) && ~  isempty(GaitCycle.FO_right)
            swing_right = GaitCycle.FS_right - GaitCycle.FO_right;
        else
            swing_right = [];
        end
        
        if ~  isempty(GaitCycle.FO_left)
            swing_left = FS_left - GaitCycle.FO_left;
        else
            swing_left = [];
        end
    end
end

%% Stance

% rightLeg is a variable with value True or False to indicate whether the
% foot used to determine the gait cycles is the right foot or the left foot

% for the stance period of the non reference foot, we do an approximation : 
% we use the end of the stance from the lase gait cycle and the beginning
% of the stance from the curremt gait cycle

function [stance_left, stance_right] = calculate_stance(GaitCycle, rightLeg)

    reference_foot_strike = length(GaitCycle.Kin.LANK(:,1))/GaitCycle.fsKIN;

    if rightLeg % reference foot is the right foot
        
        if ~  isempty(GaitCycle.FO_right)
           stance_right = GaitCycle.FO_right;
        else
            stance_right = [];
        end
        
        if ~  isempty(GaitCycle.FO_left) && ~  isempty(GaitCycle.FS_left)
            stance_left = GaitCycle.FO_left + (reference_foot_strike - GaitCycle.FS_left);
        else
            stance_left = [];
        end
        
        
    else % the reference foot is the left foot
        
        if ~  isempty(GaitCycle.FO_left)
            stance_left = GaitCycle.FO_left;
        else
            stance_left = [];
        end
        
        if ~  isempty(GaitCycle.FO_right) && ~  isempty(GaitCycle.FS_right)
            stance_right = GaitCycle.FO_right + (reference_foot_strike - GaitCycle.FS_right);
        else
            stance_right = [];
        end
    end

end

%% Double support

% evaluates the duration of the initial and terminal double supports during
% the gait cycle

function [initial_double_support,terminal_double_support] = calculate_double_support(...
    GaitCycle,rightLeg)
    
    if rightLeg
        
        if ~  isempty(GaitCycle.FO_left)
            initial_double_support = GaitCycle.FO_left;
        else
            initial_double_support = [];
        end
        
        if ~  isempty(GaitCycle.FS_left) && ~  isempty(GaitCycle.FO_right)
            terminal_double_support = GaitCycle.FO_right - GaitCycle.FS_left;
        else
            terminal_double_support = [];
        end
        
    else % left foot is the reference
        
        if ~  isempty(GaitCycle.FO_right)
            initial_double_support = GaitCycle.FO_right;
        else
            initial_double_support = [];
        end
        
        if ~  isempty(GaitCycle.FS_right) && ~  isempty(GaitCycle.FO_left)
            terminal_double_support = GaitCycle.FO_left - GaitCycle.FS_right;
        else
           terminal_double_support = []; 
        end
        
    end

end

%% Step period

% Step period is determined as the time between 2 consecutive footstrikes
% (definition cours)
% Step left is the step during which foot left swings
% Step right is the step during which foot right swings

function [step_period_left,step_period_right] = calculate_step_period(GaitCycle,rightLeg)

    reference_foot_strike = length(GaitCycle.Kin.LANK(:,1))/GaitCycle.fsKIN;
    
    if rightLeg
        
        if ~  isempty(GaitCycle.FS_left)
            step_period_left = GaitCycle.FS_left;
            step_period_right = reference_foot_strike - GaitCycle.FS_left;
        else
            step_period_left = [];
            step_period_right = [];
        end
        
    else
        
        if ~  isempty(GaitCycle.FS_right)
            step_period_right = GaitCycle.FS_right;
            step_period_left = reference_foot_strike - GaitCycle.FS_right;
        else
            step_period_right = [];
            step_period_left = [];
        end
        
    end

end

%% Step length

% corresponds to the distance covered between the initial contact of one
% foot and the following initial contact of the contralateral foot
% = distance between 2 consecutive footstrikes (Y direction)
% (definition cours)

function [step_length_right,step_length_left] = step_length(GaitCycle,rightLeg)

    if rightLeg
        
        if ~  isempty(GaitCycle.FS_left)
            FS_right1 = GaitCycle.Kin.RANK(1,2);
            index_FS_left = round(GaitCycle.FS_left*GaitCycle.fsKIN);
            FS_left = GaitCycle.Kin.LANK(index_FS_left,2);           
            FS_right2 = GaitCycle.Kin.RANK(end,2);
            
            step_length_left = abs(FS_left-FS_right1);
            step_length_right = abs(FS_right2-FS_left);
        else
            step_length_right = [];
            step_length_left = [];
        end
        
    else
        
        if ~  isempty(GaitCycle.FS_right)
            FS_left1 = GaitCycle.Kin.LANK(1,2);
            index_FS_right = round(GaitCycle.FS_right*GaitCycle.fsKIN);
            FS_right = GaitCycle.Kin.RANK(index_FS_right,2);
            FS_left2 = GaitCycle.Kin.LANK(end,2);
            
            step_length_right = abs(FS_right - FS_left1);
            step_length_left = abs(FS_left2 - FS_right);
        else
            step_length_right = [];
            step_length_left = [];
        end
       
    end

end

%% Heel and toe max clearance

function [max_clearance_toe_right, max_clearance_toe_left, max_clearance_heel_right, ...
    max_clearance_heel_left] = calculate_max_clearance(GaitCycle)
    
    GaitCycle_heel_left = GaitCycle.Kin.LANK(:,3);
    GaitCycle_toe_left = GaitCycle.Kin.LTOE(:,3);
    GaitCycle_heel_right = GaitCycle.Kin.RANK(:,3);
    GaitCycle_toe_right = GaitCycle.Kin.RTOE(:,3);
    
    max_clearance_heel_left = max(GaitCycle_heel_left);
    max_clearance_toe_left = max(GaitCycle_toe_left);
    max_clearance_heel_right = max(GaitCycle_heel_right);
    max_clearance_toe_right = max(GaitCycle_toe_right);

    
end

%% Step width

% Step width was determined as the distance in X between the ankles 
% of two consecutive footprints (between consecutive footstrikes)

function [right_step_width,left_step_width] = calculate_step_width(GaitCycle,rightLeg)
    
    if rightLeg
        
        if ~  isempty(GaitCycle.FS_left)
            FS_right1 = GaitCycle.Kin.RANK(1,1);
            index_FS_left = round(GaitCycle.FS_left*GaitCycle.fsKIN);
            FS_left = GaitCycle.Kin.LANK(index_FS_left,1);           
            FS_right2 = GaitCycle.Kin.RANK(end,1);
            
            left_step_width = abs(FS_left-FS_right1);
            right_step_width = abs(FS_right2-FS_left);
        else
            right_step_width = [];
            left_step_width = [];
        end
        
    else
        
        if ~  isempty(GaitCycle.FS_right)
            FS_left1 = GaitCycle.Kin.LANK(1,1);
            index_FS_right = round(GaitCycle.FS_right*GaitCycle.fsKIN);
            FS_right = GaitCycle.Kin.RANK(index_FS_right,1);
            FS_left2 = GaitCycle.Kin.LANK(end,1);
            
            right_step_width = abs(FS_right - FS_left1);
            left_step_width = abs(FS_left2 - FS_right);
        else
            right_step_width = [];
            left_step_width = [];
        end
       
    end

end

%% Symmetry index and ratio

% receives a feature measured for each foot for the same gait cycle and
% evaluates the symmetry between the 2 feet

function [symmetry_index,symmetry_ratio] = calculate_symmetry_param(right_param,left_param)

    if ~  isempty(right_param) && ~  isempty(left_param)
        symmetry_index = 100*(right_param - left_param)/(0.5*(right_param + left_param));
        symmetry_ratio = 100*right_param/left_param;
    else
        symmetry_index = [];
        symmetry_ratio = [];
    end

end

% here measures symmetry index for swing, stance, step period, step
% lenght, max toe clearance, max heel clearance, step width

function [swing_SI, swing_SR, stance_SI, stance_SR, step_period_SI, step_period_SR, ...
    step_length_SI, step_length_SR, ...
    max_clearance_toe_SI,max_clearance_toe_SR, max_clearance_heel_SI,max_clearance_heel_SR, ...
    step_width_SI,step_width_SR] = ...
    calculate_gait_cycle_symmetry(GaitCycle, rightLeg)

    [swing_left,swing_right] = calculate_swing(GaitCycle, rightLeg);
    [swing_SI,swing_SR] = calculate_symmetry_param(swing_right,swing_left);

    [stance_left, stance_right] = calculate_stance(GaitCycle, rightLeg);
    [stance_SI,stance_SR] = calculate_symmetry_param(stance_right,stance_left);
    
    [step_period_left,step_period_right] = calculate_step_period(GaitCycle,rightLeg);
    [step_period_SI,step_period_SR] = calculate_symmetry_param(step_period_right,step_period_left);
    
    [step_length_right,step_length_left] = step_length(GaitCycle,rightLeg);
    [step_length_SI,step_length_SR] = calculate_symmetry_param(step_length_right,step_length_left);
    
    [max_clearance_toe_right, max_clearance_toe_left, max_clearance_heel_right, ...
        max_clearance_heel_left] = calculate_max_clearance(GaitCycle);
    [max_clearance_toe_SI,max_clearance_toe_SR] = calculate_symmetry_param(...
        max_clearance_toe_right,max_clearance_toe_left);
    [max_clearance_heel_SI,max_clearance_heel_SR] = calculate_symmetry_param(...
        max_clearance_heel_right,max_clearance_heel_left);
    
    [right_step_width,left_step_width] = calculate_step_width(GaitCycle, ...
        rightLeg);
    [step_width_SI,step_width_SR] = calculate_symmetry_param(right_step_width, ...
        left_step_width);
    
end
