# AML-Courtine
Let's analyse this gait!

Code to run : 

A. Gait Analysis
- mainKin.m : launches segmentation of raw data and EMG denoising + all the processing of kinematic data => returns kinematic feature matrix
- mainEMG.m : launches segmentation of raw data and EMG denoising + all the processing of emg data => returns EMG feature matrix
- mainPCA.m : fetches features matrix + launches all the Principle Components Analysis with associated plots that were tested + ANOVA analysis.

B. Ground Truth Generation
- GroundTruthGaitEvents.m : launches the manual labelling of events for segmentation into gait cycles => returns structure containing FO and FS times for each gait 
- GroundTruthEMG.m :  launches the manual labelling of events for segmentation into gait cycles => returns structure containing onset and offsets samples for each gait 

C.