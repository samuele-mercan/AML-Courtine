%% load the structure containing all parameter matrices for different subjects,...


clear all;close all;

%Load structures containing all the matrices for the different conditions
load('parametersKin.mat')
load('parametersEMG.mat')

%parameter names for the EMG parameters
variableNamesEMG = {'duration LMG', 'duration RMG',...
    'duration LTA',  'duration RTA', 'mean LMG','mean RMG',...
    'mean LTA',  'mean RTA', 'max LMG', 'max RMG', 'max LTA', 'max RTA',...
    'rms LMG', 'rms RMG', 'rms LTA', 'rms RTA',...
    'coactivation Left', 'coactivation Right'}

%concatenation of the label lists of kinematics and EMG parameters
labels = cat(2,variableNames, variableNamesEMG);

%loading the labels for the year and condition of subjects
%0 healthy float 2018 , 1 healthy float 2019
%2 healthy no float 2018, 3 healthy no float 2019, 4 sci float, 5 sci no float
load('labels.mat')




%% PCA: segmentation with respect to right foot
%concatenation of data matrices
data = [Kin_Healthy_NoFloat_Right Param_Healthy_NoFloat_Right;...
    Kin_Healthy_Float_Right Param_Healthy_Float_Right;...
    Kin_SCI_NoFloat_Right Param_SCI_NoFloat_Right;...
    Kin_SCI_Float_Right Param_SCI_Float_Right]; %put in all different matrices, separate with ;
%make sure you know indices of the different matrices within data!


%normalize data, uses z-score
data = normalize(data);

%PCA of data matrix
% ~ skips any of the outputs --> we don't want t squared
% coeff = PC coeffs, score = matrix containing observations and components
% latent = PC variances --> eigenvalues of covariance matrix of data
% explained = %of total variance explained by each PC
[coeff, score, ~, ~, explained] = pca(data);

% find 10 most important features that contribute to the 3 first PCs
%how much variation is explained by the first 3 pcs:
percentage_3_PCs = explained(1)+explained(2)+explained(3);
%fraction of variation transformed into number of features
features_pc1 = round(10*(explained(1)/percentage_3_PCs),0);
features_pc2 = round(10*(explained(2)/percentage_3_PCs),0);
features_pc3 = round(10*(explained(3)/percentage_3_PCs),0);

top10_sorted = [];
top10_features = [];

%find the features
for i=1:3
    %sort features in descending order
    [sorted, feature_index] = sort(coeff(:,i),'descend')
    top10_sorted = [top10_sorted, sorted];
    top10_features = [top10_features, feature_index];
end

%choose the features for each PC and add to one matrix
top10_ = [top10_sorted(1:features_pc1,1);...
    top10_sorted(1:features_pc2,2); top10_sorted(1:features_pc3,3)];
%numbers in the label matrix corresponding to the chosen features
top10_labels_right = [top10_features(1:features_pc1,1);...
    top10_features(1:features_pc2,2); top10_features(1:features_pc3,3)];

%ideces of the different conditions in the big data matrix
HealthyNoFloat = 1:80;
HealthyFloat = 81:168;
SCINoFloat = 169:190;
SCIFloat = 191:205;

%3D plot for the first 3 PCs
figure('Name','PCA: segmentation with respect to right foot')
scatter3(score(HealthyNoFloat,1), score(HealthyNoFloat,2), score(HealthyNoFloat,3));
hold on
scatter3(score(HealthyFloat,1), score(HealthyFloat,2), score(HealthyFloat,3));
scatter3(score(SCINoFloat,1), score(SCINoFloat,2), score(SCINoFloat,3));
scatter3(score(SCIFloat,1), score(SCIFloat,2), score(SCIFloat,3));
xlabel('1st PC','fontweight','bold')
ylabel('2nd PC','fontweight','bold')
zlabel('3rd PC','fontweight','bold')
legend('Healthy No Float', 'Healthy Float', 'SCI No Float', 'SCI Float')
hold off

%figure to plot the cumulated variance for the PCs with a threshold of 90%
figure('Name', 'Cumulated variance')
plot(1:length(cumsum(explained)), cumsum(explained), 'r*-')
hold on
%90% line
line([1,length(cumsum(explained))], [90, 90])
xlabel('PC','fontweight','bold')
ylabel('Cumulative variance','fontweight','bold')
legend('Cumulative variance', '95% threshold')

%barplot of the top9 features and how much they contribute to the PCs
%should have been 10 but the rounding resulted in 9 features
figure('Name', 'Top9 features contributing to first 3 PCs')
bar(1:9, top10_)
hold on
ylabel('Contribution of feature','fontweight','bold')
xticks(1:9)
xtickangle(45)
xticklabels(labels(top10_labels_right))


%anova1 to compare if a feature is significantly different between SCI and
%healthy
%you have to create a matrix containing 2 or more columns, each column is
%data for SCI or healthy, then you enter this matrix into anova1() and it
%will give you a p-value
%example: p =  anova1(data_for_swing_time)

%ANOVA for the step period right
a = Kin_Healthy_NoFloat_Right(:,top10_labels_right(1));
b = Kin_SCI_NoFloat_Right(:,top10_labels_right(1));
n = max(numel(a), numel(b));
a(end+1:n)=NaN; b(end+1:n)=NaN;
p1 = anova1([a,b],[],'off');

%ANOVA for the stance period right
a = Kin_Healthy_NoFloat_Right(:,top10_labels_right(2));
b = Kin_SCI_NoFloat_Right(:,top10_labels_right(2));
n = max(numel(a), numel(b));
a(end+1:n)=NaN; b(end+1:n)=NaN;
p2 = anova1([a,b],[],'off');

%ANOVA for rms LTA 
a = Kin_Healthy_NoFloat_Right(:,69-top10_labels_right(7));
b = Kin_SCI_NoFloat_Right(:,69-top10_labels_right(7));
n = max(numel(a), numel(b));
a(end+1:n)=NaN; b(end+1:n)=NaN;
p3 = anova1([a,b],[],'off');

%boxplot for step period right
figure('Name', 'Anova for step period right')
hold on
title('Step period')
ylabel('Step period [s]','fontweight','bold')
%create matrix with as many 1s and 2s as the length fo the healthy or SCI
%data
group = [ ones(size(Kin_Healthy_NoFloat_Right(:,top10_labels_right(1))));...
        2*ones(size(Kin_SCI_NoFloat_Right(:,top10_labels_right(1))))];
bPlot = boxplot([Kin_Healthy_NoFloat_Right(:,top10_labels_right(1));...
        Kin_SCI_NoFloat_Right(:,top10_labels_right(1))], group, 'symbol','');
text(1,1.5,["p = " p1],'fontweight','bold','fontsize',13)
set(gca, 'XTickLabel', {'Healthy', 'SCI'})
outliers = findobj(bPlot,'Tag','Outliers');
yy = get(outliers,'YData');
hold off

%Boxplot for stance period
figure('Name', 'Anova for stance right')
hold on
title('Stance')
ylabel('Stance [s]','fontweight','bold')
group = [ ones(size(Kin_Healthy_NoFloat_Right(:,top10_labels_right(2))));...
        2*ones(size(Kin_SCI_NoFloat_Right(:,top10_labels_right(2))))];
bPlot = boxplot([Kin_Healthy_NoFloat_Right(:,top10_labels_right(2));...
        Kin_SCI_NoFloat_Right(:,top10_labels_right(2))], group, 'symbol','');
set(gca, 'XTickLabel', {'Healthy', 'SCI'})
outliers = findobj(bPlot,'Tag','Outliers');
yy = get(outliers,'YData');
hold off

%boxplot for rms LTA
figure('Name', 'Anova for rms TA')
hold on
title('rms TA')
ylabel('rms TA [mV]','fontweight','bold')
group = [ ones(size(Param_Healthy_NoFloat_Right(:,69-top10_labels_right(7))));...
        2*ones(size(Param_SCI_NoFloat_Right(:,69-top10_labels_right(7))))];
bPlot = boxplot([Param_Healthy_NoFloat_Right(:,69-top10_labels_right(7));...
        Param_SCI_NoFloat_Right(:,69-top10_labels_right(7))], group, 'symbol','');
set(gca, 'XTickLabel', {'Healthy', 'SCI'})
outliers = findobj(bPlot,'Tag','Outliers');
yy = get(outliers,'YData');
hold off


% code for kmeans
% dataPC = score(:,1:3); 
% figure('Name','kmeans clustering')
% %centroids of clusters
% C = [mean(score(1:80,1:3)); mean(score(81:168,1:3)); ...
%     mean(score(169:190,1:3)); mean(score(191:205,1:3));]
% [clusters, centroid] = kmeans(dataPC,4,'Start',C);
% gscatter(dataPC(:,1),dataPC(:,2),clusters)

%figure of projection onto the first PCs
figure('Name','projection of first two PCs')
scatter(score(HealthyNoFloat,1), score(HealthyNoFloat,2));
hold on
scatter(score(HealthyFloat,1), score(HealthyFloat,2));
%text to label the datapoints of HealthyFloat to see which points come from
%which year
%text(score(HealthyFloat,1), score(HealthyFloat,2),num2str(labels_HP_float_right),'VerticalAlignment','bottom','HorizontalAlignment','right')
scatter(score(SCINoFloat,1), score(SCINoFloat,2));
scatter(score(SCIFloat,1), score(SCIFloat,2));
xlabel('PC1','fontweight','bold')
ylabel('PC2','fontweight','bold')
title('PCA with kinematics & EMG data, segmentation with respect to right foot')
legend('Healthy No Float', 'Healthy Float', 'SCI No Float', 'SCI Float')

%% PCA: segmentation with data segmented with respect to left foot

data = [Kin_Healthy_NoFloat_Left Param_Healthy_NoFloat_Left;...
    Kin_Healthy_Float_Left Param_Healthy_Float_Left;...
    Kin_SCI_NoFloat_Left Param_SCI_NoFloat_Left;...
    Kin_SCI_Float_Left Param_SCI_Float_Left];

%normalize data
data = normalize(data);

% ~ skips any of the outputs --> we don't want t squared
% coeff = PC coeffs, score = matrix containing observations and components
% latent = PC variances --> eigenvalues of covariance matrix of data
% explained = %of total variance explained by each PC
[coeff, score, ~, ~, explained] = pca(data);

% find 10 most important features that contribute to the 3 first PCs
%how much of the variance is explained by the first 3 PCs
percentage_3_PCs = explained(1)+explained(2)+explained(3);
%portion of features out of 10 according to explained varian
features_pc1 = round(10*(explained(1)/percentage_3_PCs),0);
features_pc2 = round(10*(explained(2)/percentage_3_PCs),0);
features_pc3 = round(10*(explained(3)/percentage_3_PCs),0);

top10_loading = [];
top10_features = [];

for i=1:3
    [loading, feature_index] = sort(coeff(:,i),'descend');
    top10_loading = [top10_loading, loading];
    top10_features = [top10_features, feature_index];
end

top10_ = [top10_loading(1:features_pc1,1);...
    top10_loading(1:features_pc2,2); top10_loading(1:features_pc3,3)];
top10_labels_left = [top10_features(1:features_pc1,1);...
    top10_features(1:features_pc2,2); top10_features(1:features_pc3,3)];

HealthyNoFloat = 1:81;
HealthyFloat = 82:160;
SCINoFloat = 161:182;
SCIFloat = 183:198;

figure('Name','PCA: segmentation with respect to left foot')
scatter3(score(HealthyNoFloat,1), score(HealthyNoFloat,2), score(HealthyNoFloat,3));
hold on
scatter3(score(HealthyFloat,1), score(HealthyFloat,2), score(HealthyFloat,3));
scatter3(score(SCINoFloat,1), score(SCINoFloat,2), score(SCINoFloat,3));
scatter3(score(SCIFloat,1), score(SCIFloat,2), score(SCIFloat,3));
xlabel('1st PC','fontweight','bold')
ylabel('2nd PC','fontweight','bold')
zlabel('3rd PC','fontweight','bold')
legend('Healthy No Float', 'Healthy Float', 'SCI No Float', 'SCI Float')
hold off

figure('Name', 'Cumulated variance')
plot(1:length(cumsum(explained)), cumsum(explained), 'r*-')
hold on
line([1,length(cumsum(explained))], [95, 95])
xlabel('PC','fontweight','bold')
ylabel('Cumulative variance','fontweight','bold')
legend('Cumulative variance', '95% threshold')

figure('Name', 'Top10 features contributing to first 3 PCs')
bar(1:length(top10_), top10_)
hold on
ylabel('Contribution of feature','fontweight','bold')
ylim([0 0.4])
xticks(1:length(top10_))
xtickangle(45)
xticklabels(labels(top10_labels_left))


figure('Name','projection of first two PCs')
scatter(score(HealthyNoFloat,1), score(HealthyNoFloat,2));
hold on
scatter(score(HealthyFloat,1), score(HealthyFloat,2));
%text(score(HealthyFloat,1), score(HealthyFloat,2),num2str(labels_HP_float_left),'VerticalAlignment','bottom','HorizontalAlignment','right')
scatter(score(SCINoFloat,1), score(SCINoFloat,2));
scatter(score(SCIFloat,1), score(SCIFloat,2));
xlabel('PC1','fontweight','bold')
ylabel('PC2','fontweight','bold')
title('PCA with kinematics & EMG data, segmentation with respect to left foot')
legend('Healthy No Float', 'Healthy Float', 'SCI No Float', 'SCI Float')


%% PCA: segmentation with 2018 data for Healthy Float, segmentation
%with respect to right foot


data = [Kin_Healthy_NoFloat_Right Param_Healthy_NoFloat_Right;...
    Kin_Healthy_Float_Right(1:48,:) Param_Healthy_Float_Right(1:48,:);...
    Kin_SCI_NoFloat_Right Param_SCI_NoFloat_Right;...
    Kin_SCI_Float_Right Param_SCI_Float_Right];


%normalize data
data = normalize(data);

% ~ skips any of the outputs --> we don't want t squared
% coeff = PC coeffs, score = matrix containing observations and components
% latent = PC variances --> eigenvalues of covariance matrix of data
% explained = %of total variance explained by each PC
[coeff, score, ~, ~, explained] = pca(data);

% find 10 most important features that contribute to the 3 first PCs
percentage_3_PCs = explained(1)+explained(2)+explained(3);
features_pc1 = round(10*(explained(1)/percentage_3_PCs),0);
features_pc2 = round(10*(explained(2)/percentage_3_PCs),0);
features_pc3 = round(10*(explained(3)/percentage_3_PCs),0);

top10_sorted = [];
top10_features = [];

for i=1:3
    [sorted, feature_index] = sort(coeff(:,i),'descend')
    top10_sorted = [top10_sorted, sorted];
    top10_features = [top10_features, feature_index];
end



top10_ = [top10_sorted(1:features_pc1,1);...
    top10_sorted(1:features_pc2,2); top10_sorted(1:features_pc3,3)];
top10_labels_right = [top10_features(1:features_pc1,1);...
    top10_features(1:features_pc2,2); top10_features(1:features_pc3,3)];

HealthyNoFloat = 1:80;
HealthyFloat = 91:128;
SCINoFloat = 129:150;
SCIFloat = 151:165;

figure('Name','PCA: segmentation with respect to right foot')
scatter3(score(HealthyNoFloat,1), score(HealthyNoFloat,2), score(HealthyNoFloat,3));
hold on
scatter3(score(HealthyFloat,1), score(HealthyFloat,2), score(HealthyFloat,3));
scatter3(score(SCINoFloat,1), score(SCINoFloat,2), score(SCINoFloat,3));
scatter3(score(SCIFloat,1), score(SCIFloat,2), score(SCIFloat,3));
xlabel('1st PC')
ylabel('2nd PC')
zlabel('3rd PC')
legend('Healthy No Float', 'Healthy Float', 'SCI No Float', 'SCI Float')
hold off

figure('Name', 'Cumulated variance')
plot(1:length(cumsum(explained)), cumsum(explained), 'r*-')
hold on
%95% line
line([1,length(cumsum(explained))], [90, 90])
xlabel('PC')
ylabel('Cumulative variance')
legend('Cumulative variance', '95% threshold')

figure('Name', 'Top10 features contributing to first 3 PCs')
bar(1:10, top10_)
hold on
ylabel('Contribution of feature')
xticks(1:10)
xtickangle(45)
xticklabels(labels(top10_labels_right))

a = Kin_Healthy_NoFloat_Right(:,top10_labels_right(1));
b = Kin_SCI_NoFloat_Right(:,top10_labels_right(1));
n = max(numel(a), numel(b));
a(end+1:n)=NaN;
b(end+1:n)=NaN;
p1 = anova1([a,b]);


figure('Name','projection of first two PCs, 2018 data')
scatter(score(HealthyNoFloat,1), score(HealthyNoFloat,2));
hold on
scatter(score(HealthyFloat,1), score(HealthyFloat,2));
scatter(score(SCINoFloat,1), score(SCINoFloat,2));
scatter(score(SCIFloat,1), score(SCIFloat,2));
xlabel('PC1','fontweight','bold')
ylabel('PC2','fontweight','bold')
legend('Healthy No Float', 'Healthy Float', 'SCI No Float', 'SCI Float')

%% PCA: segmentation with 2019 data for Healthy Float, segmentation
%with respect to right foot

data = [Kin_Healthy_NoFloat_Right Param_Healthy_NoFloat_Right;...
    Kin_Healthy_Float_Right(49:end,:) Param_Healthy_Float_Right(49:end,:);...
    Kin_SCI_NoFloat_Right Param_SCI_NoFloat_Right;...
    Kin_SCI_Float_Right Param_SCI_Float_Right]; 

%normalize data
data = normalize(data);

% ~ skips any of the outputs --> we don't want t squared
% coeff = PC coeffs, score = matrix containing observations and components
% latent = PC variances --> eigenvalues of covariance matrix of data
% explained = %of total variance explained by each PC
[coeff, score, ~, ~, explained] = pca(data);

% find 10 most important features that contribute to the 3 first PCs
percentage_3_PCs = explained(1)+explained(2)+explained(3);
features_pc1 = round(10*(explained(1)/percentage_3_PCs),0);
features_pc2 = round(10*(explained(2)/percentage_3_PCs),0);
features_pc3 = round(10*(explained(3)/percentage_3_PCs),0);

top10_sorted = [];
top10_features = [];

for i=1:3
    [sorted, feature_index] = sort(coeff(:,i),'descend');
    top10_sorted = [top10_sorted, sorted];
    top10_features = [top10_features, feature_index];
end



top10_ = [top10_sorted(1:features_pc1,1);...
    top10_sorted(1:features_pc2,2); top10_sorted(1:features_pc3,3)];
top10_labels_right = [top10_features(1:features_pc1,1);...
    top10_features(1:features_pc2,2); top10_features(1:features_pc3,3)];

HealthyNoFloat = 1:80;
HealthyFloat = 81:119;
SCINoFloat = 120:141;
SCIFloat = 142:157;

figure('Name','PCA: segmentation with respect to right foot')
scatter3(score(HealthyNoFloat,1), score(HealthyNoFloat,2), score(HealthyNoFloat,3));
hold on
scatter3(score(HealthyFloat,1), score(HealthyFloat,2), score(HealthyFloat,3));
scatter3(score(SCINoFloat,1), score(SCINoFloat,2), score(SCINoFloat,3));
scatter3(score(SCIFloat,1), score(SCIFloat,2), score(SCIFloat,3));
xlabel('1st PC')
ylabel('2nd PC')
zlabel('3rd PC')
legend('Healthy No Float', 'Healthy Float', 'SCI No Float', 'SCI Float')
hold off

figure('Name', 'Cumulated variance')
plot(1:length(cumsum(explained)), cumsum(explained), 'r*-')
hold on
line([1,length(cumsum(explained))], [90, 90])
xlabel('PC')
ylabel('Cumulative variance')
legend('Cumulative variance', '95% threshold')

figure('Name', 'Top10 features contributing to first 3 PCs')
bar(1:10, top10_)
hold on
ylabel('Contribution of feature')
xticks(1:10)
xtickangle(45)
xticklabels(labels(top10_labels_right))



a = Kin_Healthy_NoFloat_Right(:,top10_labels_right(1));
b = Kin_SCI_NoFloat_Right(:,top10_labels_right(1));
n = max(numel(a), numel(b));
a(end+1:n)=NaN;
b(end+1:n)=NaN;
p1 = anova1([a,b]);


figure('Name','projection of first two PCs')
scatter(score(HealthyNoFloat,1), score(HealthyNoFloat,2));
hold on
scatter(score(HealthyFloat,1), score(HealthyFloat,2));
%text(score(HealthyFloat,1), score(HealthyFloat,2),num2str(labels_HP_float_right),'VerticalAlignment','bottom','HorizontalAlignment','right')
scatter(score(SCINoFloat,1), score(SCINoFloat,2));
scatter(score(SCIFloat,1), score(SCIFloat,2));
xlabel('PC1')
ylabel('PC2')
legend('Healthy No Float', 'Healthy Float', 'SCI No Float', 'SCI Float')

%% no EMG data
% segmentation with respect to right foot

data = [Kin_Healthy_NoFloat_Right; Kin_Healthy_Float_Right;...
    Kin_SCI_NoFloat_Right; Kin_SCI_Float_Right]; 

data = normalize(data);

[coeff, score, ~, ~, explained] = pca(data);

% find 10 most important features that contribute to the 3 first PCs
percentage_3_PCs = explained(1)+explained(2)+explained(3);
features_pc1 = round(10*(explained(1)/percentage_3_PCs),0);
features_pc2 = round(10*(explained(2)/percentage_3_PCs),0);
features_pc3 = round(10*(explained(3)/percentage_3_PCs),0);

top10_sorted = [];
top10_features = [];

for i=1:3
    [sorted, feature_index] = sort(coeff(:,i),'descend')
    top10_sorted = [top10_sorted, sorted];
    top10_features = [top10_features, feature_index];
end



top10_ = [top10_sorted(1:features_pc1,1);...
    top10_sorted(1:features_pc2,2); top10_sorted(1:features_pc3,3)];
top10_labels_right = [top10_features(1:features_pc1,1);...
    top10_features(1:features_pc2,2); top10_features(1:features_pc3,3)];

HealthyNoFloat = 1:80;
HealthyFloat = 81:168;
SCINoFloat = 169:190;
SCIFloat = 191:205;

figure('Name','PCA: segmentation with respect to right foot')
scatter3(score(HealthyNoFloat,1), score(HealthyNoFloat,2), score(HealthyNoFloat,3));
hold on
scatter3(score(HealthyFloat,1), score(HealthyFloat,2), score(HealthyFloat,3));
scatter3(score(SCINoFloat,1), score(SCINoFloat,2), score(SCINoFloat,3));
scatter3(score(SCIFloat,1), score(SCIFloat,2), score(SCIFloat,3));
xlabel('1st PC')
ylabel('2nd PC')
zlabel('3rd PC')
legend('Healthy No Float', 'Healthy Float', 'SCI No Float', 'SCI Float')
hold off

figure('Name', 'Cumulated variance')
plot(1:length(cumsum(explained)), cumsum(explained), 'r*-')
hold on
line([1,length(cumsum(explained))], [90, 90])
xlabel('PC')
ylabel('Cumulative variance')
legend('Cumulative variance', '95% threshold')

figure('Name', 'Top10 features contributing to first 3 PCs')
bar(1:9, top10_)
hold on
ylabel('Contribution of feature')
xticks(1:9)
xtickangle(45)
xticklabels(labels(top10_labels_right))


figure('Name','projection of first two PCs')
scatter(score(HealthyNoFloat,1), score(HealthyNoFloat,2));
hold on
scatter(score(HealthyFloat,1), score(HealthyFloat,2));
scatter(score(SCINoFloat,1), score(SCINoFloat,2));
scatter(score(SCIFloat,1), score(SCIFloat,2));
xlabel('PC1','fontweight','bold')
ylabel('PC2','fontweight','bold')
title('no EMG data')
legend('Healthy No Float', 'Healthy Float', 'SCI No Float', 'SCI Float')
