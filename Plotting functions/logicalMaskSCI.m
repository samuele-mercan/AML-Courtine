function [logicalMaskLeftFO, logicalMaskLeftFS, logicalMaskRightFO, logicalMaskRightFS]...
    = logicalMaskSCI(data)
%Create a Logicla Mask of the FO and FS for both legs
%   data: segmented structure derived from: HealthySubjectSegmentation.
%       Choose between SCI_GaitCycles_Float_Left;
%       SCI_GaitCycles_Float_Right; SCI_GaitCycles_NoFloat_Left; 
%       SCI_GaitCycles_NoFloat_Left.

%Store all the names of the gait cycles
gaitCycles = fieldnames(data);
plotData = [];
allFO_left = [];
allFS_left = [];
allFO_right = [];
allFS_right = [];

%Stores values for all the FS and FO in separate vectors from the separate 
%gait cycles
for i = 1:numel(gaitCycles)
    GC = char(gaitCycles(i));
    plotData = [plotData; data.(GC).Kin.LANK];
    point = size(plotData);
    allFO_left = [allFO_left, (point(1)-1) + (data.(GC).FO_left)*100];
    allFS_left = [allFS_left, (point(1)-1) + (data.(GC).FS_left)*100];
    allFO_right = [allFO_right, (point(1)-1) + (data.(GC).FO_right)*100];
    allFS_right = [allFS_right, (point(1)-1) + (data.(GC).FS_right)*100];
end

%Initialize vectors
sizeData = size(plotData(:,1));
samplePoints = linspace (0,sizeData(1)-1,sizeData(1));
logicalMaskLeftFO = zeros(1,size(samplePoints,2));
logicalMaskLeftFS = zeros(1,size(samplePoints,2));
logicalMaskRightFO = zeros(1,size(samplePoints,2));
logicalMaskRightFS = zeros(1,size(samplePoints,2));
tempLogicalLeftFO = [];
tempLogicalLeftFS = [];
tempLogicalRightFO = [];
tempLogicalRightFS = [];

%Set respecting index value to 1 if at the same index we have a FS or a FO
%Else the value remain a 0
for i = 1:size(allFO_left,2)
    currentValue = round(allFO_left(1,i),0);
    tempLogicalLeftFO = (samplePoints == currentValue);
    logicalMaskLeftFO = logicalMaskLeftFO + tempLogicalLeftFO;
end

for i = 1:size(allFO_left,2)
    currentValue = round(allFS_left(1,i),0);
    tempLogicalLeftFS = (samplePoints == currentValue);
    logicalMaskLeftFS = logicalMaskLeftFS + tempLogicalLeftFS;
end

for i = 1:size(allFO_right,2)
    currentValue = round(allFO_right(1,i),0);
    tempLogicalRightFO = (samplePoints == currentValue);
    logicalMaskRightFO = logicalMaskRightFO + tempLogicalRightFO;
end

for i = 1:size(allFS_right,2)
    currentValue = round(allFS_right(1,i),0);
    tempLogicalRightFS = (samplePoints == currentValue);
    logicalMaskRightFS = logicalMaskRightFS + tempLogicalRightFS;
end

%Set all the 0 values to Nan
logicalMaskLeftFO(logicalMaskLeftFO==0) = nan;
logicalMaskLeftFS(logicalMaskLeftFS==0) = nan;
logicalMaskRightFO(logicalMaskRightFO==0) = nan;
logicalMaskRightFS(logicalMaskRightFS==0) = nan;

end
