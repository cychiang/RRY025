function out_image = local_image_enhancement(input_image, ...
    global_mean, global_variance, enhancement_constant, k)
    % cause the input_image we got is 1-D array so
    % this line is inorder to get the center pixel in the array.
    center = floor((size(input_image,1)+1)/2);
    % cause we only change the central value of the mask.
    out_image = input_image(center,:);
    % calculate local mean and local variance.
    local_mean = mean(input_image);
    local_variance = std(input_image);
    % decide do enhance or not.
    response = find((local_mean <= k(1) * global_mean) & ... 
        (local_variance >= k(2) * global_variance) & ...
        (local_variance <= k(3) * global_variance));
    out_image(response) = enhancement_constant * input_image(center, response);
end