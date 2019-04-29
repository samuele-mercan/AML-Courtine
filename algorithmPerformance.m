function detectionDifferences = algorithmPerformance(detectedGaitsDirectory, healthyGaitsDirectory)
    
    detectedStructs = dir(detectedGaitsDirectory);
    groundTruthStructs = dir(healthyGaitsDirectory);
    
    detectionDifferences = [];
    
    for i=1:length(detectedStructs)
        
        detectedFieldNames = fieldnames(detectedStructs(i));
        detectedGaitEvents = load(['DetectedHealthyGaitEvents/',detectedStructs(i).(detectedFieldNames{1})]);
        detected_T01_FS_left = detectedGaitEvents.gaitEvents.T01_FS_left;
        detected_T01_FO_left = detectedGaitEvents.gaitEvents.T01_FO_left;
        detected_T01_FS_right = detectedGaitEvents.gaitEvents.T01_FS_right;
        detected_T01_FO_right = detectedGaitEvents.gaitEvents.T01_FO_right;
        detected_T02_FS_left = detectedGaitEvents.gaitEvents.T02_FS_left;
        detected_T02_FO_left = detectedGaitEvents.gaitEvents.T02_FO_left;
        detected_T02_FS_right = detectedGaitEvents.gaitEvents.T02_FS_right;
        detected_T02_FO_right = detectedGaitEvents.gaitEvents.T02_FO_right;
        detected_T03_FS_left = detectedGaitEvents.gaitEvents.T03_FS_left;
        detected_T03_FO_left = detectedGaitEvents.gaitEvents.T03_FO_left;
        detected_T03_FS_right = detectedGaitEvents.gaitEvents.T03_FS_right;
        detected_T03_FO_right = detectedGaitEvents.gaitEvents.T03_FO_right;
        
        groundTruthFieldNames = fieldnames(groundTruthStructs(i));
        groundTruthGaitEvents = load(['HealthyGaitEvents/',groundTruthStructs(i).(groundTruthFieldNames{1})]);
        groundTruth_T01_FS_left = groundTruthGaitEvents.gaitEvents.T01_FS_left;
        groundTruth_T01_FO_left = groundTruthGaitEvents.gaitEvents.T01_FO_left;
        groundTruth_T01_FS_right = groundTruthGaitEvents.gaitEvents.T01_FS_right;
        groundTruth_T01_FO_right = groundTruthGaitEvents.gaitEvents.T01_FO_right;
        groundTruth_T02_FS_left = groundTruthGaitEvents.gaitEvents.T02_FS_left;
        groundTruth_T02_FO_left = groundTruthGaitEvents.gaitEvents.T02_FO_left;
        groundTruth_T02_FS_right = groundTruthGaitEvents.gaitEvents.T02_FS_right;
        groundTruth_T02_FO_right = groundTruthGaitEvents.gaitEvents.T02_FO_right;
        groundTruth_T03_FS_left = groundTruthGaitEvents.gaitEvents.T03_FS_left;
        groundTruth_T03_FO_left = groundTruthGaitEvents.gaitEvents.T03_FO_left;
        groundTruth_T03_FS_right = groundTruthGaitEvents.gaitEvents.T03_FS_right;
        groundTruth_T03_FO_right = groundTruthGaitEvents.gaitEvents.T03_FO_right;
        
        detected_T01_FS_left = detected_T01_FS_left(detected_T01_FS_left > groundTruth_T01_FS_left(1) & ...
            detected_T01_FS_left < groundTruth_T01_FS_left(end));
        
        detected_T01_FO_left = detected_T01_FO_left(detected_T01_FO_left > groundTruth_T01_FO_left(1) & ...
            detected_T01_FO_left < groundTruth_T01_FO_left(end));
        
        detected_T01_FS_right = detected_T01_FS_right(detected_T01_FS_right > groundTruth_T01_FS_right(1) & ...
            detected_T01_FS_right < groundTruth_T01_FS_right(end));
        
        detected_T01_FO_right = detected_T01_FO_right(detected_T01_FO_right > groundTruth_T01_FO_right(1) & ...
            detected_T01_FO_right < groundTruth_T01_FO_right(end));
        
        detected_T02_FS_left = detected_T02_FS_left(detected_T02_FS_left > groundTruth_T02_FS_left(1) & ...
            detected_T02_FS_left < groundTruth_T02_FS_left(end));
        
        detected_T02_FO_left = detected_T02_FO_left(detected_T02_FO_left > groundTruth_T02_FO_left(1) & ...
            detected_T02_FO_left < groundTruth_T02_FO_left(end));
        
        detected_T02_FS_right = detected_T02_FS_right(detected_T02_FS_right > groundTruth_T02_FS_right(1) & ...
            detected_T02_FS_right < groundTruth_T02_FS_right(end));
        
        detected_T02_FO_right = detected_T02_FO_right(detected_T02_FO_right > groundTruth_T02_FO_right(1) & ...
            detected_T02_FO_right < groundTruth_T02_FO_right(end));
        
        detected_T03_FS_left = detected_T03_FS_left(detected_T03_FS_left > groundTruth_T03_FS_left(1) & ...
            detected_T03_FS_left < groundTruth_T03_FS_left(end));
        
        detected_T03_FO_left = detected_T03_FO_left(detected_T03_FO_left > groundTruth_T03_FO_left(1) & ...
            detected_T03_FO_left < groundTruth_T03_FO_left(end));
        
        detected_T03_FS_right = detected_T03_FS_right(detected_T03_FS_right > groundTruth_T03_FS_right(1) & ...
            detected_T03_FS_right < groundTruth_T03_FS_right(end));
        
        detected_T03_FO_right = detected_T03_FO_right(detected_T03_FO_right > groundTruth_T03_FO_right(1) & ...
            detected_T03_FO_right < groundTruth_T03_FO_right(end));
        
        for j=1:min([length(detected_T01_FS_left) length(groundTruth_T01_FS_left)])
            detectionDifferences = [detectionDifferences abs(detected_T01_FS_left(j)-groundTruth_T01_FS_left(j))];
        end
        
        for j=1:min([length(detected_T01_FO_left) length(groundTruth_T01_FO_left)])
            detectionDifferences = [detectionDifferences abs(detected_T01_FO_left(j)-groundTruth_T01_FO_left(j))];
        end
        
        for j=1:min([length(detected_T01_FS_right) length(groundTruth_T01_FS_right)])
            detectionDifferences = [detectionDifferences abs(detected_T01_FS_right(j)-groundTruth_T01_FS_right(j))];
        end
        
        for j=1:min([length(detected_T01_FO_right) length(groundTruth_T01_FO_right)])
            detectionDifferences = [detectionDifferences abs(detected_T01_FO_right(j)-groundTruth_T01_FO_right(j))];
        end
        
        for j=1:min([length(detected_T02_FS_left) length(groundTruth_T02_FS_left)])
            detectionDifferences = [detectionDifferences abs(detected_T02_FS_left(j)-groundTruth_T02_FS_left(j))];
        end
        
        for j=1:min([length(detected_T02_FO_left) length(groundTruth_T02_FO_left)])
            detectionDifferences = [detectionDifferences abs(detected_T02_FO_left(j)-groundTruth_T02_FO_left(j))];
        end
        
        for j=1:min([length(detected_T02_FS_right) length(groundTruth_T02_FS_right)])
            detectionDifferences = [detectionDifferences abs(detected_T02_FS_right(j)-groundTruth_T02_FS_right(j))];
        end
        
        for j=1:min([length(detected_T02_FO_right) length(groundTruth_T02_FO_right)])
            detectionDifferences = [detectionDifferences abs(detected_T02_FO_right(j)-groundTruth_T02_FO_right(j))];
        end
        
        for j=1:min([length(detected_T03_FS_left) length(groundTruth_T03_FS_left)])
            detectionDifferences = [detectionDifferences abs(detected_T03_FS_left(j)-groundTruth_T03_FS_left(j))];
        end
        
        for j=1:min([length(detected_T03_FO_left) length(groundTruth_T03_FO_left)])
            detectionDifferences = [detectionDifferences abs(detected_T03_FO_left(j)-groundTruth_T03_FO_left(j))];
        end
        
        for j=1:min([length(detected_T03_FS_right) length(groundTruth_T03_FS_right)])
            detectionDifferences = [detectionDifferences abs(detected_T03_FS_right(j)-groundTruth_T03_FS_right(j))];
        end
        
        for j=1:min([length(detected_T03_FO_right) length(groundTruth_T03_FO_right)])
            detectionDifferences = [detectionDifferences abs(detected_T03_FO_right(j)-groundTruth_T03_FO_right(j))];
        end
        
    end

end