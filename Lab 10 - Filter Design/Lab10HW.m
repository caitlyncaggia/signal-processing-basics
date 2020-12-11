%PART 4.1
fs = 1/(0.3e-3);
ww = -pi:(pi/1000):pi;

%FILTER #1
F = [679 770];
A = [1 0];
DEV = [0.02 0.01];
[N, Fo, Ao, W] = firpmord(F, A, DEV, fs);
%order is 64, but needs to be increased to meet specs
B1 = firpm(N+2, Fo, Ao, W);
% figure
% H1 = freqz(B1, 1, ww); 
% plot(ww, abs(H1)), grid on
% xlabel('Normalized Radian Frequency')
% title('Filter #1')

%Filter #2
F = [679 764 776 852];
A = [0 1 0];
DEV = [0.01 0.02 0.01];
[N, Fo, Ao, W] = firpmord(F, A, DEV, fs);
%order is N = 76, but can be smaller
B2 = firpm(N-10, Fo, Ao, W);
% figure
% H2 = freqz(B2, 1, ww); 
% plot(ww, abs(H2)), grid on
% xlabel('Normalized Radian Frequency')
% title('Filter #2')

%Filter #3
F = [770 852-6 852+6 941];
A = [0 1 0];
DEV = [0.01 0.02 0.01];
[N, Fo, Ao, W] = firpmord(F, A, DEV, fs);
B3 = firpm(N-10, Fo, Ao, W);
% figure
% H3 = freqz(B3, 1, ww); 
% plot(ww, abs(H3)), grid on
% xlabel('Normalized Radian Frequency')
% title('Filter #3')

%Filter #4
F = [852 941-6 941+6 941+(941-852)];
A = [0 1 0];
DEV = [0.01 0.02 0.01];
[N, Fo, Ao, W] = firpmord(F, A, DEV, fs);
%N is 70, but can be lower
B4 = firpm(N-6, Fo, Ao, W);
% figure
% H4 = freqz(B4, 1, ww); 
% plot(ww, abs(H4)), grid on
% xlabel('Normalized Radian Frequency')
% title('Filter #4')

%Filter #5
F = [1082 1203 1215 1336];
A = [0 1 0];
DEV = [0.01 0.02 0.01];
[N, Fo, Ao, W] = firpmord(F, A, DEV, fs);
%order is N = 48, but can be smaller
B5 = firpm(N-4, Fo, Ao, W);
% figure
% H5 = freqz(B5, 1, ww); 
% plot(ww, abs(H5)), grid on
% xlabel('Normalized Radian Frequency')
% title('Filter #5')

%Filter #6
F = [1209 1336-6 1336+6 1477];
A = [0 1 0];
DEV = [0.01 0.02 0.01];
[N, Fo, Ao, W] = firpmord(F, A, DEV, fs);
%N = 48, but can be lower
B6 = firpm(N-6, Fo, Ao, W);
% figure
% H6 = freqz(B6, 1, ww); 
% plot(ww, abs(H6)), grid on
% xlabel('Normalized Radian Frequency')
% title('Filter #6')

%Filter #7
F = [1336 1477-6 1477+6 1633];
A = [0 1 0];
DEV = [0.01 0.02 0.01];
[N, Fo, Ao, W] = firpmord(F, A, DEV, fs);
%N is 43, but must be even and can be lower
B7 = firpm(N-3, Fo, Ao, W);
% figure
% H7 = freqz(B7, 1, ww); 
% plot(ww, abs(H7)), grid on
% xlabel('Normalized Radian Frequency')
% title('Filter #7')

%Filter #8
F = [1477 1633];
A = [0 1];
DEV = [0.01 0.02];
[N, Fo, Ao, W] = firpmord(F, A, DEV, fs);
%order is 38, but needs to be increased to fit specs
B8 = firpm(N+6, Fo, Ao, W);
% figure
% H8 = freqz(B8, 1, ww); 
% plot(ww, abs(H8)), grid on
% xlabel('Normalized Radian Frequency')
% title('Filter #8')


%Fixing Delay
delay4 = [0 1];
B4 = conv(B4, delay4);
delay5 = [zeros(1,10) 1];
B5 = conv(B5, delay5);
delay6 = [zeros(1,11) 1];
B6 = conv(B6, delay6);
delay7 = [zeros(1,12) 1];
B7 = conv(B7, delay7);
delay8 = [zeros(1,10) 1];
B8 = conv(B8, delay8);

%filters who did not have delay adjusted have length 67
add4 = length(B1) - length(B4);
B4 = [B4 zeros(1, add4)];
add5 = length(B1) - length(B5);
B5 = [B5 zeros(1, add5)];
add6 = length(B1) - length(B6);
B6 = [B6 zeros(1, add6)];
add7 = length(B1) - length(B7);
B7 = [B7 zeros(1, add7)];
add8 = length(B1) - length(B8);
B8 = [B8 zeros(1, add8)];

%Now all filters have the same delay and length.



%PART 4.2 

%(a)
xx = DTMFdial('159D*86A', fs);

figure
subplot(211)
plotspec(xx,fs);
title('Filter #1')
subplot(212)
yy1 = firfilt(B1, xx);
plotspec(yy1,fs);

figure
subplot(211)
plotspec(xx,fs);
title('Filter #2')
subplot(212)
yy2 = firfilt(B2, xx);
plotspec(yy2,fs);

figure
subplot(211)
plotspec(xx,fs);
title('Filter #3')
subplot(212)
yy3 = firfilt(B3, xx);
plotspec(yy3,fs);

figure
subplot(211)
plotspec(xx,fs);
title('Filter #4')
subplot(212)
yy4 = firfilt(B4, xx);
plotspec(yy4,fs);

figure
subplot(211)
plotspec(xx,fs);
title('Filter #5')
subplot(212)
yy5 = firfilt(B5, xx);
plotspec(yy5,fs);

figure
subplot(211)
plotspec(xx,fs);
title('Filter #6')
subplot(212)
yy6 = firfilt(B6, xx);
plotspec(yy6,fs);

figure
subplot(211)
plotspec(xx,fs);
title('Filter #7')
subplot(212)
yy7 = firfilt(B7, xx);
plotspec(yy7,fs);

figure
subplot(211)
plotspec(xx,fs);
title('Filter #8')
subplot(212)
yy8 = firfilt(B8, xx);
plotspec(yy8,fs);


%(b)
Bh = hamming(99);
R = round(99/4);

avgpower1 = firfilt(Bh, yy1.^2);
pDownSampled1 = avgpower1(1:R:end);
figure
strips(pDownSampled1);
title('Downsampled Filter #1')

avgpower2 = firfilt(Bh, yy2.^2);
pDownSampled2 = avgpower2(1:R:end);
figure
strips(pDownSampled2);
title('Downsampled Filter #2')

avgpower3 = firfilt(Bh, yy3.^2);
pDownSampled3 = avgpower3(1:R:end);
figure
strips(pDownSampled3);
title('Downsampled Filter #3')

avgpower4 = firfilt(Bh, yy4.^2);
pDownSampled4 = avgpower4(1:R:end);
figure
strips(pDownSampled4);
title('Downsampled Filter #4')

avgpower5 = firfilt(Bh, yy5.^2);
pDownSampled5 = avgpower5(1:R:end);
figure
strips(pDownSampled5);
title('Downsampled Filter #5')

avgpower6 = firfilt(Bh, yy6.^2);
pDownSampled6 = avgpower6(1:R:end);
figure
strips(pDownSampled6);
title('Downsampled Filter #6')

avgpower7 = firfilt(Bh, yy7.^2);
pDownSampled7 = avgpower7(1:R:end);
figure
strips(pDownSampled7);
title('Downsampled Filter #7')

avgpower8 = firfilt(Bh, yy8.^2);
pDownSampled8 = avgpower8(1:R:end);
figure
strips(pDownSampled8);
title('Downsampled Filter #8')


%(c)
matrix = horzcat(pDownSampled1(:),pDownSampled2(:),pDownSampled3(:),...
    pDownSampled4(:), pDownSampled5(:), pDownSampled6(:), pDownSampled7(:),...
    pDownSampled8(:));

phoneNumber = decodeDTMF(matrix, fs, R);


