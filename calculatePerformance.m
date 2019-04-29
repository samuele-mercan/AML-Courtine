function calculatePerformance()


    detectionErrorFloat = algorithmPerformance('DetectedHealthyGaitEvents/*FLOAT*', 'HealthyGaitEvents/*FLOAT*');
    detectionErrorNoFloat = algorithmPerformance('DetectedHealthyGaitEvents/*NO_FLOAT*', 'HealthyGaitEvents/*NO_FLOAT*');

    figure()
    hold on
    title('Error in the gait events detection for the FLOAT and NO FLOAT data')
    ylabel('Error in the detection of the gait events')
    group = [ ones(size(detectionErrorFloat')); 2 * ones(size(detectionErrorNoFloat'))];
    bPlot = boxplot([detectionErrorFloat';detectionErrorNoFloat'], group);
    set(gca, 'XTickLabel', {'Float', 'No Float'})
    
    outliers = findobj(bPlot,'Tag','Outliers');
    yy = get(outliers,'YData');
    

end