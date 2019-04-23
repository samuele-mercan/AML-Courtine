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
%   left: boolean, if left plot lieft leg, else right leg.
%   FLOATorNOT: string, is it FLOAT or NOFLOAT depending on what we want to
%   plot.

frequency = 100;


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
plot(samplePoints, plotData(:,1),  '-r',...
samplePoints,plotData(:,2), '--b',...
samplePoints,plotData(:,3), '.-c');  
legend('x-coordinate', 'y-coordinate', 'z-coordinate');

end

