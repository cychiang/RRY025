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
                threshold, mask)
            [obj.rows, obj.cols] = size(input);
            [obj.mean] = mean2(input);
            [obj.variance] = std2(input);
            [obj.ehancement_constant] = constant;
            [obj.k0, obj.k1, obj.k2] = threshold(:);
            [obj.mask] = (mask - 1) / 2;
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
                    
                end 
            end
            % 
            enhanced = [obj.image];
        end
    end
end

