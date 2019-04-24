function [] = logicalMaskHealthyLeft(data, subject, FLOATorNOT)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
gaitCycles = fieldnames(data.(subject).(FLOATorNOT));
for i = 1:numel(gaitCycles)
    GC = char(gaitCycles(i));
    plotData = [plotData; data.(subject).(FLOATorNOT).(GC).Kin.LANK];
    allFO_left = [allFO_left, data.(subject).(FLOATorNOT).(GC).FO_left];
    allFS_left = [allFS_left, data.(subject).(FLOATorNOT).(GC).FS_left];
end

sizeData = size(plotData(:,1));
samplePoints = linspace (0,sizeData(1)-1,sizeData(1));
logicalMaskFO = zeros(1,size(samplePointsVelocity,2));
tempLogicalFO = [];

for i = 1:size(allFO_left,2)
    currentValue = round(allFO_left(1,i),2);
    tempLogicalFO = (samplePoints == currentValue);
    logicalMask = logicalMask + tempLogical;
end


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