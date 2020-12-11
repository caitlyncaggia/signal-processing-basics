amps = [1, 1];
freqs = [1200, 750];
phases = [0.6*pi, -0.1*pi];
fs = 4000;
tStart = [0.6, 0.2];
durs = [0.5, 1.6];
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