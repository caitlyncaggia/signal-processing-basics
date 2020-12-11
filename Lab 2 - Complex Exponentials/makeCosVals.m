function sigOut = makeCosVals( sigIn, dur, tstart, dt )

freq = sigIn.freq;
X = sigIn.complexAmp;

A = real(X);

tt = tstart: dt :tstart+dur; %-- Create the vector of times
xx = A*cos(freq*2*pi*tt); %-- Vectorize the cosine evaluation
sigOut.times = tt; %-- Put vector of times into the output structure
sigOut.values = xx; %-- Put values into the output structure

plot(tt, xx);
end

