function [GaitCyclesFloat,GaitCyclesNoFloat] = HealthySegmentation1(dataFileFloat,dataFileNoFloat,leftFoot)

    [noFloat_FS_left, noFloat_FO_left, noFloat_FS_right, noFloat_FO_right, ...
        Float_FS_left, Float_FO_left, Float_FS_right, Float_FO_right] = ...
        Healthysegmentation(dataFileFloat,dataFileNoFloat);

    [GaitCyclesFloat] = Healthysegmentation2(dataFileFloat, ...
        Float_FS_left,Float_FO_left,Float_FS_right,Float_FO_right,leftFoot);

    [GaitCyclesNoFloat] = Healthysegmentation2(dataFileNoFloat, ...
        noFloat_FS_left,noFloat_FO_left,noFloat_FS_right,noFloat_FO_right,leftFoot);
    
end

