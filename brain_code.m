% Step 1: Load the original image
imagePath = 'C:\Users\Sony helen\Documents\Matlab_program\Brain_Tumor\Brain_Tumor_Code\Malignant\4Perfect.jpg';  % Path to your JPEG image
originalImage = imread(imagePath);  % Read the image

% Step 2: Convert to grayscale (if necessary)
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);  % Convert to grayscale if RGB
else
    grayImage = originalImage;
end

% Step 3: Preprocess the image (normalize)
normalizedImage = mat2gray(grayImage);  % Normalize intensity to [0, 1]

% Display the original normalized perfusion map
figure;
imagesc(normalizedImage);  % Display the normalized image
colormap jet;
colorbar;
title('Original Normalized Perfusion Map');

% Step 4: Perform 10 augmentations on the normalized image
augmentedImages = cell(1, 10);  % Create a cell array to hold the augmented images

% Augmentation 1: Rotation (30 degrees)
augmentedImages{1} = imrotate(normalizedImage, 30);

% Augmentation 2: Rotation (-45 degrees)
augmentedImages{2} = imrotate(normalizedImage, -45);

% Augmentation 3: Horizontal flip
augmentedImages{3} = flip(normalizedImage, 2);  % Flip horizontally

% Augmentation 4: Vertical flip
augmentedImages{4} = flip(normalizedImage, 1);  % Flip vertically

% Augmentation 5: Translation (shift by [15, -10] pixels)
augmentedImages{5} = imtranslate(normalizedImage, [15, -10]);

% Augmentation 6: Translation (shift by [-20, 25] pixels)
augmentedImages{6} = imtranslate(normalizedImage, [-20, 25]);

% Augmentation 7: Scaling (Zoom in by 1.2x)
augmentedImages{7} = imresize(normalizedImage, 1.2);

% Augmentation 8: Scaling (Zoom out by 0.8x)
augmentedImages{8} = imresize(normalizedImage, 0.8);

% Augmentation 9: Adding Gaussian noise
augmentedImages{9} = imnoise(normalizedImage, 'gaussian', 0, 0.01);

% Augmentation 10: Contrast adjustment
augmentedImages{10} = imadjust(normalizedImage);

% Step 5: Display the augmented images in a new figure
figure;
for i = 1:10
    subplot(2, 5, i);  % Display in a 2x5 grid
    imagesc(augmentedImages{i});
    colormap jet;  % Use the same colormap for consistency
    colorbar;
    title(['Augmentation ' num2str(i)]);
end

% Step 6: Segment tumor in each augmented image
for i = 1:10
    % Display augmented image with title
    figure;
    subplot(1, 2, 1);
    imagesc(augmentedImages{i});
    colormap jet;
    colorbar;
    title(['Augmented Image ' num2str(i)]);

    % Tumor segmentation using Otsu’s method
    threshold = graythresh(augmentedImages{i});
    tumorMask = augmentedImages{i} > threshold;  % Binary mask for tumor

    % Refine segmentation with morphological operations
    tumorMask = imfill(tumorMask, 'holes');  % Fill holes in the tumor region
    tumorMask = bwareaopen(tumorMask, 100);  % Remove small objects (noise)

    % Display tumor mask
    subplot(1, 2, 2);
    imagesc(tumorMask);
    colormap gray;
    title(['Segmented Tumor - Augmentation ' num2str(i)]);
    colorbar;

    % Optional: Superimpose tumor mask on the augmented image
    figure;
    imshow(augmentedImages{i}, []);
    hold on;
    h = imshow(tumorMask);
    set(h, 'AlphaData', tumorMask * 0.5);  % Set transparency for the tumor mask
    title(['Superimposed Tumor Mask - Augmentation ' num2str(i)]);
end

% Step 7: Adjust figure size for better visibility (optional)
set(gcf, 'Position', [100, 100, 1200, 600]);  % Adjust size for the augmentation figure
%% 
% Step 2: Convert to grayscale (if needed) and normalize
if size(imageData, 3) == 3  % If the image is RGB, convert to grayscale
    grayscaleImage = rgb2gray(imageData);
else
    grayscaleImage = imageData;
end

% Normalize the grayscale image to [0, 1] for perfusion map visualization
normalizedImage = mat2gray(grayscaleImage);

% Step 3: Create the perfusion color map
figure;
imagesc(normalizedImage);  % Display the normalized image with a colormap
colormap jet;  % Use the 'jet' colormap to highlight perfusion areas
colorbar;  % Add colorbar to show intensity scale
title('Perfusion Color Map (Normalized)');

% Step 4: Highlight tumor-like regions (optional)
% Apply a threshold to highlight regions with higher intensity (potential tumor)
threshold = 0.7;  % Adjust threshold as needed
tumorRegions = normalizedImage > threshold;

figure;
imagesc(tumorRegions);  % Display binary mask of tumor regions
colormap hot;  % Use 'hot' colormap for enhanced visualization
colorbar;
title('Highlighted Tumor Regions');

% Step 5: Save the generated perfusion map as JPEG (optional)
imwrite(normalizedImage, 'perfusion_map.jpg');  % Save the perfusion map
imwrite(tumorRegions, 'highlighted_tumor_regions.jpg');  % Save the highlighted regions

