%part 2.1
str = input('Phrase: ', 's');
  %test case: Caitlyn Caggia
out = str(end:-1:1)


%part 2.2
A = 3.817;
b = 0.6;
omega = 2*pi*250;
phi = pi/4;
fs = 8000;
tStart = 0;
tEnd = 2;
xs = myDecayingSinusoid(A, b, omega, phi, fs, tStart, tEnd);

%part 2.3
[xx, fs, nbits] = wavread('threevotes.wav');
  % totalsamples = length(xx);
  % totaltime = totalsamples/fs;
  % fs = totalsamples/totaltime; ie, how many samples are in each second
ts = 0.25:1/fs:0.5;
plot(ts, xx(fs*.25:fs*.5))


%part 2.4
Lx = length(xs);
reverse = xs(end:-1:1);
tt = tStart : 1/fs : tEnd;
plot(tt, reverse)


%homework problem
[xx,fs,nbits] = wavread('CaityAHH.wav');
ts = 0.22:1/fs:0.246;
plot(ts, xx(fs*.22:fs*.246))
title('Estimated Average Pitch Period');
axis([.22,.246, -.003, .004]);

