clear
close all
clc

load('TrueBFKernels');
load('VUB_Kernels');
load('Resonant_Kernels')

figure()
subplot(1,2,1)
plot(1:length(alpha1LBF_VUB),alpha1LBF_VUB./max(alpha1LBF_VUB),'k','LineWidth',1.3)
hold on
plot(1:length(alpha1KBF_VUB),alpha1KBF_VUB./max(alpha1KBF_VUB),'r','LineWidth',1.3)
ylabel('\alpha_1(i_1) (normalized)')
xlabel('i_1')
axis([1 length(alpha1LBF_VUB) -0.6 1.2])
legend('using LBFs','using KBFs')
subplot(1,2,2)
plot(1:length(alpha1LBF_res),alpha1LBF_res./max(alpha1LBF_res),'k','LineWidth',1.3)
hold on
plot(1:length(alpha1KBF_res),alpha1KBF_res./max(alpha1KBF_res),'r','LineWidth',1.3)
xlabel('i_1')
ylabel('\alpha_1(i_1) (normalized)')
legend('using LBFs','using KBFs')
axis([1 length(alpha1LBF_VUB) -0.8 1.2])

figure()
subplot(1,2,1)
plot(0:length(h1_VUB)-1,h1_VUB./max(h1_VUB),'k','LineWidth',1.3)
ylabel('h_1(\tau_1) (normalized)')
xlabel('\tau_1')
axis([0 length(h1_VUB)-1 -0.2 1.1])
subplot(1,2,2)
plot(0:length(h1_res)-1,h1_res./max(h1_res),'k','LineWidth',1.3)
xlabel('\tau_1')
ylabel('h_1(\tau_1) (normalized)')
axis([0 length(h1_VUB)-1 -0.6 1.1])
