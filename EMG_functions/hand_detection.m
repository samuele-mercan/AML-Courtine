function [x] = hand_detection(data1, data2)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

%% T1
figure();
subplot(2,1,1)
plot(data1.T1.LTA);
subplot(2,1,2)
plot(data2.T1.LTA);
title('Denoised LTA');
[x.T1.LTA,~]=ginput();

figure();
subplot(2,1,1)
plot(data1.T1.RTA);
subplot(2,1,2)
plot(data2.T1.RTA);
title('Denoised RTA');
[x.T1.RTA,~]=ginput();

figure();
subplot(2,1,1)
plot(data1.T1.LMG);
subplot(2,1,2)
plot(data2.T1.LMG);
title('Denoised lMG');
[x.T1.LMG,~]=ginput();

figure();
subplot(2,1,1)
plot(data1.T1.RMG);
subplot(2,1,2)
plot(data2.T1.RMG);
title('Denoised RMG');
[x.T1.RMG,~]=ginput();


%% T2

figure();
plot(data1.T2.LTA);
hold on;
plot(data2.T2.LTA);
legend('Raw LTA','Denoised LTA');
[x.T2.LTA,~]=ginput();

figure();
plot(data1.T2.RTA);
hold on;
plot(data2.T2.RTA);
legend('Raw RTA','Denoised RTA');
[x.T2.RTA,~]=ginput();

figure();
plot(data1.T2.LMG);
hold on;
plot(data2.T2.LMG);
legend('Raw LMG','Denoised LMG');
[x.T2.LMG,~]=ginput();

figure();
plot(data1.T2.RMG);
hold on;
plot(data2.T2.RMG);
legend('Raw RMG','Denoised RMG');
[x.T2.RMG,~]=ginput();

%% T3

figure();
plot(data1.T3.LTA);
hold on;
plot(data2.T3.LTA);
legend('Raw LTA','Denoised LTA');
[x.T3.LTA,~]=ginput();

figure();
plot(data1.T3.RTA);
hold on;
plot(data2.T3.RTA);
legend('Raw RTA','Denoised RTA');
[x.T3.RTA,~]=ginput();

figure();
plot(data1.T3.LMG);
hold on;
plot(data2.T3.LMG);
legend('Raw LMG','Denoised LMG');
[x.T3.LMG,~]=ginput();

figure();
plot(data1.T3.RMG);
hold on;
plot(data2.T3.RMG);
legend('Raw RMG','Denoised RMG');
[x.T3.RMG,~]=ginput();

end

