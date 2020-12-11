function xs = myDecayingSinusoid(A, b, omega, phi, fs, tStart, tEnd)
% A = amplitude
% b = decay parameter
% omega = frequency in radians (f in Hz * 2pi)
% phi = phase shift
% fs = number of sample values per second
% tStart = starting time in seconds
% tEnd = ending time in seconds
tt = tStart : 1/fs : tEnd;
xs = A .* exp(-1 .* b .* tt) .* cos(omega.*tt + phi);
plot(tt, xs);
end
