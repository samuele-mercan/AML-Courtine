function [GaitCyclesFloat,GaitCyclesNoFloat] = HealthySubjectSegmentation(dataFileFloat,dataFileNoFloat,...
    datasetGaitEventsFloat, datasetGaitEventsNoFloat,leftFoot)

    % calls HealthyGaitCyclesSegmentation for both FLOAT and NO FLOAT data
    % of a subject to segment the signals into gait cycles and associate
    % each gait cycle with its related gait events (FS_left,FS_right,FO_left,
    % FO_right)
    % leftFoot indicates which foot to use for the segmentation
    % datasetGaitEventsFloat / datasetGaitEventsNoFloat are the gait events
    % detected manually
    
    [GaitCyclesFloat] = HealthyGaitCyclesSegmentation(dataFileFloat, datasetGaitEventsFloat, ...
        leftFoot);

    [GaitCyclesNoFloat] = HealthyGaitCyclesSegmentation(dataFileNoFloat, datasetGaitEventsNoFloat, ...
        leftFoot);
    
end