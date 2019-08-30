close all
clear
clc

load('SecondOrderExample')

% figure()
% subplot(1,2,1)
% surf(0:length(g_fu)-1,0:length(g_fu)-1,g_fu)
% shading interp
% colormap gray
% xlabel('t_1');
% ylabel('t_2');
% zlabel('g_2^1(t_1,t_2)');
% axis([0 length(g_fu)-1 0 length(g_fu)-1 -1.1*max(g_fu(:)) 1.1*max(g_fu(:))])
% subplot(1,2,2)
% surf(0:length(g_ff)-1,0:length(g_ff)-1,g_ff)
% shading interp
% colormap gray
% xlabel('t_1');
% ylabel('t_2');
% zlabel('g_2^2(t_1,t_2)');
% axis([0 length(g_fu)-1 0 length(g_fu)-1 -1.1*max(g_ff(:)) 1.1*max(g_ff(:))])

figure()
subplot(1,2,1)
surf(0:length(g_fu)-1,0:length(g_fu)-1,g_fu)
shading interp
colormap gray
xlabel('t_1');
ylabel('t_2');
zlabel('g_2^1(t_1,t_2)');
axis([0 length(g_fu)-1 0 length(g_fu)-1 1.1*min(g_fu(:)) 1.1*max(g_fu(:))])
subplot(1,2,2)
surf(0:length(g_ff)-1,0:length(g_ff)-1,g_ff)
shading interp
colormap gray
xlabel('t_1');
ylabel('t_2');
zlabel('g_2^2(t_1,t_2)');
axis([0 length(g_fu)-1 0 length(g_fu)-1 1.1*min(g_ff(:)) 1.1*max(g_ff(:))])

N = length(Tk1);
figure()
subplot(1,2,1)
plot(0:N-1,db(Tk2/N),'r-.');
hold on
plot(0:N-1,db(Tk3/N),'b--');
plot(0:N-1,db(2*Tk2/N+Tk3/N),'k')
legend('T_2^1(k)','T_2^2(k)','T_2(k)')
ylabel('Magnitude (dB)')
xlabel('k')
axis([0 30 0 70]);
subplot(1,2,2)
plot(0:N-1,ifft(Tk2/N),'r-.');
hold on
plot(0:N-1,ifft(Tk3/N),'b--');
plot(0:N-1,ifft(2*Tk2/N+Tk3/N),'k')
%legend('t_2^1(t)','t_2^2(t)','t_2(t)')
ylabel('Time domain transient')
xlabel('t')
%axis([0 N-1 0 70]);