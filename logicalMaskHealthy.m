function [logicalMaskLeftFO, logicalMaskLeftFS, logicalMaskRightFO, logicalMaskRightFS]...
    = logicalMaskHealthy(data, subject, FLOATorNOT)
%UNTITLED Create a Logicla Mask of the FO and FS for both legs
%   data: Comes from HealthySegmentation
%   subject: a string (e.g. 'Subject1') saying which subject is analyzed
%   FLOATorNOT: a string ('FLOAT' - 'NOFLOAT') which says which experiment
%               is studyed

gaitCycles = fieldnames(data.(subject).(FLOATorNOT));
plotData = [];
allFO_left = [];
allFS_left = [];
allFO_right = [];
allFS_right = [];
for i = 1:numel(gaitCycles)
    GC = char(gaitCycles(i));
    plotData = [plotData; data.(subject).(FLOATorNOT).(GC).Kin.LANK];
    allFO_left = [allFO_left, (i-1) + data.(subject).(FLOATorNOT).(GC).FO_left];
    allFS_left = [allFS_left, (i-1) + data.(subject).(FLOATorNOT).(GC).FS_left];
    allFO_right = [allFO_right, (i-1) + data.(subject).(FLOATorNOT).(GC).FO_right];
    allFS_right = [allFS_right, (i-1) + data.(subject).(FLOATorNOT).(GC).FS_right];
end

sizeData = size(plotData(:,1));
frequency = 100;
samplePoints = linspace (0,sizeData(1)-1,sizeData(1));
logicalMaskLeftFO = zeros(1,size(samplePoints,2));
logicalMaskLeftFS = zeros(1,size(samplePoints,2));
logicalMaskRightFO = zeros(1,size(samplePoints,2));
logicalMaskRightFS = zeros(1,size(samplePoints,2));
tempLogicalLeftFO = [];
tempLogicalLeftFS = [];
tempLogicalRightFO = [];
tempLogicalRightFS = [];

for i = 1:size(allFO_left,2)
    currentValue = round(allFO_left(1,i),2)*frequency;
    tempLogicalLeftFO = (samplePoints == currentValue);
    logicalMaskLeftFO = logicalMaskLeftFO + tempLogicalLeftFO;
end

for i = 1:size(allFO_left,2)
    currentValue = round(allFS_left(1,i),2)*frequency;
    tempLogicalLeftFS = (samplePoints == currentValue);
    logicalMaskLeftFS = logicalMaskLeftFS + tempLogicalLeftFS;
end

for i = 1:size(allFO_right,2)
    currentValue = round(allFO_right(1,i),2)*frequency;
    tempLogicalRightFO = (samplePoints == currentValue);
    logicalMaskRightFO = logicalMaskRightFO + tempLogicalRightFO;
end

for i = 1:size(allFS_right,2)
    currentValue = round(allFS_right(1,i),2)*frequency;
    tempLogicalRightFS = (samplePoints == currentValue);
    logicalMaskRightFS = logicalMaskRightFS + tempLogicalRightFS;
end

logicalMaskLeftFO(logicalMaskLeftFO==0) = nan;
logicalMaskLeftFS(logicalMaskLeftFS==0) = nan;
logicalMaskRightFO(logicalMaskRightFO==0) = nan;
logicalMaskRightFS(logicalMaskRightFS==0) = nan;

end