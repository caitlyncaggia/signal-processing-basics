
ww = -pi:(pi/100):pi;
bb = [0,.25,-1,1.5,-1,.25];
HH = freqz(bb,1,ww);

plot(ww,abs(HH))