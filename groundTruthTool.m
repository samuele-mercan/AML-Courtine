
function [data_01_FS_left, data_01_FS_right, ...
    data_01_FO_left, data_01_FO_right, ...
    data_02_FS_left, data_02_FS_right, ...
    data_02_FO_left, data_02_FO_right, ...
    data_03_FS_left, data_03_FS_right, ...
    data_03_FO_left, data_03_FO_right] = groundTruthTool(dataName)


% this tool plots each raw signal for the kinematics with a cursor 
% by looking at the signal, the locations of the gait events are found
% for each signal we find the foot strikes and the foot off 

data = load(dataName);
fields = fieldnames(data);

figure()
hold on
title(strcat(dataName, "_T01_left"))
plot(data.(fields{1}).T_01.Raw.Kin.LTOE(:,3));
[x, y] = ginput;
data_01_FS_left = int16(x);
[x, y] = ginput;
data_01_FO_left = int16(x);

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
data_01_FS_right = int16(x);
[x, y] = ginput;
data_01_FO_right = int16(x);

figure()
hold on
title(strcat(dataName, "_T02_left"))
plot(data.(fields{1}).T_02.Raw.Kin.LTOE(:,3));
[x, y] = ginput;
data_02_FS_left = int16(x);
[x, y] = ginput;
data_02_FO_left = int16(x);

figure()
hold on
title(strcat(dataName, "_T02_right"))
plot(data.(fields{1}).T_02.Raw.Kin.RTOE(:,3));
[x, y] = ginput;
data_02_FS_right = int16(x);
[x, y] = ginput;
data_02_FO_right = int16(x);

figure()
hold on
title(strcat(dataName, "_T03_left"))
plot(data.(fields{1}).T_03.Raw.Kin.LTOE(:,3));
[x, y] = ginput;
data_03_FS_left = int16(x);
[x, y] = ginput;
data_03_FO_left = int16(x);

figure()
hold on
title(strcat(dataName, "_T03_right"))
plot(data.(fields{1}).T_03.Raw.Kin.RTOE(:,3));
[x, y] = ginput;
data_03_FS_right = int16(x);
[x, y] = ginput;
data_03_FO_right = int16(x);


