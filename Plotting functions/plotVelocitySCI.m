function [] = plotVelocitySCI(data, time, sensorType, left)
% Plot the velocity of the sensor. 
%   Takes the segmented input data and connects them in a whole plot in
%   order to have a continuos visualization of the velocity of the sensor
%   in time.
%   data: segmented structure derived from: HealthySubjectSegmentation.
%   time: boolean, if time plot in seconds, else in frequency.
%   subject: string, which healthy subject we are studying.
%   sensorType: string, which sensor we want to plot
%   FLOATorNOT: string, is it FLOAT or NOFLOAT depending on what we want to
%   plot.
%   left: boolean if we are using a sensor from left leg = 1 else 0.

frequency = 100;

gaitCycles = fieldnames(data);
positionData = [];
for i = 1:numel(gaitCycles)
    GC = char(gaitCycles(i));
    positionData = [positionData; data.(GC).Kin.(sensorType)];
end

velocity_X = diff(positionData(:,1));
velocity_Y = diff(positionData(:,2));
velocity_Z = diff(positionData(:,3));


sizeData = size(positionData(:,1));
samplePoints = linspace (0,sizeData(1)-1,sizeData(1));
samplePoints(:,1)=[];

if (time)
    samplePoints = samplePoints./frequency;
end


[logicalMaskLeftFO, logicalMaskLeftFS, logicalMaskRightFO, logicalMaskRightFS] ...
    = logicalMaskSCI(data);

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
    title('Velocity');
    xlabel('Time [s]');
    ylabel('Velocity [m/s]');
    
    figure();
    plot(samplePoints, velocity_Y', '--b',...
        samplePoints, velocity_Y'.*logicalMaskLeftFO, 'pr',...
        samplePoints, velocity_Y'.*logicalMaskLeftFS, 'pb');  
    legend('y-velocity','Foot Off','Foot Strike');
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
    title('Velocity');
    xlabel('Time [s]');
    ylabel('Velocity [m/s]');
    
    figure();
    plot(samplePoints, velocity_Y', '--b',...
        samplePoints, velocity_Y'.*logicalMaskRightFO, 'pr',...
        samplePoints, velocity_Y'.*logicalMaskRightFS, 'pb');  
    legend('y-velocity','Foot Off','Foot Strike');
    title('Velocity');
    xlabel('Time [s]');
    ylabel('Velocity [m/s]');
end
end