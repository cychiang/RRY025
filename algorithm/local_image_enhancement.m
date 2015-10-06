function out_image = local_image_enhancement(input_image, ...
    global_mean, global_variance, enhancement_constant, k)
    % trans 2D into 1D
    center = floor((size(input_image,1)+1)/2);
    % cause we only care about the central part of mask.
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