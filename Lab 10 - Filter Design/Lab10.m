% %FILTER #2
fs = 1/(0.3e-3);
% F = [679 764 776 852];
% A = [0 1 0];
% DEV = [0.01 0.02 0.01];
% [N, Fo, Ao, W] = firpmord(F, A, DEV, fs);
% %order is N = 76
% B = firpm(N, Fo, Ao, W);
% %filter coefficients are in B
% 
% figure
ww = -pi:(pi/1000):pi;
% H = freqz(B, 1, ww); 
% subplot(211)
% plot(ww, abs(H)), grid on %to zoom on passband
% title('Passband Zoom Filter #2')
% subplot(212)
% plot(ww, abs(H)), grid on %to zoom on stopband
% title('Stopband Zoom Filter #2')
% xlabel('Normalized Radian Frequency')
% 
% figure
% plot(ww, angle(H)), grid on
% xlabel('Normalized Radian Frequency')
% title('Phase of Frequency Response Filter #2')
% 
% figure
% subplot(211)
% xx = DTMFdial('159D*86A', fs);
% yy = firfilt(B, xx);
% subplot(212)
% plotspec(yy,fs);
% title('Filter #2')


%FILTER #5
F = [1082 1203 1215 1336];
A = [0 1 0];
DEV = [0.01 0.02 0.01];
[N, Fo, Ao, W] = firpmord(F, A, DEV, fs);
%order is N = 48
B5 = firpm(N-4, Fo, Ao, W);
%filter coefficients are in B

figure
H5 = freqz(B5, 1, ww); 
subplot(211)
plot(ww, abs(H5)), grid on %to zoom on passband
title('Passband Zoom Filter #5')
subplot(212)
plot(ww, abs(H5)), grid on %to zoom on stopband
% title('Stopband Zoom Filter #5')
% xlabel('Normalized Radian Frequency')
% 
% figure
% plot(ww, angle(H5)), grid on
% xlabel('Normalized Radian Frequency')
% title('Phase of Frequency Response Filter #5')


% %FILTER #8
% F = [1477 1633];
% A = [0 1];
% DEV = [0.01 0.02];
% [N, Fo, Ao, W] = firpmord(F, A, DEV, fs);
% %order is N =44 - 6
% B8 = firpm(N+6, Fo, Ao, W);
% %filter coefficients are in B
% 
% figure
% H8 = freqz(B8, 1, ww); 
% subplot(211)
% plot(ww, abs(H8)), grid on %to zoom on passband
% title('Passband Zoom Filter #8')
% subplot(212)
% plot(ww, abs(H8)), grid on %to zoom on stopband
% title('Stopband Zoom Filter #8')
% xlabel('Normalized Radian Frequency')
% 
% figure
% plot(ww, angle(H8)), grid on
% xlabel('Normalized Radian Frequency')
% title('Phase of Frequency Response Filter #8')


%PART 3.4
% B = hamming(99);
% H = freqz(B, 1, ww);
% figure
% subplot(211)
% plot(ww, abs(H))
% title('Frequency Response for Hamming Filter')
% subplot(212)
% plot(ww, angle(H))
% xlabel('Normalized Radian Frequency')



