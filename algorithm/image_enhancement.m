classdef image_enhancement
    %IMAGE_ENHANCEMENT Local Image Enhancement.
    %   Detailed explanation will be announced
    %   Authors: 
    %       - Chuan-Yen Chiang: cychiang0823(at)gmail(dot)com
    %       - Yu-Han Wei:       ims20591(at)gmail(dot)com 
    
    properties
        rows % rows of inputs
        cols % cols of inputs
        mean % Global mean m = sum[f(x,y)]/MN, x=0~M-1, y=0~N-1
    end
    
    methods (Static)
        function enhanced = image_enhancement_from_mat(input)
            mean = sum(input(:))
            
        end
    end
    
end

