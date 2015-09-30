classdef image_enhancement
    %IMAGE_ENHANCEMENT Local Image Enhancement.
    %   Detailed explanation will be announced
    %   Authors: 
    %       - Chuan-Yen Chiang: cychiang0823(at)gmail(dot)com
    %       - Yu-Han Wei:       ims20591(at)gmail(dot)com 
    
    properties
        rows        % rows of input
        cols        % cols of input
        area        % area of input
        mean        % Global mean
        variance    % Global variance
        ehancement_constant
                    % Ehancement constant
        k0          % k0, mean threshold
        k1          % k1, variance threshold
        k2          % k2, variance threshold
        mask        % mask for local image enhancement
        image       % Zero padding from input image
        sub_image   % Sub Image with 3x3 mask
    end
    
    methods
        function enhanced = local_image_enhancement(obj, input, constant, ...
                k0, k1, k2, mask)
            [obj.rows, obj.cols] = size(input);
            [obj.mean] = mean2(input);
            [obj.variance] = std2(input);
            [obj.ehancement_constant] = constant;
            [obj.k0] = k0;
            [obj.k1] = k1;
            [obj.k2] = k2;
            [obj.mask] = (mask - 1) / 2;
            enhanced = zeros(obj.rows, obj.cols);
            % Zero Padding
            [obj.image] = padarray(input, [1, 1], 'both');
            % Main Loop
            for row = 2 : obj.rows + 1
                for col = 2 : obj.cols + 1
                    % mask should be odd number
                    [obj.sub_image] = ... 
                        obj.image(row - obj.mask:row + obj.mask, ...
                        col - obj.mask:col + obj.mask);
                    % local mean
                    local_mean = mean2(obj.sub_image);
                    % different elements in a mask
                    different_elements = unique([obj.sub_image]);
                    % probability of different elements in a mask
                    probabilities = histcounts([obj.sub_image], ... 
                        numel(different_elements)) ./ (numel([obj.sub_image]));
                    % Ds=sqrt(Vs), local variance Vs = sum[(r(i)-Ms)^2*p(r(i))], i=0~L-1
                    Ds = sqrt(sum((different_elements' - local_mean) ...
                        .^2.*probabilities));
                    % 
                    if local_mean <= [obj.k0] * [obj.mean] && ...
                            Ds >= [obj.k1] * [obj.variance] && ...
                            Ds <= [obj.k2] * [obj.variance]
                        
                        enhanced(row - 1, col - 1) = obj.ehancement_constant * ...
                            obj.image(row, col);
                    end
                end 
            end
        end
    end
end

