function [xx,tt] = makeFMexpVals(sigFMexp, dt)

amp = sigFMexp.Amp; %-- Amplitude
fc = sigFMexp.fc; %-- center frequency
b = sigFMexp.beta; %-- FM parameter
g = sigFMexp.gamma; %-- FM parameter
t1 = sigFMexp.t1; %-- starting time
t2 = sigFMexp.t2; %-- ending time

tt = t1 : dt : t2;
xx = amp*cos(2*pi.*(fc*tt + (g./b).*exp(b*tt)));

plotspec(xx,1/dt);
title('Lab 4 Homework Part 4.2');
xlabel('Time (sec)');
ylabel('Frequency (Hz)');

end