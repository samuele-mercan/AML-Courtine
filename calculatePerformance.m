function calculatePerformance()


    detectionDifferencesFloat = algorithmPerformance('DetectedHealthyGaitEvents/*FLOAT*', 'HealthyGaitEvents/*FLOAT*');
    detectionDifferencesNoFloat = algorithmPerformance('DetectedHealthyGaitEvents/*NO_FLOAT*', 'HealthyGaitEvents/*NO_FLOAT*');

    figure()
    hold on
    title('Error in the gait events detection for the FLOAT and NO_FLOAT data')
    ylabel('Difference in the time detected for the gait events')
    group = [ ones(size(detectionDifferencesFloat')); 2 * ones(size(detectionDifferencesNoFloat'))];
    boxplot([detectionDifferencesFloat';detectionDifferencesNoFloat'], group)
    set(gca, 'XTickLabel', {'Float', 'No Float'})

end