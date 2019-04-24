function SCIgaitEventsStructureCreation()
% Creates a structure that stores all the gait events for the SCI subjects.
% Used for the plots. 

    mkdir('SCIGaitEvents')

    % Data with Float, no Crutches 
    
    Float_01 = readtable([pwd,'/Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_03_GAIT.csv']);
    Float_02 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_04_GAIT.csv');
    Float_03 = readtable('Exercise - Material - SCI Subject/FLOAT_NO_CRUTCHES/GAIT FILES/SCI_HCU_20150505_04OVGb_45BWS_vFWD_noAD_05_GAIT.csv');

    [Float_01_FS_left, Float_01_FS_right, Float_01_FO_left, Float_01_FO_right, ...
        Float_02_FS_left, Float_02_FS_right, Float_02_FO_left, Float_02_FO_right, ...
        Float_03_FS_left, Float_03_FS_right, Float_03_FO_left, Float_03_FO_right] = initializeGaitEvents(Float_01, Float_02, Float_03);
    
    
    gaitEvents = struct();

    gaitEvents.T01_FS_left = Float_01_FS_left;
    gaitEvents.T01_FO_left = Float_01_FO_left;
    gaitEvents.T01_FS_right = Float_01_FS_right;
    gaitEvents.T01_FO_right = Float_01_FO_right;
    gaitEvents.T02_FS_left = Float_02_FS_left;
    gaitEvents.T02_FO_left = Float_02_FO_left;
    gaitEvents.T02_FS_right = Float_02_FS_right;
    gaitEvents.T02_FO_right = Float_02_FO_right;
    gaitEvents.T03_FS_left = Float_03_FS_left;
    gaitEvents.T03_FO_left = Float_03_FO_left;
    gaitEvents.T03_FS_right = Float_03_FS_right;
    gaitEvents.T03_FO_right = Float_03_FO_right;

    save('SCIGaitEvents/FLOAT.mat', 'gaitEvents');
    
    
    % Data without Float, with Crutches

    noFloat_01 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_01_GAIT.csv');
    noFloat_02 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_02_GAIT.csv');
    noFloat_03 = readtable('Exercise - Material - SCI Subject/NO_FLOAT_CRUTCHES/GAIT FILES/SCI_HCU_20150505_02OVGa_AD_03_GAIT.csv');

    [noFloat_01_FS_left, noFloat_01_FS_right, noFloat_01_FO_left, noFloat_01_FO_right, ...
        noFloat_02_FS_left, noFloat_02_FS_right, noFloat_02_FO_left, noFloat_02_FO_right, ...
        noFloat_03_FS_left, noFloat_03_FS_right, noFloat_03_FO_left, noFloat_03_FO_right] = initializeGaitEvents(noFloat_01, noFloat_02, noFloat_03);

    gaitEvents = struct();

    gaitEvents.T01_FS_left = noFloat_01_FS_left;
    gaitEvents.T01_FO_left = noFloat_01_FO_left;
    gaitEvents.T01_FS_right = noFloat_01_FS_right;
    gaitEvents.T01_FO_right = noFloat_01_FO_right;
    gaitEvents.T02_FS_left = noFloat_02_FS_left;
    gaitEvents.T02_FO_left = noFloat_02_FO_left;
    gaitEvents.T02_FS_right = noFloat_02_FS_right;
    gaitEvents.T02_FO_right = noFloat_02_FO_right;
    gaitEvents.T03_FS_left = noFloat_03_FS_left;
    gaitEvents.T03_FO_left = noFloat_03_FO_left;
    gaitEvents.T03_FS_right = noFloat_03_FS_right;
    gaitEvents.T03_FO_right = noFloat_03_FO_right;

    save('SCIGaitEvents/NO_FLOAT.mat', 'gaitEvents');

end