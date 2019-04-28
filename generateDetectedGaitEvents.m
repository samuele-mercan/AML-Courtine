function generateDetectedGaitEvents()

    mkdir('DetectedHealthyGaitEvents');
    
    detectionAlgorithm('Healthy Recordings/Subject1_2019/FLOAT/S1_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2019_S1_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject2_2019/FLOAT/S2_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2019_S2_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject2_2019/NO_FLOAT/S2_NO_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2019_S2_NO_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject3_2019/FLOAT/S3_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2019_S3_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject3_2019/NO_FLOAT/S3_NO_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2019_S3_NO_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject1_2018/FLOAT/S1_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2018_S1_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject1_2018/NO_FLOAT/S1_NO_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2018_S1_NO_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject2_2018/FLOAT/S2_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2018_S2_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject2_2018/NO_FLOAT/S2_NO_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2018_S2_NO_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject3_2018/FLOAT/S3_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2018_S3_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject3_2018/NO_FLOAT/S3_NO_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2018_S3_NO_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject4_2018/FLOAT/S4_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2018_S4_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject4_2018/NO_FLOAT/S4_NO_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2018_S4_NO_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject5_2018/FLOAT/S5_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2018_S5_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject5_2018/NO_FLOAT/S5_NO_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2018_S5_NO_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject6_2018/FLOAT/S6_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2018_S6_FLOAT.mat');
    
    detectionAlgorithm('Healthy Recordings/Subject6_2018/NO_FLOAT/S6_NO_FLOAT.mat', ...
        'DetectedHealthyGaitEvents/2018_S6_NO_FLOAT.mat');
    
    
end