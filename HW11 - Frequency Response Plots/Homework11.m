ww = -pi:1/100:pi;

% Haz = 1 + z^(-1) and z = exp(j*ww)
Hafr = 1 + exp(-j*ww);
figure
subplot(211)
plot(ww,abs(Hafr))
title('Magnitude of Frequency Response Ha')
subplot(212)
plot(ww,angle(Hafr))
title('Phase of Frequency Response Ha')
xlabel('Normalized Radian Frequency')

% Hbz = HazHaz so Hbfr = HafrHafr
Hbfr = Hafr .* Hafr;
figure
subplot(211)
plot(ww,abs(Hbfr))
title('Magnitude of Frequency Response Hb')
subplot(212)
plot(ww,angle(Hbfr))
title('Phase of Frequency Response Hb')
xlabel('Normalized Radian Frequency')

%Hcz = HbzHbz so Hcfr = HbfrHbfr
Hcfr = Hbfr .* Hbfr;
figure
subplot(211)
plot(ww,abs(Hcfr))
title('Magnitude of Frequency Response Hc')
subplot(212)
plot(ww,angle(Hcfr))
title('Phase of Frequency Response Hc')
xlabel('Normalized Radian Frequency')


