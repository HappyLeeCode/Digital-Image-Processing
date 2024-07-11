% 读取实验图像
textImage = imread('images/text.png');
circlesImage = imread('images/circles.png');
coinsImage = imread('images/coins.png');

% 设置膨胀、腐蚀的结构元素
se = strel('disk', 5); % 圆盘形结构元素，半径为5

% 对二值图text.png进行膨胀操作
textDilated = imdilate(textImage, se);

% 对二值图text.png进行腐蚀操作
textEroded = imerode(textImage, se);

% 对二值图circles.png进行开运算
circlesOpened = imopen(circlesImage, se);

% 对二值图circles.png进行闭运算
circlesClosed = imclose(circlesImage, se);

% 对二值图coins.png进行孔洞填充操作
coinsFilled = imfill(coinsImage, 'holes');

% 显示结果
figure;
subplot(1, 3, 1);
imshow(textImage);
title('原图像text.png');

subplot(1, 3, 2);
imshow(textDilated);
title('膨胀text.png');

subplot(1, 3, 3);
imshow(textEroded);
title('腐蚀text.png');

figure;
subplot(1, 3, 1);
imshow(circlesImage);
title('原始circles.png');

subplot(1, 3, 2);
imshow(circlesOpened);
title('开运算circles.png');

subplot(1, 3, 3);
imshow(circlesClosed);
title('闭运算circles.png');

figure;
subplot(1, 2, 1);
imshow(coinsImage);
title('原始coins.png.png');

subplot(1, 2, 2);
imshow(coinsFilled);
title('孔洞填充coins.png');
