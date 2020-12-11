function sigBeatSum = sum2BeatStruct( sigBeatIn )
%part 3.1

%--- Assume the five basic fields are present, plus the starting and ending times
%--- Add the four fields for the parameters in Equation (4)
% sigBeatSum.f1, sigBeatSum.f2, sigBeatSum.X1, sigBeatSum.X2

sigBeatSum.f1 = sigBeatIn.fc + sigBeatIn.fDelt;
sigBeatSum.f2 = sigBeatIn.fc - sigBeatIn.fDelt;
sigBeatSum.phi1 = sigBeatIn.phic + sigBeatIn.phiDelt;
sigBeatSum.phi2 = sigBeatIn.phic - sigBeatIn.phiDelt;
sigBeatSum.X1 = sigBeatIn.Amp / 2;
sigBeatSum.X2 = sigBeatIn.Amp / 2;

tt = sigBeatIn.t1:1/4000:sigBeatIn.t2;
sigBeatSum.times = tt;

sigBeatSum.values = sigBeatSum.X1*cos(2*pi*sigBeatSum.f1*tt + sigBeatSum.phi1) + ...
    sigBeatSum.X2*cos(2*pi*sigBeatSum.f2*tt + sigBeatSum.phi2);

end