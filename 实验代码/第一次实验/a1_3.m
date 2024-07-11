% 读取图像
img = imread('images\test.tif');

% 进行二维Fourier变换
fft_img = fft2(double(img));
fft_img_shifted = fftshift(fft_img);

% 计算幅度谱
magnitude_spectrum = abs(fft_img_shifted);

% 显示幅度谱
figure;
subplot(2, 3, 1);
imshow(img, []);
title('原始图像');

subplot(2, 3, 2);
imshow(log(1 + magnitude_spectrum), []);
title('幅度谱');

% 计算相位谱
phase_spectrum = angle(fft_img_shifted);

% 显示相位谱
subplot(2, 3, 3);
imshow(phase_spectrum, []);
title('相位谱');

% 重构仅包含幅度信息的图像
magnitude_only = ifft2(ifftshift(magnitude_spectrum));
magnitude_only_img = abs(magnitude_only);

subplot(2, 3, 4);
imshow(magnitude_only_img, []);

title('仅包含幅度信息的图像');

% 重构仅包含相位信息的图像
phase_only = ifft2(ifftshift(exp(1i * phase_spectrum)));
phase_only_img = abs(phase_only);

subplot(2, 3, 5);
imshow(phase_only_img, []);
title('仅包含相位信息的图像');

% 对相位更敏感
