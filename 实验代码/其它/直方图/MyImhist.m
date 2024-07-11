function MyImhist(img)
% 自己写的直方图绘制函数

% 如果是彩色图像，转换为灰度图像
if size(img, 3) == 3
   img = rgb2gray(img);
end

[m,n] = size(img);
N=zeros(1,256);
for i=1:m
    for j=1:n
        k=img(i,j);
        N(k+1)=N(k+1)+1;
    end
end
sum=m*n;
p=N/sum;    %统计频率

figure;
subplot(1,3,1),imshow(img), title('原始原图');
subplot(1,3,2),bar(N);title('灰度直方图（自定义函数）');
subplot(1,3,3),bar(p),title('归—化灰度直方图（自定义函数）');
end