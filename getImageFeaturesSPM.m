function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)

    % TODO Implement your code here
histindex = 0;
    tempo_hist = zeros(2 ^ (layerNum-1), 2 ^ (layerNum-1));
    for l = layerNum-1 : -1 : 0
        no_cells = 2 ^ l;
        cellsize = floor(size(wordMap) / no_cells);
        for i = 1 : no_cells
            for j = 1 : no_cells
                histindex = histindex + 1;
                if l == layerNum-1
                    cell = wordMap(((i-1)*cellsize(1)+1) : (i*cellsize(1)), ((j-1)*cellsize(2)+1) : (j*cellsize(2)));
                    h(histindex, :) = getImageFeatures(cell, dictionarySize) / 2;
                else
                    h(histindex, :) = h(tempo_hist(i*2-1, j*2-1), :) + h(tempo_hist(i*2, j*2-1), :) + h(tempo_hist(i*2-1, j*2), :) + h(tempo_hist(i*2, j*2), :);
                    if l ~= 0
                        h(histindex, :) = h(histindex, :) / 2;
                    end
                end
                tempo_hist(i, j) = histindex;
            end
        end
    end
    h = h(:) / sum(h(:));
end