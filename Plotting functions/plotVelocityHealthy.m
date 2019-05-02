function [] = plotVelocityHealty(data, time, subject, sensorType, FLOATorNOT, left, rangeStart, rangeEnd)
% Plot the velocity of the sensor. 
%   Takes the segmented input data and connects them in a whole plot in
%   order to have a continuos visualization of the velocity of the sensor
%   in time.
%   data: segmented structure derived from: HealthySubjectSegmentation.
%       Choose between: HealthySubjectsGaitCyclesLeft, 
%       HealthySubjectsGaitCyclesRight
%   time: boolean, if time plot in seconds, else in frequency.
%   subject: string, which healthy subject we are studying. choose between
%       'Subject1' till 'Subject9'
%   sensorType: string, which sensor we want to plot
%   FLOATorNOT: string, is it 'FLOAT' or 'NOFLOAT' depending on what we want to
%   plot.
%   left: boolean if we are using a sensor from left leg = 1 else 0.
%   rangeStart, rangeEnd: set the X-axis limits.

%Frequency of recording
frequency = 100;

%Store all the names of the gait cycles
gaitCycles = fieldnames(data.(subject).(FLOATorNOT));
positionData = [];

%Append each gait cycle as a continous recording
for i = 1:numel(gaitCycles)
    GC = char(gaitCycles(i));
    positionData = [positionData; data.(subject).(FLOATorNOT).(GC).Kin.(sensorType)];
end

%Computes the velocity by differentiating the position
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
    = logicalMaskHealthy(data, subject, FLOATorNOT);

%Since the coputation of the velocity with diff() returns a smaller vector
%we have to adapt the logical mask.
logicalMaskLeftFO(:,1)=[];
logicalMaskLeftFS(:,1)=[];
logicalMaskRightFO(:,1)=[];
logicalMaskRightFS(:,1)=[];

if (left)
    figure()
    plot(samplePoints, velocity_X',  '-r',...
        samplePoints,velocity_Z', '.-c',...
        samplePoints, velocity_Z'.*logicalMaskLeftFO, 'pr',...
        samplePoints, velocity_Z'.*logicalMaskLeftFS, 'pb',...
        samplePoints, velocity_X'.*logicalMaskLeftFO, 'pr',...
        samplePoints, velocity_X'.*logicalMaskLeftFS, 'pb');  
    legend('x-velocity', 'z-velocity');
    xlim([rangeStart rangeEnd]);
    xlabel('Time [s]');
    ylabel('Velocity [m/s]');
    title('Velocity');
    
    figure()
    plot(samplePoints, velocity_Y',  '-r',...
        samplePoints, velocity_Y'.*logicalMaskLeftFO, 'pr',...
        samplePoints, velocity_Y'.*logicalMaskLeftFS, 'pb'); 
    legend('y-velocity');
    xlim([rangeStart rangeEnd]);
    xlabel('Time [s]');
    ylabel('Velocity [m/s]');
    title('Velocity');
else
    figure()
    plot(samplePoints, velocity_X',  '-r',...
        samplePoints,velocity_Z', '.-c',...
        samplePoints, velocity_Z'.*logicalMaskRightFO, 'pr',...
        samplePoints, velocity_Z'.*logicalMaskRightFS, 'pb',...
        samplePoints, velocity_X'.*logicalMaskRightFO, 'pr',...
        samplePoints, velocity_X'.*logicalMaskRightFS, 'pb');  
    legend('x-velocity', 'z-velocity');
    xlim([rangeStart rangeEnd]);
    xlabel('Time [s]');
    ylabel('Velocity [m/s]');
    title('Velocity');
    
    figure()
    plot(samplePoints, velocity_Y',  '-r',...
        samplePoints, velocity_Y'.*logicalMaskRightFO, 'pr',...
        samplePoints, velocity_Y'.*logicalMaskRightFS, 'pb'); 
    legend('y-velocity');
    xlim([rangeStart rangeEnd]);
    xlabel('Time [s]');
    ylabel('Velocity [m/s]');
    title('Velocity');
end
end

