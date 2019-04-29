# AML-Courtine
Let's analyse this gait!

Questions about the kinematics parameters: 
- STRIDE LENGTH: why the norm? isn't it better to take one axis, the z-axis for example. 
- the acceleration: I would remove it, not very reliable parameter especially for SCI subjects
- for the calculation of the velocity: the use of 'diff' can maybe be replaced by the distance divided by the time, for the gait. 
- what is the symmetry ratio? 

Plots for the report: 
- a plot showing the kinematics signals (ANK and TOE only) with the Foot Off and Foot Strikes events (without float, healthy), to underline the elements used to create the ground truth (max is the strike, min is off for, the toe and the opposite for the ankle)
- a plot showing the EMG signals of both MG and TA (without float, healthy)
- graph of all the Explained Variance vs. all the Principal Components  
- boxplot for the performance of the algorithm 
- plots of the PCA: parameters explaining the most variance

TODOs:

Samuele:
- Adapt Load DONE
- Adapt code with "InitializeGaitEvents" DONE
- Correct frequency in logicalMaskSCI
- Gait detection with velocity
- Stick plot zy-axis ALMOST DONE
- Add to Stick the FO and FS

Lena:
- Look if ANOVA is appropriate
- Continue on k-means (max 2 variables) (brainstorming look at k-NN, Gaussian mixture       
  models)
- PCA

Laure: 
- Rename healthy segmentation
- Ground truth with TOE
- Create matrices for PCA

Ludovica:
- Report

Alice:
- EMG feature extraction

