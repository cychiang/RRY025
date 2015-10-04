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
for mask = 3:2:9
    fileName = sprintf('reports/mask_%d.csv', mask);
    disp(fileName);
    id = 0;
    for e = 2:8
        % k0 from 0.1 ~ 1 with step 0.1
        for k0 = 0.1 : 0.2 : 1
            % k1 from 0.01 ~ 0.1 with step 0.01
            for k1 = 0.01 : 0.02 : 0.1
                % k2 from 0.1 ~ 1 with step 0.1
                for k2 = 0.1 : 0.2 : 1
                    id = id + 1;
                    out = [e, k0, k1, k2, id];
                    % print message
                    disp(id);
                    disp(data);
                    disp(fileName);
                    disp(imageName);
                    % process image.
                    imageName = sprintf('results/mask_%d/%d.jpg', mask, id);
                    image = image_enhancement2(image, e, k0, k1, k2, mask);
                    % write to csv file.
                    dlmwrite (fileName, data, '-append');
                    % write image to folder
                    imwrite(image, imageName, 'jpg');
                end
            end
        end
    end
end