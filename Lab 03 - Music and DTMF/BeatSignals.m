%part 3.1
sigBeat.Amp = 10; %-- B in Equation (3)
sigBeat.fc = 580; %-- center frequency in Eq. (3)
sigBeat.phic = 0; %-- phase of 2nd sinusoid in Eq. (3)
sigBeat.fDelt = 20; %-- modulating frequency in Eq. (3)
sigBeat.phiDelt = -2*pi/3; %-- phase of 1st sinusoid Eq.~(\ref{Labeq:beatSigSum})
sigBeat.t1 = 1.1; %-- starting time
sigBeat.t2 = 5.2; %-- ending time

sigBeatSum = sum2BeatStruct(sigBeat);
xx = sigBeatSum.values;
tt = sigBeatSum.times;

sound(xx)
plot(tt,xx)

fs=8000;
spectrogram(xx,1024,[ ],[ ],fs,'yaxis'); 
colorbar;



