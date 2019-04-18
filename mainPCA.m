%% load the structure containing all parameter matrices for different subjects,...
%different conditions etc

%% PCA: segmentation with respect to left foot

data = []; %put in all different matrices, separate with ;
%make sure you know indices of the different matrices within data!

%normalize data
data = zscore(data);

% ~ skips any of the outputs --> we don't want t squared
% coeff = PC coeffs, score = matrix containing observations and components
% latent = PC variances --> eigenvalues of covariance matrix of data
% explained = %of total variance explained by each PC
[coeff, score, latent, ~, explained] = pca(data);

% find 10 most important features that contribute to the 3 first PCs
percentage_3_PCs = sum(explained(1:3));
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

top10_features = [top10_loading(1:features_pc1,1);...
    top10_loading(1:features_pc2,2); top10_loading(1:features_pc3,3)];



%vizualize the data representation in the space of the first 3 PCs
scatter3(score(:,1), score(:,2), score(:,3));
axis equal;
xlabel('1st PC')
ylabel('2nd PC')
zlabel('3rd PC')

HealthyNoFloat = %indeces for healthy no float data in matrix;
HealthyFloat = %indeces for healthy float;
SCINoFloat = %indeces for SCI no float;
SCIFloat = %indeces for SCI float;

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
legend('Healthy no Float', 'Healthy Float', 'SCI no Float', 'SCI Float')
hold off

figure('Name', 'Cumulated variance')
plot(1:length(cumsum(explained)), cumsum(explained))
hold on
%95% line
line([1,length(cumsum(explained))], [0.95, 0.95])
xlabel('PC')
ylabel('Cumulative variance')
legend('Cumulative variance', '95% threshold')

figure('Name', 'Top10 features contributing to first 3 PCs')
bar(1:10, top10_features)
ylabel('Loading of feature')

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

%% PCA: segmentation with respect to right foot

%% PCA: taking the average of the two legs