clear
close all
clc

load('Chap3Example_n30_truekernels');

figure(1)
subplot(1,2,1)
plot(0:length(h1_true)-1,h1_true,'k','LineWidth',1.3);
axis([0 length(h1_true) 1.1*min(h1_true(:)) 1.1*max(h1_true(:))])
xlabel('\tau_1');
ylabel('h_1(\tau_1)');
subplot(1,2,2)
surf(0:length(h2_true)-1,0:length(h2_true)-1,h2_true);
axis([0 length(h2_true) 0 length(h2_true) 1.1*min(h2_true(:)) 1.1*max(h2_true(:))])
xlabel('\tau_1')
ylabel('\tau_2')
zlabel('h_2(\tau_1,\tau_2)')

% load('Chap3Example_N1000_NoiseVar1_n30_butterworthinput');
% load('Chap3Example_butterworthinput');

load('Chap3Example_N1000_NoiseVar1_n30_whiteinput');
load('Chap3Example_whiteinput');

figure(2)
subplot(2,2,1)
plot(0:length(h1_LS)-1,h1_LS,'k','LineWidth',1.3);
axis([0 length(h1_true) 1.1*min(h1_LS(:)) 1.1*max(h1_LS(:))])
xlabel('\tau_1');
ylabel('h_1(\tau_1)');
title('Least Squares Estimates');
subplot(2,2,2)
surf(0:length(h2_LS)-1,0:length(h2_LS)-1,h2_LS);
axis([0 length(h2_true) 0 length(h2_true) 1.1*min(h2_LS(:)) 1.1*max(h2_LS(:))])
xlabel('\tau_1')
ylabel('\tau_2')
zlabel('h_2(\tau_1,\tau_2)')

subplot(2,2,3)
plot(0:length(h1_REG)-1,h1_REG,'k','LineWidth',1.3);
axis([0 length(h1_true) 1.1*min(h1_REG(:)) 1.1*max(h1_REG(:))])
xlabel('\tau_1');
ylabel('h_1(\tau_1)');
title('Regularized Estimates');
subplot(2,2,4)
surf(0:length(h2_LS)-1,0:length(h2_LS)-1,h2_REG);
axis([0 length(h2_true) 0 length(h2_true) 1.1*min(h2_REG(:)) 1.1*max(h2_REG(:))])
xlabel('\tau_1')
ylabel('\tau_2')
zlabel('h_2(\tau_1,\tau_2)')


figure()
X = db(fft(input));
plot(linspace(0,0.5,length(X(1:end/2))),X(1:end/2),'k','LineWidth',1.3);
xlabel('Normalized frequency')
ylabel('Magnitude (dB)');
title('Input Spectrum');
