%part 3.3
scale = [];
%i is each of the key numbers from C to C on a major scale pattern
for i = [40 42 44 45 47 49 51 52]
    [xx, tt] = key2sinus(i, 1, 0, 8000, 0.4);
    scale = [scale zeros(1, length(0:1/8000:0.1)) xx];
end
scale = [scale zeros(1, length(0:1/8000:0.1))];
long = length(scale);
tt = linspace(0, 4.1, long);
%actual time of scale at the end of the for loop is 8*0.1 (0.1 seconds for 
%each note and there are 8 notes). After the "long" time is calculated, the
%length of scale is twice that after the loops ends...

sound(scale)
plot(tt,scale)

spectrogram(scale,1024,[ ],[ ],8000,'yaxis'); 
colorbar;

%strange blurriness between notes may be an issue from trying to 
%cut of an oscillating signal cleanly
    