function sigOut = addCosVals( cosIn, dur, tstart, dt )
%ADDCOSVALS Synthesize a signal from sum of sinusoids
% (do not assume all the frequencies are the same)
%
% usage: sigOut = addCosVals( cosIn, dur, tstart, dt )
%
% cosIn = vector of structures; each one has the following fields:
% cosIn.freq = frequency (n Hz), usually none should be negative
% cosIn.complexAmp = COMPLEX amplitude of the cosine
%
% dur = total time duration of all the cosines
% start = starting time of all the cosines
% dt = time increment for the time vector
% The output structure has only signal values because it is not necessarily a sinusoid
% sigOut.values = vector of signal values at t = sigOut.times
% sigOut.times = vector of times, for the time axis
%
% The sigOut.times vector should be generated with a small time increment that
% creates 32 samples for the shortest period, i.e., use the period
% corresponding to the highest frequency cosine in the input array of structures.
vals = [];
for i = 1:length(cosIn)
    A = cosIn(i).complexAmp;
    f = cosIn(i).freq;
    tt = tstart:dt:dur+tstart;
    xx = A*exp(j*2*pi*f*tt); %finds values for one signal
    vals = [vals; xx]; %makes a matrix where each row is values for one signal
end

finalvals = [];
for i = 1:length(xx)
    finalvals = [finalvals sum(vals(1:end, i))]; 
    %sums columns of matrix 
end
finalvals = real(finalvals);

sigOut.times = tstart:dt:dur+tstart;
sigOut.vals = finalvals;
    
end