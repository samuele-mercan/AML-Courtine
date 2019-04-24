%% load the structure containing all parameter matrices for different subjects,...
%different conditions etc

clear all;close all;

load('parametersKin.mat')


%% PCA: segmentation with respect to right foot

data = [Param_Healthy_NoFloat_Right;Param_Healthy_Float_Right;...
    Param_SCI_NoFloat_Right;Param_SCI_Float_Right]; %put in all different matrices, separate with ;
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

HealthyNoFloat = 1:101;
HealthyFloat = 102:202;
SCINoFloat = 203:224;
SCIFloat = 225:239;

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
line([1,length(cumsum(explained))], [95, 95])
xlabel('PC')
ylabel('Cumulative variance')
legend('Cumulative variance', '95% threshold')

figure('Name', 'Top10 features contributing to first 3 PCs')
bar(1:10, top10_)
hold on
ylabel('Contribution of feature')
xticks(1:10)
xtickangle(45)
xticklabels(variableNames(top10_labels_right))


%anova1 to compare if a feature is significantly different between SCI and
%healthy
%you have to create a matrix containing 2 or more columns, each column is
%data for SCI or healthy, then you enter this matrix into anova1() and it
%will give you a p-value
%example: p =  anova1(data_for_swing_time)
a = Param_Healthy_NoFloat_Right(:,top10_labels_right(1));
b = Param_SCI_NoFloat_Right(:,top10_labels_right(1));
n = max(numel(a), numel(b));
a(end+1:n)=NaN;
b(end+1:n)=NaN;
p1 = anova1([a,b]);

figure(37)
bar(1:2, [nanmean(Param_Healthy_NoFloat_Right(:,top10_labels_right(1))),...
    nanmean(Param_SCI_NoFloat_Right(:,top10_labels_right(1)))])
hold on
ylabel(variableNames(top10_labels_right(1)))
xticks(1:2)
xtickangle(45)
xticklabels({'Healthy No Float', 'SCI No Float'})


a = Param_Healthy_NoFloat_Right(:,top10_labels_right(2));
b = Param_SCI_NoFloat_Right(:,top10_labels_right(2));
n = max(numel(a), numel(b));
a(end+1:n)=NaN;
b(end+1:n)=NaN;
p2 = anova1([a,b]);




%% PCA: segmentation with respect to left foot

data = [Param_Healthy_NoFloat_Left;Param_Healthy_Float_Left;...
    Param_SCI_NoFloat_Left;Param_SCI_Float_Left]; %put in all different matrices, separate with ;
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
HealthyNoFloat = 1:100;
HealthyFloat = 101:189;
SCINoFloat = 190:211;
SCIFloat = 212:227;

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
bar(1:10, top10_)
hold on
ylabel('Loading of feature')
xticks(1:10)
xtickangle(45)
xticklabels(variableNames(top10_labels_left))

% % kmeans into 4 clusters
% idx4 = kmeans(score(1:2,:),4);
% T4 = ones(1, length(idx4))
% [Acc4,rand_index4,match4]=AccMeasure(T4,idx4)

% % kmeans into 8 clusters
% idx8 = kmeans(score(1:2,:),8);
% T8 = ones(1, length(idx8))
% [Acc8,rand_index8,match8]=AccMeasure(T8,idx8)

%anova1 to compare if a feature is significantly different between SCI and
%healthy
%you have to create a matrix containing 2 or more columns, each column is
%data for SCI or healthy, then you enter this matrix into anova1() and it
%will give you a p-value
%example: p =  anova1(data_for_swing_time)

