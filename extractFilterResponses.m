function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses


% TODO Implement your code here
%img=imread('sun.jpg');
filterBank = createFilterBank();
imglab=RGB2Lab(im2double(img));
k=0;
for i=1:20
    for j=1:3
        k=k+1;
        filterResponses(:,:,k)=imfilter(imglab(:,:,j),filterBank{i});
    end
end
%montage(cat(4,filterResponses{:}),'Size', [4 5]);
end
