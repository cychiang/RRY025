% Authors: Chuan-Yen Chiang, 
%          Yu-Han Wei

% Figure out how parameter works.
% testing on different parameter and store the results.

% Run script for generate result.
id = 0;
mat = load('forest.mat');
image = mat.forestgray;
% Initial parameters
e = 4;
k = [0.4 0.02 0.4];
% New method apply.
% Get global mean and global variance.
global_mean = mean2(image);
global_variance = std2(image);
% Run algorithm
en_image = colfilt(image, [3 3], 'sliding', ... 
    @local_image_enhancement, ...
    global_mean, global_variance, e, k);
% Show Image
figure, imshow(en_image);
% For loop to generate results.
% mask size
% for mask_size = 3:2:9
    % Initial csv file string.
%     mask = [mask_size mask_size];
    % enhancement constant
%     for e = 2:8
        % k0 from 0.1 ~ 1 with step 0.1
%         for k0 = 0.1 : 0.2 : 1
            % k1 from 0.01 ~ 0.1 with step 0.01
%             for k1 = 0.01 : 0.02 : 0.1
                % k2 from 0.1 ~ 1 with step 0.1
%                 for k2 = 0.1 : 0.2 : 1
%                     data = [e, k0, k1, k2, id];
%                     k = [k0 k1 k2];
%                     en_image = colfilt(image, mask, 'sliding', ... 
%                         @local_image_enhancement, ...
%                         global_mean, global_variance, e, k);
%                 end
%             end
%         end
%     end        
% end