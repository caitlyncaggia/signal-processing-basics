function xs = mySinusoid(amp, freq, pha, fs, tsta, tend)
% amp = amplitude
% freq = frequency in cycles per second
% pha = phase, the time offset for the first peak
% fs = number of sample values per second
% tsta = starting time in seconds
% tend = ending time in seconds
tt = tsta : 1/fs : tend; %time indicies for all the values
xs = amp * cos(freq*2*pi*tt + pha);
end