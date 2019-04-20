function [GaitCyclesFloat,GaitCyclesNoFloat] = HealthySubjectSegmentation(dataFileFloat,dataFileNoFloat,...
    datasetGaitEventsFloat, datasetGaitEventsNoFloat,leftFoot)

    [GaitCyclesFloat] = HealthyGaitCyclesSegmentation(dataFileFloat, datasetGaitEventsFloat, ...
        leftFoot);

    [GaitCyclesNoFloat] = HealthyGaitCyclesSegmentation(dataFileNoFloat, datasetGaitEventsNoFloat, ...
        leftFoot);
    
end

