
% 读取图像
img1 = imread('images\huafen.jpg');
img2 = imread('images\eight.tif');
img3 = imread('images\rice.tif');

% 图像列表
images = {img1, img2, img3};
image_names = {'huafen.jpg', 'eight.tif', 'rice.tif'};

% 循环处理每张图像
for i = 1:length(images)
    img = images{i};
    
    % 如果是彩色图像，转换为灰度图像
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    
    % 1. 灰度线性变换
    % 线性变换 y = a*x + b
    a = 1.2; % 增加对比度
    b = 20;  % 提高亮度
    linear_transformed_img = a * double(img) + b;
    linear_transformed_img = uint8(linear_transformed_img);

    % 2. 计算并显示直方图
    figure;
    subplot(3, 2, 1);
    imshow(img);
    title([image_names{i} ' - 原图']);
    
    subplot(3, 2, 2);
    imhist(img);
    title([image_names{i} ' - 原图直方图']);
    
    % 显示灰度线性变换后的图像和直方图
    subplot(3, 2, 3);
    imshow(linear_transformed_img);
    title([image_names{i} ' - 线性变换']);
    
    subplot(3, 2, 4);
    imhist(linear_transformed_img);
    title([image_names{i} ' - 线性变换直方图']);
    
    % 3. 直方图均衡化
    equalized_img = histeq(img);
    
    subplot(3, 2, 5);
    imshow(equalized_img);
    title([image_names{i} ' - 直方图均衡化']);
    
    subplot(3, 2, 6);
    imhist(equalized_img);
    title([image_names{i} ' - 直方图均衡化直方图']);
end



% 设定不同的斜率和截距
% 读取图像
img1 = imread('images\huafen.jpg');
img2 = imread('images\eight.tif');
img3 = imread('images\rice.tif');

% 图像列表
images = {img1, img2, img3};
image_names = {'huafen.jpg', 'eight.tif', 'rice.tif'};

% 设定不同的斜率和截距值
slopes = [0.8, 1.0, 1.2];
intercepts = [-50, 0, 50];

% 循环处理每张图像
for i = 1:length(images)
    img = images{i};
    
    % 如果是彩色图像，转换为灰度图像
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    
    figure;
    
    % 显示原图像和直方图
    subplot(4, 4, 1);
    imshow(img);
    title([image_names{i} ' - 原图']);
    
    subplot(4, 4, 2);
    imhist(img);
    title([image_names{i} ' - 原图直方图']);
    
    % 对不同的斜率和截距进行处理
    for j = 1:length(slopes)
        for k = 1:length(intercepts)
            a = slopes(j);
            b = intercepts(k);
            
            % 灰度线性变换
            linear_transformed_img = a * double(img) + b;
            linear_transformed_img = uint8(linear_transformed_img);
            
            % 显示变换后的图像和直方图
            subplot(4, 4, 2*j+2*k-1);
            imshow(linear_transformed_img);
            title(['a = ' num2str(a) ', b = ' num2str(b)]);
            
            subplot(4, 4, 2*j+2*k);
            imhist(linear_transformed_img);
            title(['a = ' num2str(a) ', b = ' num2str(b) ' 直方图']);
        end
    end
end

