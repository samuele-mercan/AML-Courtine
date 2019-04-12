
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
    
%% PARAMETERS FROM KINEMATICS

% GAIT CYCLE TIME (GCT)

GCT_noCrutches_left = [];
GCT_noCrutches_right = [];

GCT_Crutches_left = [];
GCT_Crutches_right = [];

%to find the total time 

% time_start = 0;
% %we take one kinemtic marker, they all have the same length
% %and we define the number of points taken by the sampling frequency to get
% %the time 
% time_end = length(NO_FLOAT_CRUTCHES.T_01.Raw.Kin.LANK(:,3))/FLOAT_NO_CRUTCHES.T_01.fsKIN;
% time_step = 1/FLOAT_NO_CRUTCHES.T_01.fsKIN;
% time = time_start:time_step:time_end;

for index=1:length(noCrutches_01_FS_left)-1
    GCT_noCrutches_left = [GCT_noCrutches_left (noCrutches_01_FS_left(index+1)-noCrutches_01_FS_left(index))];
end

for index=1:length(noCrutches_02_FS_left)-1
    GCT_noCrutches_left = [GCT_noCrutches_left (noCrutches_02_FS_left(index+1)-noCrutches_02_FS_left(index))];
end

for index=1:length(noCrutches_03_FS_left)-1
    GCT_noCrutches_left = [GCT_noCrutches_left (noCrutches_03_FS_left(index+1)-noCrutches_03_FS_left(index))];
end

for index=1:length(noCrutches_01_FS_right)-1
    GCT_noCrutches_right = [GCT_noCrutches_right (noCrutches_01_FS_right(index+1)-noCrutches_01_FS_right(index))];
end

for index=1:length(noCrutches_02_FS_right)-1
    GCT_noCrutches_right = [GCT_noCrutches_right (noCrutches_02_FS_right(index+1)-noCrutches_02_FS_right(index))];
end

for index=1:length(noCrutches_03_FS_right)-1
    GCT_noCrutches_right = [GCT_noCrutches_right (noCrutches_03_FS_right(index+1)-noCrutches_03_FS_right(index))];
end


for index=1:length(Crutches_01_FS_left)-1
    GCT_Crutches_left = [GCT_Crutches_left (Crutches_01_FS_left(index+1)-Crutches_01_FS_left(index))];
end

for index=1:length(Crutches_02_FS_left)-1
    GCT_Crutches_left = [GCT_Crutches_left (Crutches_02_FS_left(index+1)-Crutches_02_FS_left(index))];
end

for index=1:length(Crutches_03_FS_left)-1
    GCT_Crutches_left = [GCT_Crutches_left (Crutches_03_FS_left(index+1)-Crutches_03_FS_left(index))];
end

for index=1:length(Crutches_01_FS_right)-1
    GCT_Crutches_right = [GCT_Crutches_right (Crutches_01_FS_right(index+1)-Crutches_01_FS_right(index))];
end

for index=1:length(Crutches_02_FS_right)-1
    GCT_Crutches_right = [GCT_Crutches_right (Crutches_02_FS_right(index+1)-Crutches_02_FS_right(index))];
end

for index=1:length(Crutches_03_FS_right)-1
    GCT_Crutches_right = [GCT_Crutches_right (Crutches_03_FS_right(index+1)-Crutches_03_FS_right(index))];
end


%% Plotting template
%TODO fix it on time and not recording frame

sizeData = size (FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,1));  
samplePoints = linspace (0,sizeData(1)-1,sizeData(1)); %Just need to divide this by registration frequency

%We plot the values for the Left ANK
figure(1);
plot(samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,1),  '-r',...
    samplePoints,FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,2), '--b',...
    samplePoints,FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,3), '.-c');  
legend('x-coordinate', 'y-coordinate', 'z-coordinate');

%We plot teh values for the Right ANK
figure(2);
plot(samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RANK(:,1),  '-r',...
    samplePoints,FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RANK(:,2), '--b',...
    samplePoints,FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RANK(:,3), '.-c');  
%NOT SURE ON THE LEGEND!!! IT AFFECT ALL THE NAMES GIVEN FOR FUTURE
%VARIABLES
legend('x-coordinate', 'y-coordinate', 'z-coordinate');

%We can observe patterns in y and z coordinate
%---> TODO derive this to find velocity. IT should give nice separations of
%gait cycles!

%% Derivation of velocities and accelleration
velocity_X = diff(FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,1));
velocity_Y = diff(FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,2));
velocity_Z = diff(FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,3));
samplePointsVelocity = samplePoints;
samplePointsVelocity(:,1)=[];

figure(1);
plot(samplePointsVelocity, velocity_X',  '-r',...
    samplePointsVelocity, velocity_Y', '--b',...
    samplePointsVelocity,velocity_Z', '.-c');  
legend('x-velocity', 'y-velocity', 'z-velocity');
title('Velocity');

accelleration_X = diff(velocity_X);
accelleration_Y = diff(velocity_Y);
accelleration_Z = diff(velocity_Z);
samplePointsAcc = samplePointsVelocity;
samplePointsAcc(:,1)=[];

figure(2);
plot(samplePointsAcc, accelleration_X',  '-r',...
    samplePointsAcc, accelleration_Y', '--b',...
    samplePointsAcc,accelleration_Z', '.-c');  
legend('x-acc', 'y-acc', 'z-acc');
title('Acceleration');

end

%% calculate all parameters for all gait cycles

function parameters = initialize_matrix[data, SCI]
    %kinematic parameters
    [angle_HIP_right, angle_KNE_right, angle_ANK_right,...
        max_vAng_ANK_right] = calculate_jointAngles(data, 1);
    [angle_HIP_left, angle_KNE_left, angle_ANK_left,...
        max_vAng_ANK_left]= calculate_jointAngles(data, 0);
    [elevationangle_THIGH_right, elevationangle_SHANK_right,...
        elevationangle_FOOT_right] = calculate_jointAngles(data, 1);
    [elevationangle_THIGH_left, elevationangle_SHANK_left,...
        elevationangle_FOOT_left] = calculate_jointAngles(data, 0);
    strideLength_right = calculate_strideLength(data, 1);
    strideLength_left = calculate_strideLength(data, 0);
    [peakSwingVelocity_right, peakSwingAcceleration_right] = calculate_peakSwing (data, 1);
    [peakSwingVelocity_left, peakSwingAcceleration_left] = calculate_peakSwing (data, 0);
    
    
    %emg parameters
    
    
    
    %collect all calculated parameters into one vector
    parameters = [angle_HIP_right, angle_KNE_right, angle_ANK_right,...
        max_vAng_ANK_right, elevationangle_THIGH_right, elevationangle_SHANK_right,...
        elevationangle_FOOT_right, strideLength_right, peakSwingVelocity_right,...
        peakSwingAcceleration_right,...
        angle_HIP_left, angle_KNE_left, angle_ANK_left,...
        max_vAng_ANK_left, elevationangle_THIGH_left, elevationangle_SHANK_left,...
        elevationangle_FOOT_left,   strideLength_left, peakSwingVelocity_left,...
        peakSwingAcceleration_left];
end

%% calculate different angles
function [angle_HIP, angle_KNE, angle_ANK, max_vAng_ANK] = calculate_jointAngles(data,rightLeg, SCI)
    %calculates hip, knee and ankle angle from a given kinematic data structure
    %and max angular velocity of angle
    if rightLeg
        if SCI
            Hip = data.Kin.RASI;
        else
            Hip = data.Kin.RHIP;
        Toe = data.Kin.RTOE;
        Ankle = data.Kin.RANK;
        Knee = data.Kin.RKNE;         
    else
        if SCI
            Hip = data.Kin.LASI;
        else
            Hip = data.Kin.LHIP;
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
    
    max_vAng_ANK = max(diff(angle_ANK));
end
%% calculate elevation angles 
function [elevationangle_THIGH, elevationangle_SHANK,...
    elevationangle_FOOT] = calculate_jointAngles(data,rightLeg, SCI)
    %calculates knee and ankle angle from a given kinematic data structure
    if rightLeg
        if SCI
            Hip = data.Kin.RASI;
        else
            Hip = data.Kin.RHIP;
        Toe = data.Kin.RTOE;
        Ankle = data.Kin.RANK;
        Knee = data.Kin.RKNE;         
    else
        if SCI
            Hip = data.Kin.LASI;
        else
            Hip = data.Kin.LHIP;
        Toe = data.Kin.LTOE;
        Ankle = data.Kin.LANK;
        Knee = data.Kin.LKNE;    
    end
    
    elevationangle_THIGH = zeros(size(Hip,1),1);
    elevationangle_SHANK = zeros(size(Hip,1),1);
    elevationangle_FOOT = zeros(size(Hip,1),1);
    
    %gravity vector with length 1
    g = (0,-1,0);
    
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
    
end

%% calculate elevation angles 
function strideLength = calculate_strideLength(data, rightLeg)
    if rightLeg
        Ankle = data.RANK;         
    else
        Ankle = kin_data.LANK;    
    end
    
    strideLength = norm(Ankle(end,:)-Ankle(1,:))
end

%% calculate peak swing velocity and acceleration

function [peakSwingVelocity, peakSwingAcceleration] = calculate_peakSwing (data,rightLeg)
    if rightLeg
        Knee = data.RKNE;
        Ankle = data.RANK;
    else
        Knee = data.LKNE;
        Ankle = data.LANK;
    end
    
    peakSwingVelocity = max(diff(Ankle(:,2)));
    peakSwingAcceleration = max(diff(diff(Ankle(:,2))));
    
end
    



