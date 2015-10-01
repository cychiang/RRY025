function [ out_image ] = image_enhancement2( input_image, constant, ...
                k0, k1, k2, mask )
%   Local Image Enhancement:
%       - based on local mean and variance.
%   Authors: 
%       - Chuan-Yen Chiang: cychiang0823(at)gmail(dot)com
%       - Yu-Han Wei:       ims20591(at)gmail(dot)com 
%     input_image = histeq(input_image);
    [rows, cols] = size(input_image);     % Get size from input
    mean = mean2(input_image);            % Global mean
    variance = std2(input_image);         % Global variance
    mask_step = ( mask-1 ) / 2;
    out_image = input_image;
    image = padarray(input_image, [1, 1], 'both');
    for row = 1 + mask_step : rows + 2 - mask_step
        for col = 1 + mask_step : cols + 2 - mask_step
            % create mask and it should be odd number
            sub_image = image(row - mask_step : row + mask_step, ...
                col - mask_step : col + mask_step);
            % local mean
            local_mean = mean2(sub_image);
            % different elements in a mask
            different_elements = unique(sub_image);
            % probability of different elements in a mask
            probabilities = histcounts(sub_image, ... 
                numel(different_elements)) ./ (numel(sub_image));
            % Ds=sqrt(Vs), local variance Vs = sum[(r(i)-Ms)^2*p(r(i))], i=0~L-1
            Ds = sqrt(sum((different_elements' - local_mean) ...
                .^2.*probabilities));
            % 
            if local_mean <= k0 * mean && ...
                    Ds >= k1 * variance && ...
                    Ds <= k2 * variance
                out_image(row - mask_step, col - mask_step) = constant ...
                    * image(row, col);
            end
        end
    end
end

