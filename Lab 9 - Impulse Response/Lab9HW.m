%PART A
F = [0.3 0.32];
A = [1 0];
DEV = [0.05 0.01];
[N, Fo, Ao, W] = firpmord(F, A, DEV);
%order is N = 146, but this didn't work in part C. Increase by 2
B = firpm(N+2, Fo, Ao, W);
%filter coefficients are in B

%PART B
nn = 1:length(B);
stem(nn-1, B(nn), 'filled')
xlabel('Time Index (n)')
title('Impulse Response')

%PART C
figure
ww = -pi:(pi/100):pi; 
H = freqz(B, 1, ww); 
plot(ww, abs(H)), grid on %entire plot
xlabel('Normalized Radian Frequency')
title('Magnitude of Frequency Response')
figure
subplot(211)
plot(ww, abs(H)), grid on %to zoom on passband
title('Passband Zoom')
subplot(212)
plot(ww, abs(H)), grid on %to zoom on stopband
title('Stopband Zoom')
xlabel('Normalized Radian Frequency')

%PART E
figure
plot(ww, angle(H)), grid on
xlabel('Normalized Radian Frequency')
title('Phase of Frequency Response')

