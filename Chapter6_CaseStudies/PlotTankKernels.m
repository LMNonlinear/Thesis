clear 
close all
clc

load('LBF_Kernels_DC_Score58')

figure()
subplot(1,2,1)
plot(1:15,alpha1,'k-o','LineWidth',1.3)
xlabel('i_1')
ylabel('\alpha_1(i_1)')
subplot(1,2,2)
surf(1:10,1:10,alpha2)
colormap jet
xlabel('i_1')
ylabel('i_2')
zlabel('\alpha_2(i_1,i_2)')