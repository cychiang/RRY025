classdef image_enhancement
    %IMAGE_ENHANCEMENT Local Image Enhancement.
    %   Detailed explanation will be announced
    %   Authors: 
    %       - Chuan-Yen Chiang: cychiang0823(at)gmail(dot)com
    %       - Yu-Han Wei:       ims20591(at)gmail(dot)com 
    
    properties
        rows % rows of input
        cols % cols of input
        area % area of input
        mean % Global mean m = sum[f(x,y)]/MN, x=0~M-1, y=0~N-1
    end
    
    methods
        function enhanced = image_enhancement_from_mat(obj, input)
            [obj.rows, obj.cols] = size(input);
            [obj.area] = [obj.rows] * [obj.cols];
            [obj.mean] = sum(input(:))./ [obj.area];
            enhanced = [obj.mean];  % To be done
        end
    end
    
end

