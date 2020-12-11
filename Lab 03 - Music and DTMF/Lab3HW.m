
%PART 4.1=================================================================
%create b(t) = 66*cos(2pi(40)t + pi/4) cos(2pi(900)t),
%starting at t = 0 with a duration of 4.04 s. 
%Use a sampling rate of fs = 4000 samples/sec to produce the signal in MATLAB. 
%Use testingBeat as the name of the MATLAB structure for the signal. 
%Plot a very short time section to show the amplitude modulation.


testingBeat.Amp = 66; %-- B in Equation (3)
testingBeat.fc = 900; %-- center frequency in Eq. (3)
testingBeat.phic = 0; %-- phase of 2nd sinusoid in Eq. (3)
testingBeat.fDelt = 40; %-- modulating frequency in Eq. (3)
testingBeat.phiDelt = pi/4; %-- phase of 1st sinusoid Eq. (3)
testingBeat.t1 = 0.0; %-- starting time
testingBeat.t2 = 4.04; %-- ending time

testingBeatSum = sum2BeatStruct(testingBeat);
xx = testingBeatSum.values;
tt = testingBeatSum.times;

%x2 = 33*cos(2*pi*940*tt + pi/4) + 33*cos(2*pi*860*tt - pi/4);

% plot(tt,xx)
% xlabel('Time (seconds)')
% ylabel('Amplitude')
% title('Lab 3 Homework: Part 4.1 (a)')
% axis([0,0.05,-70,70]);

plotspec(xx+j*1e-12,4000,256);
grid on
xlabel('Amplitude')
ylabel('Frequency (Hz)')
title('Lab 3 Homework: Part 4.1 (c)')

%spectrogram(xx,256,[ ],[ ],4000,'yaxis'); 


%PART 4.2=================================================================


