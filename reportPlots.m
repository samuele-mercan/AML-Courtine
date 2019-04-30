function reportPlots()
    mkdir('Figures')
    % Boxplots to assess the performance of the algorithm 
    
    [detectionErrorFloat, detectionErrorNoFloat] = calculatePerformance();
    
    %without outliers
    figure()
    hold on
    title('Error in the gait events detection for the FLOAT and NO FLOAT data')
    ylabel('Error in the detection of the gait events')
    group = [ ones(size(detectionErrorFloat')); 2 * ones(size(detectionErrorNoFloat'))];
    bPlot = boxplot([detectionErrorFloat';detectionErrorNoFloat'], group, 'symbol','');
    set(gca, 'XTickLabel', {'Float', 'No Float'})
    ylim([-0.1 1.4]);
    outliers = findobj(bPlot,'Tag','Outliers');
    yy = get(outliers,'YData');
    print('Figures/Performance Box Plot, without outliers', '-dpng')
    
    %with outliers
    figure()
    hold on
    title('Error in the gait events detection for the FLOAT and NO FLOAT data')
    ylabel('Error in the detection of the gait events')
    group = [ ones(size(detectionErrorFloat')); 2 * ones(size(detectionErrorNoFloat'))];
    bPlot = boxplot([detectionErrorFloat';detectionErrorNoFloat'], group);
    set(gca, 'XTickLabel', {'Float', 'No Float'})
    outliers = findobj(bPlot,'Tag','Outliers');
    yy = get(outliers,'YData');
    print('Figures/Performance Box Plot, with outliers', '-dpng')
end
