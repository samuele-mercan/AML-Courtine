function [] = PlotSensorHealthy(data,y, time, subject, sensorType, left, FLOATorNOT, rangeStart, rangeEnd)
% Plot the movement of the sensor. On the same plot we see all the axis
% movement.
%   Takes the segmented input data and connects them in a whole plot in
%   order to have a continuos visualization of the movement of the sensor
%   in time.
%   data: segmented structure derived from: HealthySubjectSegmentation.
%       Choose between: HealthySubjectsGaitCyclesLeft, 
%       HealthySubjectsGaitCyclesRight
%   y: boolean, if 1 plot the y component, else plots only x and z component on
%       the same plot
%   time: boolean, if time plot in seconds, else in frequency.
%   subject: string, which healthy subject we are studying. choose between
%       'Subject1' till 'Subject9'
%   sensorType: string, which sensor we want to plot
%   left: boolean if we are using a sensor from left leg = 1 else 0.
%   FLOATorNOT: string, is it 'FLOAT' or 'NOFLOAT' depending on what we want to
%   plot.
%   rangeStart, rangeEnd: set the X-axis limits.


%The frequency of registration
frequency = 100;

%compute the logical mask for FO and FS.
[logicalMaskLeftFO, logicalMaskLeftFS, logicalMaskRightFO, logicalMaskRightFS]...
    = logicalMaskHealthy(data, subject, FLOATorNOT);

%Store all the names of the gait cycles
gaitCycles = fieldnames(data.(subject).(FLOATorNOT));
plotData = [];

%Append each gait cycle as a continous recording
for i = 1:numel(gaitCycles)
    GC = char(gaitCycles(i));
    plotData = [plotData; data.(subject).(FLOATorNOT).(GC).Kin.(sensorType)];
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
    plot(samplePoints, plotData(:,1)', '-b',...
        samplePoints, plotData(:,3)', '-k',...
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
    
    if(y)
        figure();
        plot(samplePoints, plotData(:,2)', '-r',...
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
    end

else
    figure();
    plot(samplePoints, plotData(:,1)', '-b',...
        samplePoints, plotData(:,3)', '-k',...
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
    
    if(y)
        figure();
        plot(samplePoints, plotData(:,2)', '-r',...
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
end


