% 读取图像
img = imread('images\test.tif');

% 显示原始图像
figure;
subplot(2, 3, 1);
imshow(img);
title('原始图像');

% 低通滤波
% 使用MATLAB提供的高斯低通滤波器
filtered_img_lowpass = imgaussfilt(img, 5); % 标准差为5的高斯滤波器
subplot(2, 3, 2);
imshow(filtered_img_lowpass);
title('低通滤波器滤波');

% 空间滤波
% 使用自定义的低通滤波器（例如均值滤波器）
h = fspecial('average', [5 5]); % 创建5x5的均值滤波器
filtered_img_spatial = imfilter(img, h, 'replicate');
subplot(2, 3, 3);
imshow(filtered_img_spatial);
title('空间滤波');

% 高通滤波
% 使用MATLAB提供的拉普拉斯滤波器
filtered_img_highpass = img - imgaussfilt(img, 5); % 高斯低通滤波后，原图像减去低通滤波后的图像
subplot(2, 3, 4);
imshow(filtered_img_highpass);
title('高通滤波器滤波');

% 显示滤波后的图像并进行比较
subplot(2, 3, [5, 6]);
imshowpair(filtered_img_lowpass, filtered_img_spatial, 'montage');
title('低通滤波器 vs 空间滤波');
