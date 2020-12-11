

%part 3.2
% tt = 0:1/4000:2;
% A = 2;
% fc = 800;
% a = 1000;
% b = 1.5;
% g = 0;
% xx = A*cos(2*pi*fc*tt + a*cos(2*pi*b*tt + g)) ;
% plotspec(xx+j*1e-9,512);

%part 3.3
% xpix = ones(256,1)*cos(2*pi*(0:255)/32);
% show_img(xpix);

%part 3.4
wd2 = 2*pi*2/32; 
xpix2 = ones(256,1)*cos(wd2*(0:255));
subplot(2,2,1)
imshow(xpix2);
wd14 = 2*pi*14/32; 
xpix14 = ones(256,1)*cos(wd14*(0:255));
subplot(2,2,2)
imshow(xpix14);

down2 =  xpix2(1:2:end,1:2:end);
subplot(2,2,3);
imshow(down2);
down14 = xpix14(1:2:end,1:2:end);
subplot(2,2,4);
imshow(down14);

