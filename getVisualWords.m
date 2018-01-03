function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here
%load('dictionary.mat');
%img=imread('sun.jpg');
%filterBank = createFilterBank();
imgfilter=extractFilterResponses(img,filterBank);
imgfil=reshape(imgfilter, size(imgfilter,1)*size(imgfilter,2),size(imgfilter,3));
[d,i]=pdist2(dictionary,imgfil,'euclidean','Smallest',1);
wordMap=reshape(i,size(img,1),size(img,2));

figure, imagesc(wordMap)



%mindist=min(d);

%for i = 1:length(mindist)
 %   wordMap(i) = find(d(:,i) == mindist(i));
%end

%wordMap=reshape(wordMap,size(img,1),size(img,2));
%imagesc(wordMap)
%batchToVisualWords();
end
