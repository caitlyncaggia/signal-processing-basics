load echart.mat

m = 147; %choose a row

bdiffh = [1, -1];
yy = conv(echart(m,:), bdiffh);

nn = 1:length(yy); %--- use first=1 and last=length(xx)
subplot(2,1,1);
stem(nn-1, echart(nn))
subplot(2,1,2);
stem(nn-1,yy(nn),'filled') %--Make black dots
xlabel('Time Index (n)')

black = find(yy~=0);
Ewidth = black(3) - black(2);

figure
imshow(echart);


