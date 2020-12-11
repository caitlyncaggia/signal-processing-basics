[ecgsig,fs,fint] = ECGmakeSig15('ccaggia3');
newecg = filter(zeros, poles, ecgsig);

%plot in time domain
figure
subplot(211)
plot(ecgsig)
title('Old Signal')
subplot(212)
plot(newecg)
title('New Signal')

%plot spectrograms
figure
subplot(211)
spectrogram(ecgsig)
title('Old Signal')
subplot(212)
spectrogram(newecg)
title('New Signal')
