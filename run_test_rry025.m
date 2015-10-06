% Figure out how parameter works.
% testing on different parameter and store the results.

% mat = load('forest.mat');
% image = mat.forestgray;
% e = 4;
% k0 = 0.4;
% k1 = 0.02;
% k2 = 0.4;
% mask = 7;
% out = image_enhancement2(image, e, k0, k1, k2, mask);
% figure, imshow(out);

% Run script for generate result.
id = 0;
mat = load('forest.mat');
image = mat.forestgray;
% New method apply.
% Get global mean and global variance.
global_mean = mean2(image);
global_variance = std2(image);
% mask = [3 3];
% k = [0.4 0.02 0.4];
% enhancement_constant = 4;
% en_image = colfilt(image, mask, 'sliding', @local_image_enhancement, ...
%     global_mean, global_variance, enhancement_constant, k);

% out_image = im2uint8(mat2gray(en_image));

% figure, imshow(out_image);
% For loop to generate results.
% mask size
tic
for mask_size = 7:2:9
    % Initial csv file string.
    fileName = sprintf('reports/mask_%d.csv', mask_size);
    mask = [mask_size mask_size];
    id = 0;
    % enhancement constant
    for e = 2:8
        % k0 from 0.1 ~ 1 with step 0.1
        for k0 = 0.1 : 0.2 : 1
            % k1 from 0.01 ~ 0.1 with step 0.01
            for k1 = 0.01 : 0.02 : 0.1
                % k2 from 0.1 ~ 1 with step 0.1
                for k2 = 0.1 : 0.2 : 1
                    id = id + 1;
                    data = [e, k0, k1, k2, id];
                    k = [k0 k1 k2];
                    en_image = colfilt(image, mask, 'sliding', ... 
                        @local_image_enhancement, ...
                        global_mean, global_variance, e, k);
                    out_image = im2uint8(mat2gray(en_image));
                    % Initial image file name.
                    imageName = sprintf('results/mask_%d/%d.jpg', mask_size, id);
                    % Write data and file to disk.
                    dlmwrite (fileName, data, '-append');
                    imwrite(out_image, imageName, 'jpg');
                end
            end
        end
    end        
end
time_cost = toc %display time-consuming

% legacy script.
% for mask = 3:2:9
%     fileName = sprintf('reports/mask_%d.csv', mask);
%     disp(fileName);
%     id = 0;
%     for e = 2:8
%         % k0 from 0.1 ~ 1 with step 0.1
%         for k0 = 0.1 : 0.2 : 1
%             % k1 from 0.01 ~ 0.1 with step 0.01
%             for k1 = 0.01 : 0.02 : 0.1
%                 % k2 from 0.1 ~ 1 with step 0.1
%                 for k2 = 0.1 : 0.2 : 1
%                     id = id + 1;
%                     data = [e, k0, k1, k2, id];
%                     % process image.
%                     image = image_enhancement2(image, e, k0, k1, k2, mask);
%                     % print message
%                     disp(id);
%                     disp(data);
%                     imageName = sprintf('results/mask_%d/%d.jpg', mask, id);
%                     disp(imageName);
%                     % write to csv file.
%                     dlmwrite (fileName, data, '-append');
%                     % write image to folder
%                     imwrite(image, imageName, 'jpg');
%                 end
%             end
%         end
%     end
% end