% Figure out how parameter works.
% testing on different parameter and store the results.

mat = load('forest.mat');
image = mat.forestgray;
e = 4;
k0 = 0.4;
k1 = 0.02;
k2 = 0.4;
mask = 7;
out = image_enhancement2(image, e, k0, k1, k2, mask);
figure, imshow(out);