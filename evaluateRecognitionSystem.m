function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	load('../data/traintest.mat');

	% TODO Implement your code here
conf = zeros(length(mapping),length(mapping));

    trainlen = length(test_imagenames);

    for i = 1 : trainlen
        testnames = ['../data/', test_imagenames{i, 1}];
        guess_image = find(strcmp(guessImage(testnames), mapping));
        conf(test_labels(i), guess_image) = conf(test_labels(i), guess_image) + 1;
    end
    fprintf('Accuracy = %0.2f%%\n', 100 * trace(conf) / sum(conf(:)));
end