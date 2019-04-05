
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

%%  STRIDE LENGTH (LStride)

% stride length is defined as the distance of two consequtive foot strikes
% of the same foot

LStride_noCrutches_left = [];
LStride_noCrutches_right = [];

LStride_Crutches_left = [];
LStride_Crutches_right = [];

for index=1:(length(noCrutches_01_FS_left)-1)
    timepoint1 = round(noCrutches_01_FS_left(index)*FLOAT_NO_CRUTCHES.T_01.fsKIN,0);
    pt1 = FLOAT_NO_CRUTCHES.T_01.Raw.Kin.LANK(timepoint1,:);
    timepoint2 = round(noCrutches_01_FS_left(index+1)*FLOAT_NO_CRUTCHES.T_01.fsKIN,0);
    pt2 = FLOAT_NO_CRUTCHES.T_01.Raw.Kin.LANK(timepoint2,:);
    stridelength = norm(pt2-pt1);
    LStride_noCrutches_left = [LStride_noCrutches_left stridelength];
end

for index=1:length(noCrutches_02_FS_left)-1
    timepoint1 = round(noCrutches_02_FS_left(index)*FLOAT_NO_CRUTCHES.T_02.fsKIN,0);
    pt1 = FLOAT_NO_CRUTCHES.T_02.Raw.Kin.LANK(timepoint1,:);
    timepoint2 = round(noCrutches_02_FS_left(index+1)*FLOAT_NO_CRUTCHES.T_02.fsKIN,0);
    pt2 = FLOAT_NO_CRUTCHES.T_02.Raw.Kin.LANK(timepoint2,:);
    stridelength = norm(pt2-pt1);
    LStride_noCrutches_left = [LStride_noCrutches_left stridelength];
end

for index=1:length(noCrutches_03_FS_left)-1
    timepoint1 = round(noCrutches_03_FS_left(index)*FLOAT_NO_CRUTCHES.T_03.fsKIN,0);
    pt1 = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(timepoint1,:);
    timepoint2 = round(noCrutches_02_FS_left(index+1)*FLOAT_NO_CRUTCHES.T_03.fsKIN,0);
    pt2 = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(timepoint2,:);
    stridelength = norm(pt2-pt1);
    LStride_noCrutches_left = [LStride_noCrutches_left stridelength];
end

for index=1:length(noCrutches_01_FS_right)-1
    timepoint1 = round(noCrutches_01_FS_right(index)*FLOAT_NO_CRUTCHES.T_01.fsKIN,0);
    pt1 = FLOAT_NO_CRUTCHES.T_01.Raw.Kin.RANK(timepoint1,:);
    timepoint2 = round(noCrutches_01_FS_right(index+1)*FLOAT_NO_CRUTCHES.T_01.fsKIN,0);
    pt2 = FLOAT_NO_CRUTCHES.T_01.Raw.Kin.RANK(timepoint2,:);
    stridelength = norm(pt2-pt1);
    LStride_noCrutches_right = [LStride_noCrutches_right stridelength];
end

for index=1:length(noCrutches_02_FS_right)-1
    timepoint1 = round(noCrutches_02_FS_right(index)*FLOAT_NO_CRUTCHES.T_02.fsKIN,0);
    pt1 = FLOAT_NO_CRUTCHES.T_02.Raw.Kin.RANK(timepoint1,:);
    timepoint2 = round(noCrutches_02_FS_right(index+1)*FLOAT_NO_CRUTCHES.T_02.fsKIN,0);
    pt2 = FLOAT_NO_CRUTCHES.T_02.Raw.Kin.RANK(timepoint2,:);
    stridelength = norm(pt2-pt1);
    LStride_noCrutches_right = [LStride_noCrutches_right stridelength];
end

for index=1:length(noCrutches_03_FS_right)-1
    timepoint1 = round(noCrutches_03_FS_right(index)*FLOAT_NO_CRUTCHES.T_03.fsKIN,0);
    pt1 = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RANK(timepoint1,:);
    timepoint2 = round(noCrutches_03_FS_right(index+1)*FLOAT_NO_CRUTCHES.T_03.fsKIN,0);
    pt2 = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RANK(timepoint2,:);
    stridelength = norm(pt2-pt1);
    LStride_noCrutches_right = [LStride_noCrutches_right stridelength];
end


for index=1:length(Crutches_01_FS_left)-1
    timepoint1 = round(Crutches_01_FS_left(index)*NO_FLOAT_CRUTCHES.T_01.fsKIN,0);
    pt1 = NO_FLOAT_CRUTCHES.T_01.Raw.Kin.LANK(timepoint1,:);
    timepoint2 = round(Crutches_01_FS_left(index+1)*NO_FLOAT_CRUTCHES.T_01.fsKIN,0);
    pt2 = NO_FLOAT_CRUTCHES.T_01.Raw.Kin.LANK(timepoint2,:);
    stridelength = norm(pt2-pt1);
    LStride_Crutches_left = [LStride_Crutches_left stridelength];
end

for index=1:length(Crutches_02_FS_left)-1
    timepoint1 = round(Crutches_02_FS_left(index)*NO_FLOAT_CRUTCHES.T_02.fsKIN,0);
    pt1 = NO_FLOAT_CRUTCHES.T_02.Raw.Kin.LANK(timepoint1,:);
    timepoint2 = round(Crutches_02_FS_left(index+1)*NO_FLOAT_CRUTCHES.T_02.fsKIN,0);
    pt2 = NO_FLOAT_CRUTCHES.T_02.Raw.Kin.LANK(timepoint2,:);
    stridelength = norm(pt2-pt1);
    LStride_Crutches_left = [LStride_Crutches_left stridelength];
end

for index=1:length(Crutches_03_FS_left)-1
    timepoint1 = round(Crutches_03_FS_left(index)*NO_FLOAT_CRUTCHES.T_03.fsKIN,0);
    pt1 = NO_FLOAT_CRUTCHES.T_03.Raw.Kin.LANK(timepoint1,:);
    timepoint2 = round(Crutches_03_FS_left(index+1)*NO_FLOAT_CRUTCHES.T_03.fsKIN,0);
    pt2 = NO_FLOAT_CRUTCHES.T_03.Raw.Kin.LANK(timepoint2,:);
    stridelength = norm(pt2-pt1);
    LStride_Crutches_left = [LStride_Crutches_left stridelength];
end

for index=1:length(Crutches_01_FS_right)-1
    timepoint1 = round(Crutches_01_FS_right(index)*NO_FLOAT_CRUTCHES.T_01.fsKIN,0);
    pt1 = NO_FLOAT_CRUTCHES.T_01.Raw.Kin.RANK(timepoint1,:);
    timepoint2 = round(Crutches_01_FS_right(index+1)*NO_FLOAT_CRUTCHES.T_01.fsKIN,0);
    pt2 = NO_FLOAT_CRUTCHES.T_01.Raw.Kin.RANK(timepoint2,:);
    stridelength = norm(pt2-pt1);
    LStride_Crutches_right = [LStride_Crutches_right stridelength];
end

for index=1:length(Crutches_02_FS_right)-1
    timepoint1 = round(Crutches_02_FS_right(index)*NO_FLOAT_CRUTCHES.T_02.fsKIN,0);
    pt1 = NO_FLOAT_CRUTCHES.T_02.Raw.Kin.RANK(timepoint1,:);
    timepoint2 = round(Crutches_02_FS_right(index+1)*NO_FLOAT_CRUTCHES.T_02.fsKIN,0);
    pt2 = NO_FLOAT_CRUTCHES.T_02.Raw.Kin.RANK(timepoint2,:);
    stridelength = norm(pt2-pt1);
    LStride_Crutches_right = [LStride_Crutches_right stridelength];
end

for index=1:length(Crutches_03_FS_right)-1
    timepoint1 = round(Crutches_03_FS_right(index)*NO_FLOAT_CRUTCHES.T_03.fsKIN,0);
    pt1 = NO_FLOAT_CRUTCHES.T_03.Raw.Kin.RANK(timepoint1,:);
    timepoint2 = round(Crutches_03_FS_right(index+1)*NO_FLOAT_CRUTCHES.T_03.fsKIN,0);
    pt2 = NO_FLOAT_CRUTCHES.T_03.Raw.Kin.RANK(timepoint2,:);
    stridelength = norm(pt2-pt1);
    LStride_Crutches_right = [LStride_Crutches_right stridelength];
end

%% Plotting template

%Usefull parameters in Raw are: LANK; LTOE; LKNE, LHIP (note that LHIP does
%not exist for SCI patients). Same for Right leg 
% TODO add LASI
frequency = 100; %Frequency is 100 Hz
sizeData = size (FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,1));  
samplePoints = linspace (0,sizeData(1)-1,sizeData(1)); %Just need to divide this by registration frequency
samplePoints = samplePoints./frequency;
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

%% Animated plot for right leg
%x_ankle = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RANK(:,1)';
y_ankle = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RANK(:,2)';
z_ankle = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RANK(:,3)';

%x_knee = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RKNE(:,1)';
y_knee = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RKNE(:,2)';
z_knee = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RKNE(:,3)';

%x_toe = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RTOE(:,1)';
y_toe = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RTOE(:,2)';
z_toe = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RTOE(:,3)';

%x_asi = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RASI(:,1)';
y_asi = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RASI(:,2)';
z_asi = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.RASI(:,3)';



curve_ankle = animatedline('Color', 'k');
curve_knee = animatedline('Color', 'r');
curve_toe = animatedline('Color', 'c');
curve_asi = animatedline('Color', 'm');

%view(3)

for i = 1:length(y_ankle)
    %addpoints(curve_ankle,x_ankle(i),y_ankle(i),z_ankle(i));
    %addpoints(curve_knee,x_knee(i),y_knee(i),z_knee(i));
    addpoints(curve_ankle,y_ankle(i),z_ankle(i));
    addpoints(curve_knee,y_knee(i),z_knee(i));
    addpoints(curve_toe,y_toe(i),z_toe(i));
    addpoints(curve_asi,y_asi(i),z_asi(i));
    
    drawnow
end

%% Animated plot for left leg
x_ankle = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,1)';
y_ankle = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,2)';
z_ankle = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,3)';

x_knee = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LKNE(:,1)';
y_knee = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LKNE(:,2)';
z_knee = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LKNE(:,3)';

x_toe = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,1)';
y_toe = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,2)';
z_toe = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,3)';

x_asi = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LASI(:,1)';
y_asi = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LASI(:,2)';
z_asi = FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LASI(:,3)';



curve_ankle = animatedline('Color', 'k');
curve_knee = animatedline('Color', 'r');
curve_toe = animatedline('Color', 'c');
curve_asi = animatedline('Color', 'm');

view(3)

for i = 1:length(y_ankle)
    addpoints(curve_ankle,x_ankle(i),y_ankle(i),z_ankle(i));
    addpoints(curve_knee,x_knee(i),y_knee(i),z_knee(i));
    addpoints(curve_toe,x_toe(i),y_toe(i),z_toe(i));
    addpoints(curve_asi,x_asi(i),y_asi(i),z_asi(i));
    
    %addpoints(curve_ankle,y_ankle(i),z_ankle(i));
    %addpoints(curve_knee,y_knee(i),z_knee(i));
    %addpoints(curve_toe,y_toe(i),z_toe(i));
    %addpoints(curve_asi,y_asi(i),z_asi(i));
    
    drawnow
end

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
title('Accelleration');
%%    
    %======================================================================
    % Load Data for Healthy Patient
    %======================================================================
    