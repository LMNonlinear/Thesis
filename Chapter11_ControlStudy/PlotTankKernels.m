clear 
close all
clc

load('EM_3rdOrder_exp1_005')

figure()
subplot(1,2,1)
plot(1:15,ALPHA1_REG,'k-o','LineWidth',1.3)
xlabel('i_1')
ylabel('\alpha_1(i_1)')
axis([1 15 -0.3 0.1])
subplot(1,2,2)
surf(1:15,1:15,ALPHA2_REG)
colormap jet
xlabel('i_1')
ylabel('i_2')
zlabel('\alpha_2(i_1,i_2)')
axis([1 15 1 15 -0.005 0.015])