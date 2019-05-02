function [] = plotSensorSCI(data, time, sensorType, left, rangeStart, rangeEnd)
% Plot the movement of the sensor. On the same plot we see all the axis
% movement.
%   Takes the segmented input data and connects them in a whole plot in
%   order to have a continuos visualization of the movement of the sensor
%   in time.
%   data: segmented structure derived from: HealthySubjectSegmentation.
%       Choose between SCI_GaitCycles_Float_Left;
%       SCI_GaitCycles_Float_Right; SCI_GaitCycles_NoFloat_Left; 
%       SCI_GaitCycles_NoFloat_Left
%   time: boolean, if time = 1 plot in seconds, else in registration
%       samples
%   sensorType: string, which sensor we want to plot
%   rangeStart, rangeEnd: set the limits for X-axis

%Frequency of recording
frequency = 100;

%compute the logical mask for FO and FS.
[logicalMaskLeftFO, logicalMaskLeftFS, logicalMaskRightFO, logicalMaskRightFS]...
    = logicalMaskSCI(data);

%Store all the names of the gait cycles
gaitCycles = fieldnames(data);
plotData = [];

%Append each gait cycle as a continous recording
for i = 1:numel(gaitCycles)
    GC = char(gaitCycles(i));
    plotData = [plotData; data.(GC).Kin.(sensorType)];
end

sizeData = size(plotData(:,1));
samplePoints = linspace (0,sizeData(1)-1,sizeData(1));

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


if (left)
    figure();
    plot(samplePoints, plotData(:,1)', '-r',...
        samplePoints, plotData(:,3)', '-m',...
        samplePoints, plotData(:,1)'.*logicalMaskLeftFO, 'pr',...
        samplePoints, plotData(:,1)'.*logicalMaskLeftFS, 'pb',...
        samplePoints, plotData(:,3)'.*logicalMaskLeftFO, 'pr',...
        samplePoints, plotData(:,3)'.*logicalMaskLeftFS, 'pb');
    title('Sensor position over time');
    legend('x-axis position', 'z-axis position','Foot Off','Foot Strike');
    xlim([rangeStart rangeEnd]);
    if (time)
        xlabel('Time [s]');
    else
        xlabel('Sampling points');
    end
    ylabel('Position [m]');
    
    figure();
    plot(samplePoints, plotData(:,2)', '-b',...
    samplePoints, plotData(:,2)'.*logicalMaskLeftFO, 'pr',...
    samplePoints, plotData(:,2)'.*logicalMaskLeftFS, 'pb');
    title('Sensor position over time');
    legend('y-axis position','Foot Off','Foot Strike');
    xlim([rangeStart rangeEnd]);
    if (time)
        xlabel('Time [s]');
    else
        xlabel('Sampling points');
    end
    ylabel('Position [m]');

else
    figure();
    plot(samplePoints, plotData(:,1)', '-r',...
        samplePoints, plotData(:,3)', '-m',...
        samplePoints, plotData(:,1)'.*logicalMaskRightFO, 'pr',...
        samplePoints, plotData(:,1)'.*logicalMaskRightFS, 'pb',...
        samplePoints, plotData(:,3)'.*logicalMaskRightFO, 'pr',...
        samplePoints, plotData(:,3)'.*logicalMaskRightFS, 'pb');
    title('Sensor position over time');
    legend('x-axis position', 'z-axis position','Foot Off','Foot Strike');
    xlim([rangeStart rangeEnd]);
    if (time)
        xlabel('Time [s]');
    else
        xlabel('Sampling points');
    end
    ylabel('Position [m]');
    
    figure();
    plot(samplePoints, plotData(:,2)', '-b',...
    samplePoints, plotData(:,2)'.*logicalMaskRightFO, 'pr',...
    samplePoints, plotData(:,2)'.*logicalMaskRightFS, 'pb');
    title('Sensor position over time');
    legend('y-axis position','Foot Off','Foot Strike');
    xlim([rangeStart rangeEnd]);
    if (time)
        xlabel('Time [s]');
    else
        xlabel('Sampling points');
    end
    ylabel('Position [m]');
end
end

