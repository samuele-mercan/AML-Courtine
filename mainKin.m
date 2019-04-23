close all; clear all; 

%% GAIT CYCLES SEGMENTATION

% LEFT FOOT
leftFoot = true;
HealthySubjectsGaitCyclesLeft = struct();

% Healthy subject
[HealthySubjectsGaitCyclesLeft.Subject1.FLOAT, HealthySubjectsGaitCyclesLeft.Subject1.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject1_2018/FLOAT/S1_FLOAT.mat', ...
    'Healthy Recordings/Subject1_2018/NO_FLOAT/S1_NO_FLOAT.mat',...
    'HealthyGaitEvents/2018_S1_FLOAT.mat', 'HealthyGaitEvents/2018_S1_NO_FLOAT.mat',leftFoot);

[HealthySubjectsGaitCyclesLeft.Subject2.FLOAT, HealthySubjectsGaitCyclesLeft.Subject2.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject2_2018/FLOAT/S2_FLOAT.mat', ...
    'Healthy Recordings/Subject2_2018/NO_FLOAT/S2_NO_FLOAT.mat', ...
    'HealthyGaitEvents/2018_S2_FLOAT.mat', 'HealthyGaitEvents/2018_S2_NO_FLOAT.mat',leftFoot);

[HealthySubjectsGaitCyclesLeft.Subject3.FLOAT,HealthySubjectsGaitCyclesLeft.Subject3.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject3_2018/FLOAT/S3_FLOAT.mat', ...
    'Healthy Recordings/Subject3_2018/NO_FLOAT/S3_NO_FLOAT.mat', ...
    'HealthyGaitEvents/2018_S3_FLOAT.mat', 'HealthyGaitEvents/2018_S3_NO_FLOAT.mat', leftFoot);

[HealthySubjectsGaitCyclesLeft.Subject4.FLOAT,HealthySubjectsGaitCyclesLeft.Subject4.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject4_2018/FLOAT/S4_FLOAT.mat', ...
    'Healthy Recordings/Subject4_2018/NO_FLOAT/S4_NO_FLOAT.mat', ...
    'HealthyGaitEvents/2018_S4_FLOAT.mat', 'HealthyGaitEvents/2018_S4_NO_FLOAT.mat',leftFoot);

[HealthySubjectsGaitCyclesLeft.Subject5.FLOAT,HealthySubjectsGaitCyclesLeft.Subject5.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject5_2018/FLOAT/S5_FLOAT.mat', ...
    'Healthy Recordings/Subject5_2018/NO_FLOAT/S5_NO_FLOAT.mat',...
    'HealthyGaitEvents/2018_S5_FLOAT.mat', 'HealthyGaitEvents/2018_S5_NO_FLOAT.mat',leftFoot);

[HealthySubjectsGaitCyclesLeft.Subject6.FLOAT,HealthySubjectsGaitCyclesLeft.Subject6.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject6_2018/FLOAT/S6_FLOAT.mat', ...
    'Healthy Recordings/Subject6_2018/NO_FLOAT/S6_NO_FLOAT.mat',...
    'HealthyGaitEvents/2018_S6_FLOAT.mat', 'HealthyGaitEvents/2018_S6_NO_FLOAT.mat',leftFoot);

[HealthySubjectsGaitCyclesLeft.Subject7.FLOAT,HealthySubjectsGaitCyclesLeft.Subject7.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject1_2019/FLOAT/S1_FLOAT.mat', ...
    'Healthy Recordings/Subject1_2019/NO_FLOAT/S1_NO_FLOAT.mat',...
    'HealthyGaitEvents/2019_S1_FLOAT.mat', 'HealthyGaitEvents/2019_S1_NO_FLOAT.mat',leftFoot);

[HealthySubjectsGaitCyclesLeft.Subject8.FLOAT,HealthySubjectsGaitCyclesLeft.Subject8.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject2_2019/FLOAT/S2_FLOAT.mat', ...
    'Healthy Recordings/Subject2_2019/NO_FLOAT/S2_NO_FLOAT.mat',...
    'HealthyGaitEvents/2019_S2_FLOAT.mat', 'HealthyGaitEvents/2019_S2_NO_FLOAT.mat',leftFoot);

[HealthySubjectsGaitCyclesLeft.Subject9.FLOAT,HealthySubjectsGaitCyclesLeft.Subject9.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject3_2019/FLOAT/S3_FLOAT.mat', ...
     'Healthy Recordings/Subject3_2019/NO_FLOAT/S3_NO_FLOAT.mat',...
     'HealthyGaitEvents/2019_S3_FLOAT.mat', 'HealthyGaitEvents/2019_S3_NO_FLOAT.mat',leftFoot);
 
% SCI subject
[SCI_GaitCycles_Float_Left, SCI_GaitCycles_NoFloat_Left] = SCIsegmentation(leftFoot);

 
% RIGHT FOOT
leftFoot = false;
HealthySubjectsGaitCyclesRight = struct();

% healthy subject

[HealthySubjectsGaitCyclesRight.Subject1.FLOAT, HealthySubjectsGaitCyclesRight.Subject1.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject1_2018/FLOAT/S1_FLOAT.mat', ...
    'Healthy Recordings/Subject1_2018/NO_FLOAT/S1_NO_FLOAT.mat',...
    'HealthyGaitEvents/2018_S1_FLOAT.mat', 'HealthyGaitEvents/2018_S1_NO_FLOAT.mat',leftFoot);
 
[HealthySubjectsGaitCyclesRight.Subject2.FLOAT, HealthySubjectsGaitCyclesRight.Subject2.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject2_2018/FLOAT/S2_FLOAT.mat', ...
    'Healthy Recordings/Subject2_2018/NO_FLOAT/S2_NO_FLOAT.mat', ...
    'HealthyGaitEvents/2018_S2_FLOAT.mat', 'HealthyGaitEvents/2018_S2_NO_FLOAT.mat',leftFoot);

[HealthySubjectsGaitCyclesRight.Subject3.FLOAT,HealthySubjectsGaitCyclesRight.Subject3.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject3_2018/FLOAT/S3_FLOAT.mat', ...
    'Healthy Recordings/Subject3_2018/NO_FLOAT/S3_NO_FLOAT.mat', ...
    'HealthyGaitEvents/2018_S3_FLOAT.mat', 'HealthyGaitEvents/2018_S3_NO_FLOAT.mat', leftFoot);

[HealthySubjectsGaitCyclesRight.Subject4.FLOAT,HealthySubjectsGaitCyclesRight.Subject4.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject4_2018/FLOAT/S4_FLOAT.mat', ...
    'Healthy Recordings/Subject4_2018/NO_FLOAT/S4_NO_FLOAT.mat', ...
    'HealthyGaitEvents/2018_S4_FLOAT.mat', 'HealthyGaitEvents/2018_S4_NO_FLOAT.mat',leftFoot);

[HealthySubjectsGaitCyclesRight.Subject5.FLOAT,HealthySubjectsGaitCyclesRight.Subject5.NOFLOAT] = ...
    HealthySubjectSegmentation('Healthy Recordings/Subject5_2018/FLOAT/S5_FLOAT.mat', ...
    'Healthy Recordings/Subject5_2018/NO_FLOAT/S5_NO_FLOAT.mat',...
    'HealthyGaitEvents/2018_S5_FLOAT.mat', 'HealthyGaitEvents/2018_S5_NO_FLOAT.mat',leftFoot);

[HealthySubjectsGaitCyclesRight.Subject6.FLOAT,HealthySubjectsGaitCyclesRight.Subject6.NOFLOAT] = HealthySubjectSegmentation('Healthy Recordings/Subject6_2018/FLOAT/S6_FLOAT.mat', ...
    'Healthy Recordings/Subject6_2018/NO_FLOAT/S6_NO_FLOAT.mat',...
    'HealthyGaitEvents/2018_S6_FLOAT.mat', 'HealthyGaitEvents/2018_S6_NO_FLOAT.mat',leftFoot);

[HealthySubjectsGaitCyclesRight.Subject7.FLOAT,HealthySubjectsGaitCyclesRight.Subject7.NOFLOAT] = HealthySubjectSegmentation('Healthy Recordings/Subject1_2019/FLOAT/S1_FLOAT.mat', ...
    'Healthy Recordings/Subject1_2019/NO_FLOAT/S1_NO_FLOAT.mat',...
    'HealthyGaitEvents/2019_S1_FLOAT.mat', 'HealthyGaitEvents/2019_S1_NO_FLOAT.mat',leftFoot);

[HealthySubjectsGaitCyclesRight.Subject8.FLOAT,HealthySubjectsGaitCyclesRight.Subject8.NOFLOAT] = HealthySubjectSegmentation('Healthy Recordings/Subject2_2019/FLOAT/S2_FLOAT.mat', ...
    'Healthy Recordings/Subject2_2019/NO_FLOAT/S2_NO_FLOAT.mat',...
    'HealthyGaitEvents/2019_S2_FLOAT.mat', 'HealthyGaitEvents/2019_S2_NO_FLOAT.mat',leftFoot);

[HealthySubjectsGaitCyclesRight.Subject9.FLOAT,HealthySubjectsGaitCyclesRight.Subject9.NOFLOAT] = HealthySubjectSegmentation('Healthy Recordings/Subject3_2019/FLOAT/S3_FLOAT.mat', ...
     'Healthy Recordings/Subject3_2019/NO_FLOAT/S3_NO_FLOAT.mat',...
     'HealthyGaitEvents/2019_S3_FLOAT.mat', 'HealthyGaitEvents/2019_S3_NO_FLOAT.mat',leftFoot);
 
% SCI subject

[SCI_GaitCycles_Float_Right, SCI_GaitCycles_NoFloat_Right] = SCIsegmentation(leftFoot);


%%
variableNames = {'max_angle_HIP_right', 'max_angle_KNE_right', 'max_angle_ANK_right',...
        'max_vAng_ANK_right', ...
        'max_angle_HIP_left', 'max_angle_KNE_left', 'max_angle_ANK_left', ...
        'max_vAng_ANK_left', ...
        'max_elevationangle_THIGH_right', 'max_elevationangle_SHANK_right', 'max_elevationangle_FOOT_right', ...
        'max_elevationangle_THIGH_left', 'max_elevationangle_SHANK_left', 'max_elevationangle_FOOT_left', ...
        'strideLength_right', 'strideLength_left', ...
        'peakSwingVelocity_right', 'peakSwingAcceleration_right',...
        'peakSwingVelocity_left', 'peakSwingAcceleration_left', ...
        'right_step_width','left_step_width', ...
        'max_clearance_toe_right', 'max_clearance_toe_left', 'max_clearance_heel_right', 'max_clearance_heel_left', ...
        'step_length_right', 'step_length_left', ...
        'swing_SI', 'swing_SR', 'stance_SI', 'stance_SR', ...
        'step_period_SI', 'step_period_SR', ...
        'step_length_SI', 'step_length_SR', ...
        'max_clearance_toe_SI', 'max_clearance_toe_SR', 'max_clearance_heel_SI', 'max_clearance_heel_SR', ...
        'step_width_SI', 'step_width_SR', ...        
        'step_period_left', 'step_period_right', ...
        'initial_double_support', 'terminal_double_support', ...
        'stance_left', 'stance_right', ...
        'swing_left', 'swing_right', ...
        'cadence'};
%  AllSubjectsGaitCycles - Subject1 - FLOAT / NO FLOAT - GC1

SCI = false;

% Left healthy
Param_Healthy_Float_Left = [];
Param_Healthy_NoFloat_Left = [];
rightLeg = false;

for i=1:length(fieldnames(HealthySubjectsGaitCyclesLeft)) % for each subject
    % FLOAT
    if i ~ 2 % do not consider the float from subject 2 from 2018   
        for j=1:length(fieldnames(HealthySubjectsGaitCyclesLeft.(strcat('Subject',num2str(i))).FLOAT)) % for each GC

           GaitCycle = HealthySubjectsGaitCyclesLeft.(strcat('Subject',num2str(i))).FLOAT.(strcat('GC',num2str(j)));
           if GaitEventsDetectionCheck(GaitCycle) % check for correct gait events detection
               Param_Healthy_Float_Left = [Param_Healthy_Float_Left; initialize_matrix(GaitCycle, SCI, rightLeg)];
           else
               Param_Healthy_Float_Left = [Param_Healthy_Float_Left; NaN(1,51)];
           end
        end
    end

   % NO FLOAT
   if i ~ 1 % do not consider the no float from subject 1 from 2018    
       for j=1:length(fieldnames(HealthySubjectsGaitCyclesLeft.(strcat('Subject',num2str(i))).NOFLOAT))

           GaitCycle = HealthySubjectsGaitCyclesLeft.(strcat('Subject',num2str(i))).NOFLOAT.(strcat('GC',num2str(j)));
           if GaitEventsDetectionCheck(GaitCycle)
                Param_Healthy_NoFloat_Left = [Param_Healthy_NoFloat_Left;initialize_matrix(GaitCycle, SCI, rightLeg)];
           else
               Param_Healthy_NoFloat_Left = [Param_Healthy_NoFloat_Left; NaN(1,51)];
           end
       end
   end
end

Param_Healthy_Float_Left = array2table(Param_Healthy_Float_Left, 'VariableNames', variableNames);
Param_Healthy_NoFloat_Left = array2table(Param_Healthy_NoFloat_Left, 'VariableNames', variableNames);

% Right healthy
Param_Healthy_Float_Right = [];
Param_Healthy_NoFloat_Right = [];
rightLeg = true;

for i=1:length(fieldnames(HealthySubjectsGaitCyclesRight)) % for each subject
    % FLOAT
    if i ~ 2 % do not consider the float from subject 2 from 2018
        for j=1:length(fieldnames(HealthySubjectsGaitCyclesRight.(strcat('Subject',num2str(i))).FLOAT)) % for each GC

           GaitCycle = HealthySubjectsGaitCyclesRight.(strcat('Subject',num2str(i))).FLOAT.(strcat('GC',num2str(j)));
           if GaitEventsDetectionCheck(GaitCycle)
                Param_Healthy_Float_Right = [Param_Healthy_Float_Right; initialize_matrix(GaitCycle, SCI, rightLeg)];
           else
               Param_Healthy_Float_Right = [Param_Healthy_Float_Right; NaN(1,51)];
           end
        end
    end
    
   % NO FLOAT
   if i ~ 1 % do not consider the no float from subject 1 from 2018   
       for j=1:length(fieldnames(HealthySubjectsGaitCyclesRight.(strcat('Subject',num2str(i))).NOFLOAT))

           GaitCycle = HealthySubjectsGaitCyclesRight.(strcat('Subject',num2str(i))).NOFLOAT.(strcat('GC',num2str(j)));
           if GaitEventsDetectionCheck(GaitCycle)
                Param_Healthy_NoFloat_Right = [Param_Healthy_NoFloat_Right; initialize_matrix(GaitCycle, SCI, rightLeg)];
           else
               Param_Healthy_NoFloat_Right = [Param_Healthy_NoFloat_Right; NaN(1,51)];
           end
       end
   end
end

Param_Healthy_Float_Right = array2table(Param_Healthy_Float_Right, 'VariableNames', variableNames);
Param_Healthy_NoFloat_Right = array2table(Param_Healthy_NoFloat_Right, 'VariableNames', variableNames);


SCI = true;

% SCI Left 
Param_SCI_Float_Left = [];
Param_SCI_NoFloat_Left = [];
rightLeg = false;

for i=1:length(fieldnames(SCI_GaitCycles_Float_Left))
    
    GaitCycle = SCI_GaitCycles_Float_Left.(strcat('GC',num2str(i)));
    Param_SCI_Float_Left = [Param_SCI_Float_Left; initialize_matrix(GaitCycle, SCI, rightLeg)];
    
end

for i=1:length(fieldnames(SCI_GaitCycles_NoFloat_Left))
    
    GaitCycle = SCI_GaitCycles_NoFloat_Left.(strcat('GC',num2str(i)));
    Param_SCI_NoFloat_Left = [Param_SCI_NoFloat_Left; initialize_matrix(GaitCycle, SCI, rightLeg)];
    
end

Param_SCI_Float_Left = array2table(Param_SCI_Float_Left, 'VariableNames', variableNames);
Param_SCI_NoFloat_Left = array2table(Param_SCI_NoFloat_Left, 'VariableNames', variableNames);

% SCI right
Param_SCI_Float_Right = [];
Param_SCI_NoFloat_Right = [];
rightLeg = true;

for i=1:length(fieldnames(SCI_GaitCycles_Float_Right))
    
    GaitCycle = SCI_GaitCycles_Float_Right.(strcat('GC',num2str(i)));
    Param_SCI_Float_Right = [Param_SCI_Float_Right; initialize_matrix(GaitCycle, SCI, rightLeg)];
    
end

for i=1:length(fieldnames(SCI_GaitCycles_NoFloat_Right))
    
    GaitCycle = SCI_GaitCycles_NoFloat_Right.(strcat('GC',num2str(i)));
    Param_SCI_NoFloat_Right = [Param_SCI_NoFloat_Right;initialize_matrix(GaitCycle, SCI, rightLeg)];
    
end

Param_SCI_Float_Right = array2table(Param_SCI_Float_Right, 'VariableNames', variableNames);
Param_SCI_NoFloat_Right = array2table(Param_SCI_NoFloat_Right, 'VariableNames', variableNames);


save('parametersKin.mat', 'Param_Healthy_Float_Left', 'Param_Healthy_Float_Right',...
    'Param_Healthy_NoFloat_Left', 'Param_Healthy_NoFloat_Right',...
    'Param_SCI_Float_Left', 'Param_SCI_Float_Right',...
    'Param_SCI_NoFloat_Left', 'Param_SCI_NoFloat_Right');


%% Check detection
% Check that the gait events detection retained a single FO_left,FS_left,
% FO_right,FO_left for each gait cycle

function [correct] = GaitEventsDetectionCheck(GaitCycle)

    if length(GaitCycle.FS_left)==1 && length(GaitCycle.FO_left)==1 ...
            && length(GaitCycle.FS_right)==1 && length(GaitCycle.FO_right)==1
        
        correct = true;        
    else
        correct = false;
    end

end

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
    
    
    %collect all calculated parameters into one vector
    parameters = [...
        max_angle_HIP_right, max_angle_KNE_right, max_angle_ANK_right,...
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
            swing_left = nan;
        end
        
        if ~  isempty(GaitCycle.FO_right)
            swing_right = FS_right - GaitCycle.FO_right;
        else
            swing_right = nan;
        end
        
    else  % reference is the left foot
        FS_left = reference_foot_strike;
        
        if ~  isempty(GaitCycle.FS_right) && ~  isempty(GaitCycle.FO_right)
            swing_right = GaitCycle.FS_right - GaitCycle.FO_right;
        else
            swing_right = nan;
        end
        
        if ~  isempty(GaitCycle.FO_left)
            swing_left = FS_left - GaitCycle.FO_left;
        else
            swing_left = nan;
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
            stance_right = nan;
        end
        
        if ~  isempty(GaitCycle.FO_left) && ~  isempty(GaitCycle.FS_left)
            stance_left = GaitCycle.FO_left + (reference_foot_strike - GaitCycle.FS_left);
        else
            stance_left = nan;
        end
        
        
    else % the reference foot is the left foot
        
        if ~  isempty(GaitCycle.FO_left)
            stance_left = GaitCycle.FO_left;
        else
            stance_left = nan;
        end
        
        if ~  isempty(GaitCycle.FO_right) && ~  isempty(GaitCycle.FS_right)
            stance_right = GaitCycle.FO_right + (reference_foot_strike - GaitCycle.FS_right);
        else
            stance_right = nan;
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
            initial_double_support = nan;
        end
        
        if ~  isempty(GaitCycle.FS_left) && ~  isempty(GaitCycle.FO_right)
            terminal_double_support = GaitCycle.FO_right - GaitCycle.FS_left;
        else
            terminal_double_support = nan;
        end
        
    else % left foot is the reference
        
        if ~  isempty(GaitCycle.FO_right)
            initial_double_support = GaitCycle.FO_right;
        else
            initial_double_support = nan;
        end
        
        if ~  isempty(GaitCycle.FS_right) && ~  isempty(GaitCycle.FO_left)
            terminal_double_support = GaitCycle.FO_left - GaitCycle.FS_right;
        else
           terminal_double_support = nan; 
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
            step_period_left = nan;
            step_period_right = nan;
        end
        
    else
        
        if ~  isempty(GaitCycle.FS_right)
            step_period_right = GaitCycle.FS_right;
            step_period_left = reference_foot_strike - GaitCycle.FS_right;
        else
            step_period_right = nan;
            step_period_left = nan;
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
            step_length_right = nan;
            step_length_left = nan;
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
            step_length_right = nan;
            step_length_left = nan;
        end
       
    end

end

%% Heel and toe max clearance

function [max_clearance_toe_right, max_clearance_toe_left, max_clearance_heel_right, ...
    max_clearance_heel_left] = calculate_max_clearance(GaitCycle)
    
    max_clearance_heel_left = max(GaitCycle.Kin.LANK(:,3));
    max_clearance_toe_left = max(GaitCycle.Kin.LTOE(:,3));
    max_clearance_heel_right = max(GaitCycle.Kin.RANK(:,3));
    max_clearance_toe_right = max(GaitCycle.Kin.RTOE(:,3));

    
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
            right_step_width = nan;
            left_step_width = nan;
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
            right_step_width = nan;
            left_step_width = nan;
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
        symmetry_index = nan;
        symmetry_ratio = nan;
    end

end

% here measures symmetry index for swing, stance, step period, step
% lenght, max toe clearance, max heel clearance, step width

function [swing_SI, swing_SR, stance_SI, stance_SR, step_period_SI, step_period_SR, ...
    step_length_SI, step_length_SR, ...
    max_clearance_toe_SI,max_clearance_toe_SR, max_clearance_heel_SI,max_clearance_heel_SR, ...
    step_width_SI,step_width_SR] = ...
    calculate_gait_cycle_symmetry(GaitCycle, rightLeg)

    % SWING
    [swing_left,swing_right] = calculate_swing(GaitCycle, rightLeg);
    [swing_SI,swing_SR] = calculate_symmetry_param(swing_right,swing_left);
    % STANCE
    [stance_left, stance_right] = calculate_stance(GaitCycle, rightLeg);
    [stance_SI,stance_SR] = calculate_symmetry_param(stance_right,stance_left);
    % STEP PERIOD
    [step_period_left,step_period_right] = calculate_step_period(GaitCycle,rightLeg);
    [step_period_SI,step_period_SR] = calculate_symmetry_param(step_period_right,step_period_left);
    % STEP LENGTH
    [step_length_right,step_length_left] = step_length(GaitCycle,rightLeg);
    [step_length_SI,step_length_SR] = calculate_symmetry_param(step_length_right,step_length_left);
    % MAX CLEARANCE : TOE AND HEEL
    [max_clearance_toe_right, max_clearance_toe_left, max_clearance_heel_right, ...
        max_clearance_heel_left] = calculate_max_clearance(GaitCycle);
    [max_clearance_toe_SI,max_clearance_toe_SR] = calculate_symmetry_param(...
        max_clearance_toe_right,max_clearance_toe_left);
    [max_clearance_heel_SI,max_clearance_heel_SR] = calculate_symmetry_param(...
        max_clearance_heel_right,max_clearance_heel_left);
    % STEP WIDTH
    [right_step_width,left_step_width] = calculate_step_width(GaitCycle, ...
        rightLeg);
    [step_width_SI,step_width_SR] = calculate_symmetry_param(right_step_width, ...
        left_step_width);
    
end
