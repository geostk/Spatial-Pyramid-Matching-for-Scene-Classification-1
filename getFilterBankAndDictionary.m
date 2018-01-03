function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

    filterBank  = createFilterBank();

    % TODO Implement your code here

    k=200;
    a=100;
    filtersize=length(filterBank)*3;
    for i=1:5
    %for i=1:size(imPaths)
        imgpath{i}=char(strcat(['../data/'],imPaths{i}));
        imag{i}=imread(imgpath{i});
        imaglab{i}=RGB2Lab(imag{i});
        for j=1:20
            filterResponses=extractFilterResponses(imaglab{i},filterBank{j});
        end
    end
    
%    filterResponse=extractFilterResponse(imPaths,filterBank);
    for i=1:5
    %for i=1:length(imPaths{:})
        img=imread(imgpath{i});
        nrows=size(img,1);
        ncols=size(img,2);
        img=reshape(img,nrows*ncols,2);
        elements=numel(img(:,:,1));
        ind=randperm(elements,a);
        filterResponses = reshape(filterResponses, size(filterResponses,1)*size(filterResponses, 2), size(filterResponses,3));
        testimage(:,:,i) = filterResponses(randperm(size(filterResponses,1), a), :);
        
    end
    filterResponsesf = reshape(testimage, size(testimage,1)*size(testimage,3), size(testimage,2));
    [~, dictionary] = kmeans(filterResponsesf, K, 'EmptyAction', 'drop');
end
