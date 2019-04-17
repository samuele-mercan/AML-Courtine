
function groundTruthTool(dataName, fileName)

% this tool plots each raw signal for the kinematics with a cursor 
% by looking at the signal, the locations of the gait events are found
% for each signal we find the foot strikes and the foot off 

data = load(dataName);
fields = fieldnames(data);

figure()
hold on
title(strcat(dataName, "_T01_left"))
plot(data.(fields{1}).T_01.Raw.Kin.LTOE(:,3));
fsKin = data.(fields{1}).T_01.fsKin;
[x, y] = ginput;
T01_FS_left = x/fsKin;
[x, y] = ginput;
T01_FO_left = x/fsKin;

% figure()
% hold on
% plot(data.(fields{1}).T_01.Raw.Kin.LTOE(:,3));
% scatter(data_01_FS_left,data.(fields{1}).T_01.Raw.Kin.LTOE(data_01_FS_left,3), 'b');
% scatter(data_01_FO_left,data.(fields{1}).T_01.Raw.Kin.LTOE(data_01_FO_left,3), 'r');

figure()
hold on
title(strcat(dataName, "_T01_right"))
plot(data.(fields{1}).T_01.Raw.Kin.RTOE(:,3));

[x, y] = ginput;
T01_FS_right = x/fsKin;
[x, y] = ginput;
T01_FO_right = x/fsKin;

figure()
hold on
title(strcat(dataName, "_T02_left"))
plot(data.(fields{1}).T_02.Raw.Kin.LTOE(:,3));
fsKin = data.(fields{1}).T_02.fsKin;
[x, y] = ginput;
T02_FS_left = x/fsKin;
[x, y] = ginput;
T02_FO_left = x/fsKin;

figure()
hold on
title(strcat(dataName, "_T02_right"))
plot(data.(fields{1}).T_02.Raw.Kin.RTOE(:,3));
[x, y] = ginput;
T02_FS_right = x/fsKin;
[x, y] = ginput;
T02_FO_right = x/fsKin;

figure()
hold on
title(strcat(dataName, "_T03_left"))
plot(data.(fields{1}).T_03.Raw.Kin.LTOE(:,3));
fsKin = data.(fields{1}).T_03.fsKin;
[x, y] = ginput;
T03_FS_left = x/fsKin;
[x, y] = ginput;
T03_FO_left = x/fsKin;

figure()
hold on
title(strcat(dataName, "_T03_right"))
plot(data.(fields{1}).T_03.Raw.Kin.RTOE(:,3));
[x, y] = ginput;
T03_FS_right = x/fsKin;
[x, y] = ginput;
T03_FO_right = x/fsKin;

gaitEvents = struct();

gaitEvents.T01_FS_left = T01_FS_left;
gaitEvents.T01_FO_left = T01_FO_left;
gaitEvents.T01_FS_right = T01_FS_right;
gaitEvents.T01_FO_right = T01_FO_right;
gaitEvents.T02_FS_left = T02_FS_left;
gaitEvents.T02_FO_left = T02_FO_left;
gaitEvents.T02_FS_right = T02_FS_right;
gaitEvents.T02_FO_right = T02_FO_right;
gaitEvents.T03_FS_left = T03_FS_left;
gaitEvents.T03_FO_left = T03_FO_left;
gaitEvents.T03_FS_right = T03_FS_right;
gaitEvents.T03_FO_right = T03_FO_right;

save(fileName, 'gaitEvents');

end

