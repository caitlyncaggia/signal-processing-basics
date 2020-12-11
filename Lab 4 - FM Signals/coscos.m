function [xx,tt] = coscos( f1, f2, fs, dur )
% COSCOS multiply two sinusoids

%test case: [xn,tn] = coscos(2,3,20,1)

t1 = 0:(1/fs):dur;
%t2 = 0:(1/f2):dur;
%error is in writing t2 (line 7). should be...
t2 = 0:(1/fs):dur;
cos1 = cos(2*pi*f1*t1);
cos2 = cos(2*pi*f2*t2);
xx = cos1 .* cos2;
tt = t1;

plot(tt,xx);

end
