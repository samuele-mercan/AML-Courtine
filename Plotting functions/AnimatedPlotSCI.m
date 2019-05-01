function [] = AnimatedPlotSCI(data, left, three_d)
%Real time plot of movement, in 2D or 3D
%   data: the data coming from, SCIsegmentation
%   left: bool, if 1 left leg else right leg
%   three_d: bool, if 1 3D else 2D plot

gaitCycles = fieldnames(data);

x_ankle = [];
y_ankle = [];
z_ankle = [];

x_knee = [];
y_knee = [];
z_knee = [];

x_toe = [];
y_toe = [];
z_toe = [];

x_asi = [];
y_asi = [];
z_asi = [];

if (three_d)
    if (left)
        for i = 1:numel(gaitCycles)
            GC = char(gaitCycles(i));
            x_ankle = [x_ankle, data.(GC).Kin.LANK(:,1)'];
            y_ankle = [y_ankle, data.(GC).Kin.LANK(:,2)'];
            z_ankle = [z_ankle, data.(GC).Kin.LANK(:,3)'];
            x_knee = [x_knee, data.(GC).Kin.LKNE(:,1)'];
            y_knee = [y_knee, data.(GC).Kin.LKNE(:,2)'];
            z_knee = [z_knee, data.(GC).Kin.LKNE(:,3)'];
            x_toe = [x_toe, data.(GC).Kin.LTOE(:,1)'];
            y_toe = [y_toe, data.(GC).Kin.LTOE(:,2)'];
            z_toe = [z_toe, data.(GC).Kin.LTOE(:,3)'];
            x_asi = [x_asi, data.(GC).Kin.LASI(:,1)'];
            y_asi = [y_asi, data.(GC).Kin.LASI(:,2)'];
            z_asi = [z_asi, data.(GC).Kin.LASI(:,3)'];
        end

    else
        for i = 1:numel(gaitCycles)
            GC = char(gaitCycles(i));
            x_ankle = [x_ankle, data.(GC).Kin.RANK(:,1)'];
            y_ankle = [y_ankle, data.(GC).Kin.RANK(:,2)'];
            z_ankle = [z_ankle, data.(GC).Kin.RANK(:,3)'];
            x_knee = [x_knee, data.(GC).Kin.RKNE(:,1)'];
            y_knee = [y_knee, data.(GC).Kin.RKNE(:,2)'];
            z_knee = [z_knee, data.(GC).Kin.RKNE(:,3)'];
            x_toe = [x_toe, data.(GC).Kin.RTOE(:,1)'];
            y_toe = [y_toe, data.(GC).Kin.RTOE(:,2)'];
            z_toe = [z_toe, data.(GC).Kin.RTOE(:,3)'];
            x_asi = [x_asi, data.(GC).Kin.RASI(:,1)'];
            y_asi = [y_asi, data.(GC).Kin.RASI(:,2)'];
            z_asi = [z_asi, data.(GC).Kin.RASI(:,3)'];
        end       
    end
    
    curve_ankle = animatedline('Color', 'k');
    curve_knee = animatedline('Color', 'r');
    curve_toe = animatedline('Color', 'c');
    curve_asi = animatedline('Color', 'm');

    view(3)

    for i = 1:length(y_ankle)
        addpoints(curve_ankle,x_ankle(i),y_ankle(i),z_ankle(i));
        addpoints(curve_knee,x_knee(i),y_knee(i),z_knee(i));
        addpoints(curve_toe,x_toe(i),y_toe(i),z_toe(i));
        addpoints(curve_asi,x_asi(i),y_asi(i),z_asi(i));

        drawnow
    end
    
else
    if (left)
        for i = 1:numel(gaitCycles)
            GC = char(gaitCycles(i));
            y_ankle = [y_ankle, data.(GC).Kin.LANK(:,2)'];
            z_ankle = [z_ankle, data.(GC).Kin.LANK(:,3)'];
            y_knee = [y_knee, data.(GC).Kin.LKNE(:,2)'];
            z_knee = [z_knee, data.(GC).Kin.LKNE(:,3)'];
            y_toe = [y_toe, data.(GC).Kin.LTOE(:,2)'];
            z_toe = [z_toe, data.(GC).Kin.LTOE(:,3)'];
            y_asi = [y_asi, data.(GC).Kin.LASI(:,2)'];
            z_asi = [z_asi, data.(GC).Kin.LASI(:,3)'];
        end

    else
        for i = 1:numel(gaitCycles)
            GC = char(gaitCycles(i));
            y_ankle = [y_ankle, data.(GC).Kin.RANK(:,2)'];
            z_ankle = [z_ankle, data.(GC).Kin.RANK(:,3)'];
            y_knee = [y_knee, data.(GC).Kin.RKNE(:,2)'];
            z_knee = [z_knee, data.(GC).Kin.RKNE(:,3)'];
            y_toe = [y_toe, data.(GC).Kin.RTOE(:,2)'];
            z_toe = [z_toe, data.(GC).Kin.RTOE(:,3)'];
            y_asi = [y_asi, data.(GC).Kin.RASI(:,2)'];
            z_asi = [z_asi, data.(GC).Kin.RASI(:,3)'];
        end
    end
    curve_ankle = animatedline('Color', 'k');
    curve_knee = animatedline('Color', 'r');
    curve_toe = animatedline('Color', 'c');
    curve_asi = animatedline('Color', 'm');

    for i = 1:length(y_ankle)

        addpoints(curve_ankle,y_ankle(i),z_ankle(i));
        addpoints(curve_knee,y_knee(i),z_knee(i));
        addpoints(curve_toe,y_toe(i),z_toe(i));
        addpoints(curve_asi,y_asi(i),z_asi(i));

        drawnow
    end
end

end

