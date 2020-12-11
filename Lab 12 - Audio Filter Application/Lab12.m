%PART 3.1

ww = -pi:1/1000:pi;
bb = [1 -1];
H = freqz(bb,1,ww);
% figure
% subplot(211)
% plot(ww,abs(H))
% title('Part 3.1')
% subplot(212)
% plot(ww,angle(H))
%this is a high-pass filter

[xx, fs] = audioread('catsdogs.wav');
yy = firfilt(bb, xx);
% subplot(211)
% plotspec(xx,fs);
% title('Unfiltered Signal')
% subplot(212)
% plotspec(yy,fs);
% title('Filtered Signal')


%PART 3.2
%(a)
fs = 8000;
tt = 0:1/fs:1.3;
b1 = 1.1 + cos(2*pi*81*tt);
b2 = cos(2*pi*1031*tt);
bb = b1.*b2;
% figure
% plot(tt,bb)
% title('Part 3.2(a)')

%(b)
% figure
% plot(tt,abs(bb))
% title('Part 3.2(b)')

%(c)
% figure
% plotspec(bb, fs);
% title('Plot of b(t)')
% figure
% plotspec(b1, fs);
% title('Plot of b1(t)')
% figure
% plotspec(abs(bb), fs);
% title('Plot of |b(t)|')

%(d)
yy = filter(num, den, abs(bb));
figure
subplot(211)
plot(tt,abs(bb));
title('Unfiltered |b(t)|')
subplot(212)
plot(tt,yy);
title('Filtered |b(t)|')





