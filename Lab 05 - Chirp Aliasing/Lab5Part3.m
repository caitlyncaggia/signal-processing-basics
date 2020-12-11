%part 3.2
% T = 1;
% fs = 1000;
% tStop = 5;
% Amp = 1;
% tt=0:(1/fs):tStop;
% xx=Amp*abs(sin(2*pi*tt/T));
% 
% plotspec( xx+j*1e-12, fs, 5000);


%part 3.4
T = 2;
fs = 1000;
tStop = 5;
Amp = 1;
tt=0:(1/fs):tStop;
xx=Amp*abs(sin(2*pi*tt/T));
bb = plotspecDB(xx, fs, 4000, 80);

