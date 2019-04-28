%% load the structure containing all parameter matrices for different subjects,...
%different conditions etc

clear all;close all;

load('parametersKin.mat')
load('parametersEMG.mat')
variableNamesEMG = {'duration LMG', 'duration RMG',...
    'duration LTA',  'duration RTA', 'mean LMG','mean RMG',...
    'mean LTA',  'mean RTA', 'max LMG', 'max RMG', 'max LTA', 'max RTA',...
    'rms LMG', 'rms RMG', 'rms LTA', 'rms RTA',...
    'coactivation Left', 'coactivation Right'}

labels = cat(2,variableNames, variableNamesEMG);

load('labels.mat')
% SCIYear = cat(2,labels_SCI_nofloat_right, labels_SCI_nofloat_left,labels_SCI_float_right, labels_SCI_float_left)
% HealthyYear = cat(1,labels_HP_nofloat_right, labels_HP_nofloat_left,labels_HP_float_right, labels_HP_float_left)
% labelsYear = cat(2, SCIYear, HealthyYear')


%% PCA: segmentation with respect to right foot

data = [Kin_Healthy_NoFloat_Right Param_Healthy_NoFloat_Right;...
    Kin_Healthy_Float_Right Param_Healthy_Float_Right;...
    Kin_SCI_NoFloat_Right Param_SCI_NoFloat_Right;...
    Kin_SCI_Float_Right Param_SCI_Float_Right]; %put in all different matrices, separate with ;
%make sure you know indices of the different matrices within data!


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

HealthyNoFloat = 1:93;
HealthyFloat = 94:181;
SCINoFloat = 182:203;
SCIFloat = 204:218;

figure('Name','PCA: segmentation with respect to right foot')
%healthy no float
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


%anova1 to compare if a feature is significantly different between SCI and
%healthy
%you have to create a matrix containing 2 or more columns, each column is
%data for SCI or healthy, then you enter this matrix into anova1() and it
%will give you a p-value
%example: p =  anova1(data_for_swing_time)
a = Kin_Healthy_NoFloat_Right(:,top10_labels_right(1));
b = Kin_SCI_NoFloat_Right(:,top10_labels_right(1));
n = max(numel(a), numel(b));
a(end+1:n)=NaN;
b(end+1:n)=NaN;
p1 = anova1([a,b]);

figure(37)
bar(1:2, [nanmean(Kin_Healthy_NoFloat_Right(:,top10_labels_right(1))),...
    nanmean(Kin_SCI_NoFloat_Right(:,top10_labels_right(1)))])
hold on
ylabel(variableNames(top10_labels_right(1)))
xticks(1:2)
xtickangle(45)
xticklabels({'Healthy No Float', 'SCI No Float'})


%%

% dataPC = score(:,1:10)
% 
% figure('Name','kmeans clustering')
% [clusters, centroid] = kmeans(dataPC,4);
% gscatter(dataPC(:,1),dataPC(:,2),clusters)

figure('Name','projection of first two PCs')
scatter(score(HealthyNoFloat,1), score(HealthyNoFloat,2));
hold on
scatter(score(HealthyFloat,1), score(HealthyFloat,2));
text(score(HealthyFloat,1), score(HealthyFloat,2),num2str(labels_HP_float_right),'VerticalAlignment','bottom','HorizontalAlignment','right')
scatter(score(SCINoFloat,1), score(SCINoFloat,2));
scatter(score(SCIFloat,1), score(SCIFloat,2));
legend('Healthy No Float', 'Healthy Float', 'SCI No Float', 'SCI Float')

% legend('location','southeast')
% xlabel('First Principal Component');
% ylabel('Second Principal Component');
% title('Principal Component Scatter Plot with Colored Clusters');

% 
% 
% a = Param_Healthy_NoFloat_Right(:,top10_labels_right(2));
% b = Param_SCI_NoFloat_Right(:,top10_labels_right(2));
% n = max(numel(a), numel(b));
% a(end+1:n)=NaN;
% b(end+1:n)=NaN;
% p2 = anova1([a,b]);




%% PCA: segmentation with respect to left foot

data = [Kin_Healthy_NoFloat_Left Param_Healthy_NoFloat_Left;...
    Kin_Healthy_Float_Left Param_Healthy_Float_Left;...
    Kin_SCI_NoFloat_Left Param_SCI_NoFloat_Left;...
    Kin_SCI_Float_Left Param_SCI_Float_Left];

 %put in all different matrices, separate with ;
%make sure you know indices of the different matrices within data!

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


%indeces of each "submatrix" that is put into the PCA function
HealthyNoFloat = 1:92;
HealthyFloat = 93:171;
SCINoFloat = 172:193;
SCIFloat = 194:209;

figure('Name','PCA: segmentation with respect to left foot')
%healthy no float
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
line([1,length(cumsum(explained))], [95, 95])
xlabel('PC')
ylabel('Cumulative variance')
legend('Cumulative variance', '95% threshold')

figure('Name', 'Top10 features contributing to first 3 PCs')
bar(1:length(top10_), top10_)
hold on
ylabel('Loading of feature')
xticks(1:length(top10_))
xtickangle(45)
xticklabels(labels(top10_labels_left))



%%
data = [Kin_Healthy_NoFloat_Right Param_Healthy_NoFloat_Right;...
    Kin_SCI_NoFloat_Right Param_SCI_NoFloat_Right;...
    Kin_SCI_Float_Right Param_SCI_Float_Right]; %put in all different matrices, separate with ;
%make sure you know indices of the different matrices within data!


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

HealthyNoFloat = 1:93;
SCINoFloat = 94:115;
SCIFloat = 116:130;

% figure('Name','PCA: segmentation with respect to right foot')
% %healthy no float
% scatter3(score(HealthyNoFloat,1), score(HealthyNoFloat,2), score(HealthyNoFloat,3));
% hold on
% scatter3(score(SCINoFloat,1), score(SCINoFloat,2), score(SCINoFloat,3));
% scatter3(score(SCIFloat,1), score(SCIFloat,2), score(SCIFloat,3));
% xlabel('1st PC')
% ylabel('2nd PC')
% zlabel('3rd PC')
% legend('Healthy No Float', 'SCI No Float', 'SCI Float')
% hold off
% 
% figure('Name', 'Cumulated variance')
% plot(1:length(cumsum(explained)), cumsum(explained), 'r*-')
% hold on
% %95% line
% line([1,length(cumsum(explained))], [90, 90])
% xlabel('PC')
% ylabel('Cumulative variance')
% legend('Cumulative variance', '95% threshold')
% 
% figure('Name', 'Top10 features contributing to first 3 PCs')
% bar(1:10, top10_)
% hold on
% ylabel('Contribution of feature')
% xticks(1:10)
% xtickangle(45)
% xticklabels(labels(top10_labels_right))

%dataPC = score

figure('Name','kmeans clustering')
%[clusters, centroid] = kmeans(dataPC,3);
gscatter(dataPC(:,1),dataPC(:,2),clusters)
legend('SCI Float', 'Healthy No Float','SCI No Float')

figure('Name','projection of PC1 and PC2')
scatter(score(HealthyNoFloat,1), score(HealthyNoFloat,2));
hold on
scatter(score(SCINoFloat,1), score(SCINoFloat,2));
scatter(score(SCIFloat,1), score(SCIFloat,2));
xlabel('PC1')
ylabel('PC2')
legend('Healthy No Float', 'SCI No Float', 'SCI Float')

% 
% figure('Name','projection of PC1 and PC3')
% scatter(score(HealthyNoFloat,1), score(HealthyNoFloat,3));
% hold on
% scatter(score(SCINoFloat,1), score(SCINoFloat,3));
% scatter(score(SCIFloat,1), score(SCIFloat,3));
% xlabel('PC1')
% ylabel('PC3')
% legend('Healthy No Float', 'SCI No Float', 'SCI Float')
% 
% figure('Name','projection of PC2 and PC3')
% scatter(score(HealthyNoFloat,2), score(HealthyNoFloat,3));
% hold on
% scatter(score(SCINoFloat,2), score(SCINoFloat,3));
% scatter(score(SCIFloat,2), score(SCIFloat,3));
% xlabel('PC2')
% ylabel('PC3')
% legend('Healthy No Float', 'SCI No Float', 'SCI Float')
% 
%% PCA: segmentation with respect to right foot

%2018 data

data = [Kin_Healthy_NoFloat_Right Param_Healthy_NoFloat_Right;...
    Kin_Healthy_Float_Right(1:48,:) Param_Healthy_Float_Right(1:48,:);...
    Kin_SCI_NoFloat_Right Param_SCI_NoFloat_Right;...
    Kin_SCI_Float_Right Param_SCI_Float_Right]; %put in all different matrices, separate with ;
%make sure you know indices of the different matrices within data!


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

HealthyNoFloat = 1:93;
HealthyFloat = 94:141;
SCINoFloat = 142:163;
SCIFloat = 164:178;

figure('Name','PCA: segmentation with respect to right foot')
%healthy no float
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
bar(1:9, top10_)
hold on
ylabel('Contribution of feature')
xticks(1:9)
xtickangle(45)
xticklabels(labels(top10_labels_right))


%anova1 to compare if a feature is significantly different between SCI and
%healthy
%you have to create a matrix containing 2 or more columns, each column is
%data for SCI or healthy, then you enter this matrix into anova1() and it
%will give you a p-value
%example: p =  anova1(data_for_swing_time)
a = Kin_Healthy_NoFloat_Right(:,top10_labels_right(1));
b = Kin_SCI_NoFloat_Right(:,top10_labels_right(1));
n = max(numel(a), numel(b));
a(end+1:n)=NaN;
b(end+1:n)=NaN;
p1 = anova1([a,b]);

figure(37)
bar(1:2, [nanmean(Kin_Healthy_NoFloat_Right(:,top10_labels_right(1))),...
    nanmean(Kin_SCI_NoFloat_Right(:,top10_labels_right(1)))])
hold on
ylabel(variableNames(top10_labels_right(1)))
xticks(1:2)
xtickangle(45)
xticklabels({'Healthy No Float', 'SCI No Float'})

dataPC = score(:,1:21)

figure('Name','kmeans clustering')
[clusters, centroid] = kmeans(dataPC,4);
gscatter(dataPC(:,1),dataPC(:,2),clusters)

figure('Name','projection of first two PCs')
scatter(score(HealthyNoFloat,1), score(HealthyNoFloat,2));
hold on
scatter(score(HealthyFloat,1), score(HealthyFloat,2));
%text(score(HealthyFloat,1), score(HealthyFloat,2),num2str(labels_HP_float_right),'VerticalAlignment','bottom','HorizontalAlignment','right')
scatter(score(SCINoFloat,1), score(SCINoFloat,2));
scatter(score(SCIFloat,1), score(SCIFloat,2));
legend('Healthy No Float', 'Healthy Float', 'SCI No Float', 'SCI Float')

%% PCA: segmentation with respect to right foot

%2019 data

data = [Kin_Healthy_NoFloat_Right Param_Healthy_NoFloat_Right;...
    Kin_Healthy_Float_Right(48:end,:) Param_Healthy_Float_Right(48:end,:);...
    Kin_SCI_NoFloat_Right Param_SCI_NoFloat_Right;...
    Kin_SCI_Float_Right Param_SCI_Float_Right]; %put in all different matrices, separate with ;
%make sure you know indices of the different matrices within data!


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

HealthyNoFloat = 1:93;
HealthyFloat = 94:134;
SCINoFloat = 135:153;
SCIFloat = 154:168;

figure('Name','PCA: segmentation with respect to right foot')
%healthy no float
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


%anova1 to compare if a feature is significantly different between SCI and
%healthy
%you have to create a matrix containing 2 or more columns, each column is
%data for SCI or healthy, then you enter this matrix into anova1() and it
%will give you a p-value
%example: p =  anova1(data_for_swing_time)
a = Kin_Healthy_NoFloat_Right(:,top10_labels_right(1));
b = Kin_SCI_NoFloat_Right(:,top10_labels_right(1));
n = max(numel(a), numel(b));
a(end+1:n)=NaN;
b(end+1:n)=NaN;
p1 = anova1([a,b]);

figure(37)
bar(1:2, [nanmean(Kin_Healthy_NoFloat_Right(:,top10_labels_right(1))),...
    nanmean(Kin_SCI_NoFloat_Right(:,top10_labels_right(1)))])
hold on
ylabel(variableNames(top10_labels_right(1)))
xticks(1:2)
xtickangle(45)
xticklabels({'Healthy No Float', 'SCI No Float'})

dataPC = score(:,1:21)

figure('Name','kmeans clustering')
[clusters, centroid] = kmeans(dataPC,4);
gscatter(dataPC(:,1),dataPC(:,2),clusters)

figure('Name','projection of first two PCs')
scatter(score(HealthyNoFloat,1), score(HealthyNoFloat,2));
hold on
scatter(score(HealthyFloat,1), score(HealthyFloat,2));
%text(score(HealthyFloat,1), score(HealthyFloat,2),num2str(labels_HP_float_right),'VerticalAlignment','bottom','HorizontalAlignment','right')
scatter(score(SCINoFloat,1), score(SCINoFloat,2));
scatter(score(SCIFloat,1), score(SCIFloat,2));
legend('Healthy No Float', 'Healthy Float', 'SCI No Float', 'SCI Float')
