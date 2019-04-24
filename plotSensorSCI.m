function [] = plotSensorSCI(data, time, sensorType)
% Plot the movement of the sensor. On the same plot we see all the axis
% movement.
%   Takes the segmented input data and connects them in a whole plot in
%   order to have a continuos visualization of the movement of the sensor
%   in time.
%   data: segmented structure derived from: SCIsegmentation.
%   time: boolean, if time plot in seconds, else in frequency.
%   sensorType: string, which sensor we want to plot

frequency = 100;

gaitCycles = fieldnames(data);
plotData = [];
for i = 1:numel(gaitCycles)
    GC = char(gaitCycles(i));
    plotData = [plotData; data.(GC).Kin.(sensorType)];
end
sizeData = size(plotData(:,1));
samplePoints = linspace (0,sizeData(1)-1,sizeData(1));
if (time)
    samplePoints = samplePoints./frequency;
end
plot(samplePoints, plotData(:,1),  '-r',...
samplePoints,plotData(:,2), '--b',...
samplePoints,plotData(:,3), '.-c');  
legend('x-coordinate', 'y-coordinate', 'z-coordinate');
end

