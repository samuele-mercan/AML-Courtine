function [detectionErrorFloat, detectionErrorNoFloat] = calculatePerformance()

    detectionErrorFloat = algorithmPerformance('DetectedHealthyGaitEvents/*FLOAT*', 'HealthyGaitEvents/*FLOAT*');
    detectionErrorNoFloat = algorithmPerformance('DetectedHealthyGaitEvents/*NO_FLOAT*', 'HealthyGaitEvents/*NO_FLOAT*');

end