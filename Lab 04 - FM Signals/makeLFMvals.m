function sigOut = makeLFMvals( sigLFM, dt )
% MAKELFMVALS generate a linear-FM chirp signal

% usage: sigOut = makeLFMvals( sigLFM, dt )
f1 = sigLFM.f1; %starting frequency (in Hz) at t = sigLFM.t1
t1 = sigLFM.t1; %starting time (in secs)
t2 = sigLFM.t2; %ending time
slope = sigLFM.slope; %slope of the linear-FM (in Hz per sec)
amp = sigLFM.complexAmp; %defines the amplitude and phase of the FM signal
%dt = 1/fs - time increment for the time vector, typically 1/fs (sampling frequency)

%sigOut.values = (vector of) samples of the chirp signal
%sigOut.times = vector of time instants from t=t1 to t=t2


if( nargin < 2 ) %-- Allow optional input argument for dt
dt = 1/8000; %-- 8000 samples/sec
end
%--------NOTE: use the slope to determine mu needed in psi(t)
%-------- use f1, t1 and the slope to determine f0 needed in psi(t)
tt = t1:dt:t2;
mu = slope/2;
f0 = f1;
psi = 2*pi*( f0*tt + mu*tt.*tt);
xx = real( amp * exp(j*psi) );
sigOut.times = tt;
sigOut.values = xx;

plotspec(xx+j*1e-9,8000);
soundsc(xx);
end