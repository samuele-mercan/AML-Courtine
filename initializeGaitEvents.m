function [dataset_01_FS_left, dataset_01_FS_right, ...
    dataset_01_FO_left, dataset_01_FO_right, ...
    dataset_02_FS_left, dataset_02_FS_right, ...
    dataset_02_FO_left, dataset_02_FO_right, ...
    dataset_03_FS_left, dataset_03_FS_right, ...
    dataset_03_FO_left, dataset_03_FO_right] = initializeGaitEvents(table_01, table_02, table_03) 

    % separates all gait events of each trial into vectors of FS_right, 
    % FS_left, FO_left, FO_right
    
    % TRIAL 1
    dataset_01_FS_left=[];
    dataset_01_FS_right=[];
    dataset_01_FO_left=[];
    dataset_01_FO_right=[];
   
    % for each gait event of the first trial, determines if left or right
    % and if foot off or foot strike and stores it
    for i = 1:length(table_01.Name)
        if string(table_01.Name{i})=='Foot Strike'
            if string(table_01.Context{i}) == 'Left'
                dataset_01_FS_left = [dataset_01_FS_left double(table_01.Time_s_(i))];
            else
                dataset_01_FS_right = [dataset_01_FS_right double(table_01.Time_s_(i))];
            end
        elseif string(table_01.Name{i})=='Foot Off'
            if string(table_01.Context{i}) == 'Left'
                dataset_01_FO_left = [dataset_01_FO_left double(table_01.Time_s_(i))];
            else
                dataset_01_FO_right = [dataset_01_FO_right double(table_01.Time_s_(i))];
            end
        end
    end    
    
    % TRIAL 2
    dataset_02_FS_left=[];
    dataset_02_FS_right=[];
    dataset_02_FO_left=[];
    dataset_02_FO_right=[];
   
    for i = 1:length(table_02.Name)
        if string(table_02.Name{i})=='Foot Strike'
            if string(table_02.Context{i}) == 'Left'
                dataset_02_FS_left = [dataset_02_FS_left double(table_02.Time_s_(i))];
            else
                dataset_02_FS_right = [dataset_02_FS_right double(table_02.Time_s_(i))];
            end
        elseif string(table_02.Name{i})=='Foot Off'
            if string(table_02.Context{i}) == 'Left'
                dataset_02_FO_left = [dataset_02_FO_left double(table_02.Time_s_(i))];
            else
                dataset_02_FO_right = [dataset_02_FO_right double(table_02.Time_s_(i))];
            end
        end
    end
    
    % TRIAL 3
    dataset_03_FS_left=[];
    dataset_03_FS_right=[];
    dataset_03_FO_left=[];
    dataset_03_FO_right=[];
   
    for i = 1:length(table_03.Name)
        if string(table_03.Name{i})=='Foot Strike'
            if string(table_03.Context{i}) == 'Left'
                dataset_03_FS_left = [dataset_03_FS_left double(table_03.Time_s_(i))];
            else
                dataset_03_FS_right = [dataset_03_FS_right double(table_03.Time_s_(i))];
            end
        elseif string(table_03.Name{i})=='Foot Off'
            if string(table_03.Context{i}) == 'Left'
                dataset_03_FO_left = [dataset_03_FO_left double(table_03.Time_s_(i))];
            else
                dataset_03_FO_right = [dataset_03_FO_right double(table_03.Time_s_(i))];
            end
        end
    end
    
   