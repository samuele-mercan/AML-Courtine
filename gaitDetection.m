%% Loading dataset
%Cleaning
close all; clear all;

%Loading healthy recordings
load('./Healthy Recordings/Subject1_2019/FLOAT/S6_FLOAT.mat')
load('./Healthy Recordings/Subject1_2019/NO_FLOAT/S6_NO_FLOAT.mat')

%Loading SCI patient data
load('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/MAT/FLOAT_NO_CRUTCHES.mat');
load('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/MAT/NO_FLOAT_CRUTCHES.mat');

%Loading .csv file we will use for tests of our moethods 
noCrutches_03 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_05_GAIT.csv');
Crutches_03 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_03_GAIT.csv');

%% Segmentation

% noCrutches_03
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

% Crutches_03
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
%% Logical Mask LEFT
samplePointsVelocity = samplePoints;
samplePointsVelocity(:,1)=[];

logicalMask = zeros(1,size(samplePointsVelocity,2));
tempLogical = [];
for i = 1:size(noCrutches_03_FO_left,2)
    currentValue = round(noCrutches_03_FO_left(1,i),2);
    tempLogical = (samplePointsVelocity == currentValue);
    logicalMask = logicalMask + tempLogical;
end
logicalMask(logicalMask==0) = nan;

logicalMaskFS = zeros(1,size(samplePointsVelocity,2));
tempLogical = [];

for i = 1:size(noCrutches_03_FS_left,2)
    currentValue = round(noCrutches_03_FS_left(1,i),2);
    tempLogical = (samplePointsVelocity == currentValue);
    logicalMaskFS = logicalMaskFS + tempLogical;
end
logicalMaskFS(logicalMaskFS==0) = nan;

%% Logical Mask RIGHT
samplePointsVelocity = samplePoints;
samplePointsVelocity(:,1)=[];

logicalMaskFORight = zeros(1,size(samplePointsVelocity,2));
tempLogical = [];
for i = 1:size(noCrutches_03_FO_right,2)
    currentValue = round(noCrutches_03_FO_right(1,i),2);
    tempLogical = (samplePointsVelocity == currentValue);
    logicalMaskFORight = logicalMaskFORight + tempLogical;
end
logicalMaskFORight(logicalMask==0) = nan;

logicalMaskFSRight = zeros(1,size(samplePointsVelocity,2));
tempLogical = [];

for i = 1:size(noCrutches_03_FS_right,2)
    currentValue = round(noCrutches_03_FS_right(1,i),2);
    tempLogical = (samplePointsVelocity == currentValue);
    logicalMaskFSRight = logicalMaskFSRight + tempLogical;
end
logicalMaskFSRight(logicalMaskFS==0) = nan;

%% Derivation of velocities and accelleration
velocity_X = diff(FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,1));
velocity_Y = diff(FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,2));
velocity_Z = diff(FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,3));
samplePointsVelocity = samplePoints;
samplePointsVelocity(:,1)=[];


figure(1);
plot(samplePointsVelocity, velocity_X',  '-r',...
    samplePointsVelocity, velocity_Y', '--b',...
    samplePointsVelocity,velocity_Z', '.-c',...
    samplePointsVelocity, velocity_Z'.*logicalMask, 'pr',...
    samplePointsVelocity, velocity_Z'.*logicalMaskFS, 'pb');  
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

%% Hips 
logicalMaskHips = [logicalMask NaN];
logicalMaskHipsFS = [logicalMaskFS NaN];
logicalMaskHipsFORight = [logicalMaskFORight NaN];
logicalMaskHipsFSRight = [logicalMaskFSRight NaN];


figure(1);
plot(samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LASI(:,1)', '-r',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LASI(:,3)', '-m',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LASI(:,1)'.*logicalMaskHips, 'pr',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LASI(:,3)'.*logicalMaskHips, 'pr',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LASI(:,1)'.*logicalMaskHipsFS, 'pb',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LASI(:,3)'.*logicalMaskHipsFS, 'pb');

figure(2);
plot(samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LASI(:,2)', '-b',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LASI(:,2)'.*logicalMaskHips, 'pr',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LASI(:,2)'.*logicalMaskHipsFS, 'pb')

%% Ankle 

figure(1);
plot(samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,1)', '-r',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,3)', '-m',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,1)'.*logicalMaskHips, 'pr',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,3)'.*logicalMaskHips, 'pr',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,1)'.*logicalMaskHipsFS, 'pb',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,3)'.*logicalMaskHipsFS, 'pb');

figure(2);
plot(samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,2)', '-b',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,2)'.*logicalMaskHips, 'pr',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LANK(:,2)'.*logicalMaskHipsFS, 'pb')

%% Knee

figure(1);
plot(samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LKNE(:,1)', '-r',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LKNE(:,3)', '-m',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LKNE(:,1)'.*logicalMaskHips, 'pr',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LKNE(:,3)'.*logicalMaskHips, 'pr',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LKNE(:,1)'.*logicalMaskHipsFS, 'pb',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LKNE(:,3)'.*logicalMaskHipsFS, 'pb');

figure(2);
plot(samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LKNE(:,2)', '-b',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LKNE(:,2)'.*logicalMaskHips, 'pr',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LKNE(:,2)'.*logicalMaskHipsFS, 'pb')

%% Toe

figure(1);
plot(samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,1)', '-r',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,3)', '-m',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,1)'.*logicalMaskHipsFORight, 'pr',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,3)'.*logicalMaskHipsFORight, 'pr',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,1)'.*logicalMaskHipsFSRight, 'pb',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,3)'.*logicalMaskHipsFSRight, 'pb');

figure(2);
plot(samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,2)', '-b',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,2)'.*logicalMaskHipsFORight, 'pr',...
    samplePoints, FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,2)'.*logicalMaskHipsFSRight, 'pb')

%% 3D test

plot(FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,1), FLOAT_NO_CRUTCHES.T_03.Raw.Kin.LTOE(:,2))