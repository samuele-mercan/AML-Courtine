function [] = PlotSensorHealthy(data, time, subject, sensorType, left, FLOATorNOT)
% Plot the movement of the sensor. On the same plot we see all the axis
% movement.
%   Takes the segmented input data and connects them in a whole plot in
%   order to have a continuos visualization of the movement of the sensor
%   in time.
%   data: segmented structure derived from: HealthySubjectSegmentation.
%   time: boolean, if time plot in seconds, else in frequency.
%   subject: string, which healthy subject we are studying.
%   sensorType: string, which sensor we want to plot
%   FLOATorNOT: string, is it FLOAT or NOFLOAT depending on what we want to
%   plot.

frequency = 100;

[logicalMaskLeftFO, logicalMaskLeftFS, logicalMaskRightFO, logicalMaskRightFS]...
    = logicalMaskHealthy(data, subject, FLOATorNOT);

gaitCycles = fieldnames(data.(subject).(FLOATorNOT));
plotData = [];
for i = 1:numel(gaitCycles)
    GC = char(gaitCycles(i));
    plotData = [plotData; data.(subject).(FLOATorNOT).(GC).Kin.(sensorType)];
end

sizeData = size(plotData(:,1));
samplePoints = linspace (0,sizeData(1)-1,sizeData(1));

if (time)
    samplePoints = samplePoints./frequency;
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
    if (time)
        xlabel('Time [s]');
    else
        xlabel('Sampling points');
    end
    ylabel('Position [m]');
end

end

