load speechbad.mat

subplot(211);
plotspecDB(xxbad, fs, 4000, 80);
title('corrupted signal (xxbad)');
%sound(xxbad, 8000);

b1 = [1, -2*cos(2*pi*(2222/8000)), 1];
b2 = [1, -2*cos(2*pi*(1555/8000)), 1];
bb = conv(b1, b2);
yy = firfilt(bb, xxbad);
subplot(212);
plotspecDB(yy, fs, 4000, 80);
title('filtered output signal (yy)');
%sound(yy,8000);

figure
ww = -pi:(pi/100):pi; %-- omega hat frequency vector
H = freqz(bb, 1, ww); %<--freekz(bb,1,ww) is an alternative
subplot(2,1,1);
plot(ww, abs(H)), grid on
subplot(2,1,2);
plot(ww, angle(H)), grid on
xlabel('Normalized Radian Frequency')
