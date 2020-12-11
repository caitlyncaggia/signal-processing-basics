
%part 3.2
%--- make a plot of sum of cosines
dt = 1/800;
XX = rand(1,3).*exp(2i*pi*rand(1,3)); %--Random amplitude and phases
freq = 9;
ccsum = zeros(1,500);
for kx = 1:length(XX)
kt = 1:500;
t = kt*dt;
Ak = abs(XX(kx));
phik = angle(XX(kx));
ccsum(kt) = ccsum(kt) + Ak*cos(2*pi*freq*t + phik);
tt(kt) = t;
end
plot(tt,ccsum) %-- Plot the sum sinusoid
grid on, zoom on, shg



%part 3.3
mySig.freq = 2; %-- (in hertz)
mySig.complexAmp = 5*exp(j*pi/4);
dur = 2;
start = -1;
dt = 1/(32*mySig.freq);
mySigWithVals = makeCosVals(mySig, dur, start, dt);
%- Plot the values in sigWithVals



%part 3.4
ss(1).freq = 15; ss(1).complexAmp = exp(j*pi/4);
ss(2).freq = 12; ss(2).complexAmp = 2i;
ss(3).freq = 9; ss(3).complexAmp = -4;
dur = 1;
tstart = -0.5;
dt = 1/(15*32); %-- use the highest frequency to define delta_t
ssOut = addCosVals( ss, dur, tstart, dt );
plot(ssOut.times, ssOut.vals)

%period: each graph has a period of 1/9, 1/12, and 1/15...the least common
%multiple of those three numbers is 1/3, so the period of ssOut is 1/3.
%the fundamental frequency can be determined by this period: T = 1/f, so f
%is 3 Hz. 


