function draw_cm(mat,tick)
%%
%  作者： 丕子  shamoxia.com
%  参数：mat-矩阵；tick-要在坐标轴上显示的label向量，例如{'label_1','label_2'...}
%
%%
imagesc(mat);            %# 绘彩色图
colormap(flipud(gray));  %# 转成灰度图，因此高value是渐黑色的，低value是渐白的
num_class=size(mat,1);


textStrings = num2str(mat(:),'%0.0f');

textStrings = strtrim(cellstr(textStrings));
[x,y] = meshgrid(1:num_class);
hStrings = text(x(:),y(:),textStrings(:), 'HorizontalAlignment','center', 'Fontsize', 5);
midValue = mean(get(gca,'CLim'));
textColors = repmat(mat(:) > midValue,1,3);
%改变test的颜色，在黑cell里显示白色

set(hStrings,{'Color'},num2cell(textColors,2));  %# Change the text colors
set(gca,'XTick',1:1:38);
set(gca,'YTick',1:1:38);
set(gca,'xticklabel',tick,'XAxisLocation','top', 'Fontsize', 5);
rotateXLabels(gca, 18.6 );

set(gca,'yticklabel',tick);
% set(gca,'Position',[0 0 1100 896]);
