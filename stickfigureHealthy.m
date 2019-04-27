function [] = stickfigureHealthy(data, left, subject, FLOATorNOT)
%Plot a stick figure on the XZ-plane
%   data: comes from HealthySegmentation
%   left: boolean, if 1 is left leg else right


gaitCycles = fieldnames(data.(subject).(FLOATorNOT));
plotDataTOE = [];
plotDataANK = [];
plotDataKNE = [];
plotDataHIP = [];
if (left)
    for i = 1:numel(gaitCycles)
        GC = char(gaitCycles(i));
        plotDataTOE = [plotDataTOE; data.(subject).(FLOATorNOT).(GC).Kin.LTOE(:,1:2:end)];
        plotDataANK = [plotDataANK; data.(subject).(FLOATorNOT).(GC).Kin.LANK(:,1:2:end)];
        plotDataKNE = [plotDataKNE; data.(subject).(FLOATorNOT).(GC).Kin.LKNE(:,1:2:end)];
        plotDataHIP = [plotDataHIP; data.(subject).(FLOATorNOT).(GC).Kin.LHIP(:,1:2:end)];
    end
else
    for i = 1:numel(gaitCycles)
        GC = char(gaitCycles(i));
        plotDataTOE = [plotDataTOE; data.(subject).(FLOATorNOT).(GC).Kin.RTOE(:,1:2:end)];
        plotDataANK = [plotDataANK; data.(subject).(FLOATorNOT).(GC).Kin.RANK(:,1:2:end)];
        plotDataKNE = [plotDataKNE; data.(subject).(FLOATorNOT).(GC).Kin.RKNE(:,1:2:end)];
        plotDataHIP = [plotDataHIP; data.(subject).(FLOATorNOT).(GC).Kin.RHIP(:,1:2:end)];
    end
end
    

sizeData = size(plotDataTOE(:,1));

hold on
for i = 1:sizeData(1)
    line(plotDataTOE, plotDataANK);
    line(plotDataANK, plotDataKNE);
    line(plotDataKNE, plotDataHIP);
end
hold off



end

