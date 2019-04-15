function [offset] = clean_offsets(onset, offset)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

offset.T1.LTA = offset.T1.LTA(offset.T1.LTA > onset.T1.LTA(1));
offset.T1.RTA = offset.T1.RTA(offset.T1.RTA > onset.T1.RTA(1));
offset.T1.LMG = offset.T1.LMG(offset.T1.LMG > onset.T1.LMG(1));
offset.T1.RMG = offset.T1.RMG(offset.T1.RMG > onset.T1.RMG(1));

offset.T2.LTA = offset.T2.LTA(offset.T2.LTA > onset.T2.LTA(1));
offset.T2.RTA = offset.T2.RTA(offset.T2.RTA > onset.T2.RTA(1));
offset.T2.LMG = offset.T2.LMG(offset.T2.LMG > onset.T2.LMG(1));
offset.T2.RMG = offset.T2.RMG(offset.T2.RMG > onset.T2.RMG(1));

offset.T3.LTA = offset.T3.LTA(offset.T3.LTA > onset.T3.LTA(1));
offset.T3.RTA = offset.T3.RTA(offset.T3.RTA > onset.T3.RTA(1));
offset.T3.LMG = offset.T3.LMG(offset.T3.LMG > onset.T3.LMG(1));
offset.T3.RMG = offset.T3.RMG(offset.T3.RMG > onset.T3.RMG(1));

end

