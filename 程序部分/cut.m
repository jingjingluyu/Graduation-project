num = 11788;
[index name] = textread('images.txt','%d %s', num);
[index2 a b c d] = textread('bounding_boxes.txt','%d %f %f %f %f', num);
a = round(a);
b = round(b);
c = round(c);
d = round(d);
for i = 1:num
	I = imread(name{i});
	I_cut = imcrop(I,[a(i) b(i) c(i) d(i)]);
	imwrite(I_cut,name{i});
end
