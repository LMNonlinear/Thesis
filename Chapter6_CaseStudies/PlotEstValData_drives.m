clear
close all
clc

load('DATAUNIF.mat')

uEst = u11; uVal = u12;
yEst = z11; yVal = z12;
Ts = 1/50;

N = length(uEst);
time = 0:Ts:Ts*(N-1);
fs = 1/Ts;
bin = fs/N;
ff = 0:bin:fs-bin;

figure()

subplot(2,1,1)

plot(time,uEst,'b','LineWidth',1.3)
hold on
plot(time,uVal,'r','LineWidth',1.3)
xlabel('time (s)')
ylabel('drives input (V)')
title('input signals')
%axis([0 Ts*(N-1) 0 8])

subplot(2,1,2)

plot(time,yEst,'b','LineWidth',1.3)
hold on
plot(time,yVal,'r','LineWidth',1.3)
xlabel('time (s)')
ylabel('angular velocity (V)')
title('output signals')
axis([0 10 -1 4])

% subplot(2,2,3)
% 
% UEst = fft(uEst); UVal = fft(uVal);
% plot(ff(1:end/2),db(UEst(1:end/2)),'b','LineWidth',1.3)
% hold on
% plot(ff(1:end/2),db(UVal(1:end/2)),'r','LineWidth',1.3)
% xlabel('frequency (Hz)')
% ylabel('magnitude (dB)')
% title('input signals')
% %axis([0 fs/2 -400 100])
% 
% subplot(2,2,4)
% 
% YEst = fft(yEst); YVal = fft(yVal);
% plot(ff(1:end/2),db(YEst(1:end/2)),'b','LineWidth',1.3)
% hold on
% plot(ff(1:end/2),db(YVal(1:end/2)),'r','LineWidth',1.3)
% xlabel('frequency (Hz)')
% ylabel('magnitude (dB)')
% title('output signals')
% %axis([0 fs/2 -50 100])