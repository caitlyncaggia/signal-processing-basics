function [xx,tt, freqKey] = key2sinus(keynum, amp, phase, fsamp, dur)
% KEY2SINUS Produce a sinusoidal waveform corresponding to a
% given piano key number...part 3.2
%
% usage: xx = key2sinus(keynum, amp, phase, fsamp, dur )
%
% xx = the output sinusoidal waveform
% tt = vector of sampling times
% keynum = the piano keyboard number of the desired note
% amp, phase = sinusoid params
% fsamp = sampling frequency, e.g., 8000, 11025 or 22050 Hz
% dur = the duration (in seconds) of the output note
%
tt = 0:(1/fsamp):dur;
freqKey = 440*2^(-1 * (49 - keynum)/12);
%440 is the frequency of A, which is key 49. An octave has 12 keys between.
Xphasor = amp * exp(i*phase);
xx = real( Xphasor*exp(j*2*pi*freqKey*tt) );

end
