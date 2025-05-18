clc; clear; close all;

% Step 1: Load Dataset
dataset = readtable('crop_data.csv');  % Ensure this file is in the working directory

% Extract Features (Temperature, Humidity, Soil Moisture) and Labels (Crop)
X = dataset{:, 1:3};  % Features
y = categorical(dataset.Crop);  % Target Labels (Crop Names)

% Check Class Balance
summary(y)  % Display class counts

% Step 2: Data Preprocessing - Standardize Features
X_mean = mean(X);
X_std = std(X);
X_norm = (X - X_mean) ./ X_std;  % Standardization

% Step 3: Train Optimized Ensemble Model (Bootstrap Aggregation or LogitBoost)
ensembleModel = fitcensemble(X_norm, y, ...
    'Method', 'Bag', ...  % Alternative to RUSBoost to prevent pseudo-loss issues
    'NumLearningCycles', 200, ...  % Increase number of trees
    'Learners', templateTree('MaxNumSplits', 30, 'MinLeafSize', 2));  % Optimize tree depth

% Step 4: Perform Cross-Validation for Higher Accuracy
cv = cvpartition(y, 'KFold', 10);  % Stratified K-Fold
cvEnsemble = crossval(ensembleModel, 'CVPartition', cv);
ensembleAccuracy = 1 - kfoldLoss(cvEnsemble);  % Calculate accuracy

% Step 5: Get Real-Time Data from ThingSpeak
channelID = 2852860;   % Replace with your ThingSpeak Channel ID
readAPIKey = 'E3Q9APCOO7HWAC98'; 

data = thingSpeakRead(channelID, 'Fields', [1 2 3], 'NumPoints', 1, 'ReadKey', readAPIKey);

% Extract sensor values and normalize based on dataset statistics
temperature = data(1);
humidity = data(2);
soilMoisture = (data(3) / 4095) * 100;  % Normalize soil moisture
inputData = ( [temperature, humidity, soilMoisture] - X_mean ) ./ X_std;  % Normalize

% Step 6: Predict Suitable Crop Based on Real-Time Data
predictedCrop = predict(ensembleModel, inputData);

% Display the Results
fprintf('Sensor Readings:\n');
fprintf('Temperature: %.2f°C\n', temperature);
fprintf('Humidity: %.2f%%\n', humidity);
fprintf('Soil Moisture: %.2f%%\n', soilMoisture);
fprintf('Predicted Suitable Crop: %s\n', predictedCrop);
fprintf('Optimized Model Accuracy: %.2f%%\n', ensembleAccuracy * 100);
