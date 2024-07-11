% 读取图像 circuit.tif 并转换成灰度图
grayCircuitImage = imread('images/circuit.tif');

% 对灰度图进行 Canny 和 LoG 边缘检测
cannyEdges = edge(grayCircuitImage, 'Canny');
logEdges = edge(grayCircuitImage, 'log');

% 显示边缘检测结果
figure;
subplot(1, 3, 1);
imshow(grayCircuitImage);
title('原Circuit.tif');

subplot(1, 3, 2);
imshow(cannyEdges);
title('Canny边缘检测');

subplot(1, 3, 3);
imshow(logEdges);
title('Log边缘检测');

% 读取灰度图像 coins_gray.png
coinsGrayImage = imread('images/coins_gray.png');

% 使用全局阈值分割处理
globalThreshold = graythresh(coinsGrayImage);
coinsBinaryImage = imbinarize(coinsGrayImage, globalThreshold);

% 显示分割结果图
figure;
subplot(1, 2, 1);
imshow(coinsGrayImage);
title('原coins_gray.png');

subplot(1, 2, 2);
imshow(coinsBinaryImage);
title('全局阈值分割');

% 读取灰度图像 printedtext.png
printedTextImage = imread('images/printedtext.png');

% 使用自适应阈值分割
adaptiveThresh = adaptthresh(printedTextImage, 0.5); % 这里的敏感度可以调整
adaptiveBinaryImage = imbinarize(printedTextImage, adaptiveThresh);

% 显示分割结果图
figure;
subplot(1, 2, 1);
imshow(printedTextImage);
title('原printedtext.png');

subplot(1, 2, 2);
imshow(adaptiveBinaryImage);
title('自适应阈值分割');

% 调整参数使得前景比背景暗，并清晰显示文字
adaptiveBinaryImageAdjusted = imbinarize(printedTextImage, 'adaptive', ...
    'ForegroundPolarity', 'dark', 'Sensitivity', 0.4);

% 显示调整参数后的分割结果图
figure;
subplot(1, 2, 1);
imshow(printedTextImage);
title('原printedtext.png');

subplot(1, 2, 2);
imshow(adaptiveBinaryImageAdjusted);
title('调参自适应阈值分割');
