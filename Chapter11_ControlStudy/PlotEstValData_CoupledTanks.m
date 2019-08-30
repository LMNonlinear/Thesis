clear
close all
clc

load('exp1_008.mat');
input_right = exp1_008.Y(1).Data;
output_left = exp1_008.Y(2).Data;

N = floor(length(input_right)/2);
Ts = 10;

uEst = input_right(1:N);
yEst = output_left(1:N);
tt = 0:Ts:Ts*(N-1); 

uVal = input_right(N+1:2*N);
yVal = output_left(N+1:2*N);

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
xlabel('Time (s)')
ylabel('Pump input (V)')
title('Input signals')
axis([0 Ts*(N-1) 1 6])

subplot(2,1,2)

plot(time,yEst,'b','LineWidth',1.3)
hold on
plot(time,yVal,'r','LineWidth',1.3)
xlabel('Time (s)')
ylabel('Water level (V)')
title('Output signals')
axis([0 Ts*(N-1) 0 8])