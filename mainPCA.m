%% load the structure containing all parameter matrices for different subjects,...
%different conditions etc

%% PCA: segmentation with respect to left foot

data = []; %put in all different matrices, separate with ;
%make sure you know indices of the different matrices within data!

% ~ skips any of the outputs --> we don't want t squared
% coeff = PC coeffs, score = matrix containing observations and components
% latent = PC variances --> eigenvalues of covariance matrix of data
% explained = %of total variance explained by each PC
[coeff, score, latent, ~, explained] = pca(data);

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
line([1,length(cumsum(explained)], [0.95, 0.95])
xlabel('PC')
ylabel('Cumulative variance')
legend('Cumulative variance', '95% threshold')
%% PCA: segmentation with respect to right foot

%% PCA: taking the average of the two legs