fs=8000;
tt=0:1/fs:0.5;
xx = cos(4000*pi*tt);
yy=xx+cos(1600*pi*tt); 
%plotspec(yy,fs,1024); 
%plotspec(yy+j*1e-9,fs,1024); %negative frequencies - shows both + and -
%frequencies now
plotspec(yy+j*1e-9,fs,128); %different section lengths - shows both + and - 
%frequencies, important if you have a frequency with varying frequency.
%More samples makes the line thinner since it will be more accurate with
%more samples. Longer window (aka section length) makes it easier to see
%signals that are very close to eachother.
colorbar
