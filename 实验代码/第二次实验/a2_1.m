% 读取图像
img = imread('images\test.tif');
% 显示原始图像
figure;
subplot(2, 3, 1);
imshow(img);
title('原始图像');

% 平移操作
tx = 50; % 水平方向平移量
ty = 30; % 垂直方向平移量
translated_img = imtranslate(img, [tx, ty]);
subplot(2, 3, 2);
imshow(translated_img);
title('平移后图像');

% 垂直镜像变换
flipped_img_vertical = flipud(img);
subplot(2, 3, 3);
imshow(flipped_img_vertical);
title('垂直镜像变换后图像');

% 水平镜像变换
flipped_img_horizontal = fliplr(img);

% 显示水平镜像变换后的图像
subplot(2, 3, 4);
imshow(flipped_img_horizontal);
title('水平镜像变换后图像');

% 缩放操作
scale_factor = 0.5; % 缩放因子
scaled_img = imresize(img, scale_factor);

% 显示缩放后的图像
subplot(2, 3, 5);
imshow(scaled_img);
title('缩放后图像');

% 旋转操作
angle_degrees = 30; % 旋转角度（度）
rotated_img = imrotate(img, angle_degrees, 'bilinear', 'crop');

% 显示旋转后的图像
subplot(2, 3, 6);
imshow(rotated_img);
title('旋转后图像');