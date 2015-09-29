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
        elem_constract
    end
    
    methods
        function enhanced = local_image_enhancement(obj, input, constant, threshold)
            [obj.rows, obj.cols] = size(input);
            [obj.mean] = mean2(input);
            [obj.variance] = std2(input);
            [obj.ehancement_constant] = constant;
            [obj.k0, obj.k1, obj.k2] = threshold(:);
            enhanced = [obj.mean];  % To be done
        end
    end
end

