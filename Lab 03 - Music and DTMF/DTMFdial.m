function xx = DTMFdial(keyNames,fs)
%DTMFDIAL Create a signal vector of tones that will dial
% a DTMF (Touch Tone) telephone system.
%
% usage: xx = DTMFdial(keyNames,fs)
% keyNames = vector of CHARACTERS containing valid key names
% fs = sampling frequency
% xx = signal vector that is the concatenation of DTMF tones.

TTkeys = ['1','2','3','A';
'4','5','6','B';
'7','8','9','C';
'*','0','#','D'];
TTcolTones = [1209,1336,1477,1633]; %-- in Hz
TTrowTones = [697,770,852,941];
numKeys = length(keyNames);
durDualTone = .180;
LenDualTone = 0:1/fs:.180;
durSilence = 0.048;
LenSilence = 0:1/fs:0.048;
xx = zeros(1,numKeys*length(LenDualTone) + (numKeys - 1)*length(LenSilence)); 
%- initialize xx to be long enough to hold the entire output
n1 = 1;
for kk=1:numKeys    
    [jrow,jcol] = find(keyNames(kk) == TTkeys);
    f1 = TTrowTones(jrow);
    f2 = TTcolTones(jcol);
    DTMFsig = cos(2*pi*f1*LenDualTone+rand(1)) + cos(2*pi*f2*LenDualTone+rand(1));
    xx(n1:n1+length(LenDualTone)-1) = DTMFsig;
    n1 = n1 + length(LenDualTone);
    if kk < numKeys
        xx(n1:LenSilence) = 0;
        n1 = n1 + length(LenSilence);
    end
end
plotspec(xx,fs);
grid on 
title('Lab 3 Homework: Part 4.2')
soundsc(xx,fs);
end