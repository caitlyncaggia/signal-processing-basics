%Lab 5 Homework
[xx, fs] = audioread('CaityAHH.wav');
Lsect = fs * 0.25;
dd = plotspecDB(xx(:,1), fs, Lsect, 80);