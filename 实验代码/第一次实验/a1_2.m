%1
% 读取并显示原图像
img = imread('images\lena.BMP');
figure;
subplot(3, 3, 1);
imshow(img);
title('原图像');

% 添加高斯噪声并显示
img_gaussian = imnoise(img, 'gaussian', 0, 0.01);
subplot(3, 3, 2);
imshow(img_gaussian);
title('高斯噪声图像');

% 添加椒盐噪声并显示
img_salt_pepper = imnoise(img, 'salt & pepper', 0.02);
subplot(3, 3, 3);
imshow(img_salt_pepper);
title('椒盐噪声图像');

% 设置均值滤波模板尺寸
filter_sizes = [3, 5, 7];

% 对高斯噪声图像进行均值滤波并显示
for i = 1:length(filter_sizes)
    filter_size = filter_sizes(i);
    h = fspecial('average', filter_size);
    img_gaussian_filtered = imfilter(img_gaussian, h);
    subplot(3, 3, 3+i);
    imshow(img_gaussian_filtered);
    title(['高斯噪声均值滤波 ', num2str(filter_size), 'x', num2str(filter_size)]);
end

% 对椒盐噪声图像进行均值滤波并显示
for i = 1:length(filter_sizes)
    filter_size = filter_sizes(i);
    h = fspecial('average', filter_size);
    img_salt_pepper_filtered = imfilter(img_salt_pepper, h);
    subplot(3, 3, 6+i);
    imshow(img_salt_pepper_filtered);
    title(['椒盐噪声均值滤波 ', num2str(filter_size), 'x', num2str(filter_size)]);
end

% 中值滤波处理并显示
figure;
subplot(3, 3, 1);
imshow(img);
title('原图像');

% 对高斯噪声图像进行中值滤波并显示
for i = 1:length(filter_sizes)
    filter_size = filter_sizes(i);
    img_gaussian_med_filtered = medfilt2(img_gaussian, [filter_size filter_size]);
    subplot(3, 3, 3+i);
    imshow(img_gaussian_med_filtered);
    title(['高斯噪声中值滤波 ', num2str(filter_size), 'x', num2str(filter_size)]);
end

% 对椒盐噪声图像进行中值滤波并显示
for i = 1:length(filter_sizes)
    filter_size = filter_sizes(i);
    img_salt_pepper_med_filtered = medfilt2(img_salt_pepper, [filter_size filter_size]);
    subplot(3, 3, 6+i);
    imshow(img_salt_pepper_med_filtered);
    title(['椒盐噪声中值滤波 ', num2str(filter_size), 'x', num2str(filter_size)]);
end


%2
% 读取并显示原图像
img = imread('images\lena.BMP');
img_gray = im2gray(img); % 直接使用 im2gray 转换为灰度图像
figure;
subplot(3, 3, 1);
imshow(img_gray);
title('原图像');

% Roberts算子
roberts_x = [1 0; 0 -1];
roberts_y = [0 1; -1 0];
img_roberts_x = imfilter(double(img_gray), roberts_x);
img_roberts_y = imfilter(double(img_gray), roberts_y);
img_roberts = sqrt(img_roberts_x.^2 + img_roberts_y.^2);
subplot(3, 3, 2);
imshow(uint8(img_roberts));
title('Roberts算子');

% Prewitt算子
prewitt_x = [-1 0 1; -1 0 1; -1 0 1];
prewitt_y = [-1 -1 -1; 0 0 0; 1 1 1];
img_prewitt_x = imfilter(double(img_gray), prewitt_x);
img_prewitt_y = imfilter(double(img_gray), prewitt_y);
img_prewitt = sqrt(img_prewitt_x.^2 + img_prewitt_y.^2);
subplot(3, 3, 3);
imshow(uint8(img_prewitt));
title('Prewitt算子');

% Sobel算子
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];
img_sobel_x = imfilter(double(img_gray), sobel_x);
img_sobel_y = imfilter(double(img_gray), sobel_y);
img_sobel = sqrt(img_sobel_x.^2 + img_sobel_y.^2);
subplot(3, 3, 4);
imshow(uint8(img_sobel));
title('Sobel算子');

% Laplacian算子
laplacian_filter = [0 -1 0; -1 4 -1; 0 -1 0];
img_laplacian = imfilter(double(img_gray), laplacian_filter, 'replicate');
subplot(3, 3, 5);
imshow(uint8(img_laplacian));
title('Laplacian算子');

% Laplacian增强
alpha = 0.5;
img_enhanced = double(img_gray) - alpha * img_laplacian;
subplot(3, 3, 6);
imshow(uint8(img_enhanced));
title('Laplacian增强');

% Laplacian增强算子
laplacian_enhanced_filter = [1 -2 1; -2 4 -2; 1 -2 1];
img_laplacian_enhanced = imfilter(double(img_gray), laplacian_enhanced_filter, 'replicate');
subplot(3, 3, 7);
imshow(uint8(img_laplacian_enhanced));
title('Laplacian增强算子');


%3
% 读取原图像
img = imread('images\lena.BMP');

% 显示原图像
figure;
subplot(2, 2, 1);
imshow(img);
title('原图像');

% 添加高斯噪声
noisy_img = imnoise(img, 'gaussian', 0, 0.01);

% 显示加噪图像
subplot(2, 2, 2);
imshow(noisy_img);
title('加噪图像');

% 空间域高斯低通滤波器尺寸
filter_size_1 = 5;
filter_size_2 = 15;

% 应用高斯低通滤波器进行去噪处理
denoised_img_1 = imgaussfilt(noisy_img, filter_size_1);
denoised_img_2 = imgaussfilt(noisy_img, filter_size_2);

% 显示去噪图像
subplot(2, 2, 3);
imshow(denoised_img_1);
title('5x5高斯低通滤波去噪图像');

% 显示去噪图像
subplot(2, 2, 4);
imshow(denoised_img_2);
title('15x15高斯低通滤波去噪图像');



