
%From lab 3, a modified version of the key2sinus function:
%total duration is 2.5 seconds, last 0.1 second is silence
[f4, tt1, freq1] = key2sinus(45, 1, 0, 4000, 0.2); 
  %starts at 0 sec, duration is 0.2 seconds
[a4, tt2, freq2] = key2sinus(49, 1, 0, 4000, 0.2); 
  %starts at 0.25 sec, duration is 0.2 sec
[c5, tt3, freq3] = key2sinus(52, 1, 0, 4000, 0.2); 
  %starts at 0.5 sec, duration is 0.2 sec
[f5, tt4, freq4] = key2sinus(57, 1, 0, 4000, 0.2); 
  %starts at 0.75 sec, ends at 2.4 sec, duration is 1.65 sec
[c5, tt5, freq5] = key2sinus(52, 1, 0, 4000, 0.2); 
  %starts at 1.0 sec, ends at 2.4 sec, duration is 1.4 sec
[a4, tt6, freq6] = key2sinus(49, 1, 0, 4000, 0.2);
  %starts at 1.25 sec, ends at 2.4 sec, duration is 1.15 sec
[f4, tt7, freq7] = key2sinus(45, 1, 0, 4000, 0.2);
  %starts at 1.5 sec, ends at 2.4 sec, duration is 0.9 sec

%from part 3.2 of Lab 4:
amps = ones(1,7);
freqs = [freq1, freq2, freq3, freq4, freq5, freq6, freq7];
phases = zeros(1,7);
fs = 4000;
tStart = [0, 0.25, 0.5, 0.75, 1.0, 1.25, 1.5];
durs = [0.2, 0.2, 0.2, 1.65, 1.4, 1.15, 0.9];
maxTime = max(tStart+durs) + 0.1; %-- Add time to show signal ending
durLengthEstimate = ceil(maxTime*fs);
tt = (0:durLengthEstimate)*(1/fs); %-- be conservative (add one)
xx = 0*tt; %--make a vector of zeros to hold the total signal
for kk = 1:length(amps)
nStart = round(fs*tStart(kk))+1; %-- add one to avoid zero index
xNew = shortSinus(amps(kk), freqs(kk), phases(kk), fs, durs(kk));
Lnew = length(xNew);
nStop = nStart - 1 + Lnew; %<========= subtract 1 to start at the right 
%index, add Lnew because that's the length of what you're adding
%(which is shortSinus)
xx(nStart:nStop) = xx(nStart:nStop) + xNew;
end
plotspec(xx,fs,256); 
grid on
title('Lab 4 Homework Part 4.1')
xlabel('Time (sec)')
ylabel('Frequency(Hz)')


