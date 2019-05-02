function [] = plotVelocitySCI(data, time, sensorType, left, rangeStart, rangeEnd)
% Plot the velocity of the sensor. 
%   Takes the segmented input data and connects them in a whole plot in
%   order to have a continuos visualization of the velocity of the sensor
%   in time.
%   data: segmented structure derived from: HealthySubjectSegmentation.
%       Choose between SCI_GaitCycles_Float_Left;
%       SCI_GaitCycles_Float_Right; SCI_GaitCycles_NoFloat_Left; 
%       SCI_GaitCycles_NoFloat_Left.
%   time: boolean, if time plot in seconds, else in registration samples.
%   sensorType: string, which sensor we want to plot
%   FLOATorNOT: string, is it 'FLOAT' or 'NOFLOAT' depending on what we want to
%       plot.
%   left: boolean if we are using a sensor from left leg = 1 else 0.
%   rangeStart, rangeEnd: specify the ranges of the plot.

%Frequency of registration
frequency = 100;

%Store all the names of the gait cycles
gaitCycles = fieldnames(data);
positionData = [];

%Append all the gait cycles together as a continuos registration.
for i = 1:numel(gaitCycles)
    GC = char(gaitCycles(i));
    positionData = [positionData; data.(GC).Kin.(sensorType)];
end

%Compute the velocity by differentiating the position
velocity_X = diff(positionData(:,1));
velocity_Y = diff(positionData(:,2));
velocity_Z = diff(positionData(:,3));


sizeData = size(positionData(:,1));
samplePoints = linspace (0,sizeData(1)-1,sizeData(1));
samplePoints(:,1)=[];

%Check if the range given are appropriate
if (sizeData(1) < rangeEnd)
    rangeEnd = sizeData(1);
end
if(rangeStart < 1)
    rangeStart = 1;
end
if(rangeStart >= rangeEnd)
    rangeStart = 1;
end

%Converts in seconds
if (time)
    samplePoints = samplePoints./frequency;
    rangeStart = rangeStart/frequency;
    rangeEnd = rangeEnd/frequency;
end

%compute the logical mask for FO and FS.
[logicalMaskLeftFO, logicalMaskLeftFS, logicalMaskRightFO, logicalMaskRightFS] ...
    = logicalMaskSCI(data);

%Since the coputation of the velocity with diff() returns a smaller vector
%we have to adapt the logical mask.
logicalMaskLeftFO(:,1)=[];
logicalMaskLeftFS(:,1)=[];
logicalMaskRightFO(:,1)=[];
logicalMaskRightFS(:,1)=[];

if (left)
    figure();
    plot(samplePoints, velocity_X',  '-r',...
        samplePoints,velocity_Z', '.-c',...
        samplePoints, velocity_X'.*logicalMaskLeftFO, 'pr',...
        samplePoints, velocity_X'.*logicalMaskLeftFS, 'pb',...
        samplePoints, velocity_Z'.*logicalMaskLeftFO, 'pr',...
        samplePoints, velocity_Z'.*logicalMaskLeftFS, 'pb');  
    legend('x-velocity', 'z-velocity','Foot Off','Foot Strike');
    xlim([rangeStart rangeEnd]);
    title('Velocity');
    xlabel('Time [s]');
    ylabel('Velocity [m/s]');
    
    figure();
    plot(samplePoints, velocity_Y', '--b',...
        samplePoints, velocity_Y'.*logicalMaskLeftFO, 'pr',...
        samplePoints, velocity_Y'.*logicalMaskLeftFS, 'pb');  
    legend('y-velocity','Foot Off','Foot Strike');
    xlim([rangeStart rangeEnd]);
    title('Velocity');
    xlabel('Time [s]');
    ylabel('Velocity [m/s]');
        

else
    figure();
    plot(samplePoints, velocity_X',  '-r',...
        samplePoints,velocity_Z', '.-c',...
        samplePoints, velocity_X'.*logicalMaskRightFO, 'pr',...
        samplePoints, velocity_X'.*logicalMaskRightFS, 'pb',...
        samplePoints, velocity_Z'.*logicalMaskRightFO, 'pr',...
        samplePoints, velocity_Z'.*logicalMaskRightFS, 'pb');  
    legend('x-velocity', 'z-velocity','Foot Off','Foot Strike');
    xlim([rangeStart rangeEnd]);
    title('Velocity');
    xlabel('Time [s]');
    ylabel('Velocity [m/s]');
    
    figure();
    plot(samplePoints, velocity_Y', '--b',...
        samplePoints, velocity_Y'.*logicalMaskRightFO, 'pr',...
        samplePoints, velocity_Y'.*logicalMaskRightFS, 'pb');  
    legend('y-velocity','Foot Off','Foot Strike');
    xlim([rangeStart rangeEnd]);
    title('Velocity');
    xlabel('Time [s]');
    ylabel('Velocity [m/s]');
end
end