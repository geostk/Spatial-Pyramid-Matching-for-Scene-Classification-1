function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('dictionary.mat');
	load('../data/traintest.mat');

	% TODO create train_features
imglen = length(train_imagenames);
           
    for i = 1:imglen
        train_labelss{i} = mapping(train_labels(i));        
        wordMapp = load(char(strcat('../data/', strrep(train_imagenames(i, 1), '.jpg', '.mat'))));
        train_features(:, i) = getImageFeaturesSPM(3, wordMapp.wordMap, size(dictionary, 1));
    end
    

	save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');
train_labels(1)
end