clear 
close all
clc

%% GOOD Est

n = 70;
N = 2000;
SNR = 100;

b = [0 1];
a = [1 -1.8 0.83];

input = normrnd(0,1,N,1);
y0 = filter(b,a,input);
e = normrnd(0,sqrt(var(y0)/SNR),length(y0),1);
y = y0+e;

Y = y(n:N);

%form PHI_1N

PHI = zeros(n,(N-n+1));

for k = n:N
    PHI(:,k-n+1) = flip(input(k-n+1:k));
end

THETA_LS = PHI'\Y;

figure()
%subplot(1,3,2)
plot(0:length(THETA_LS)-1,THETA_LS,'b','LineWidth',1.3);
hold on

%% BAD Est

n = 70;
N = 200;
SNR = 10;

b = [0 1];
a = [1 -1.8 0.83];

input = normrnd(0,1,N,1);
y0 = filter(b,a,input);
e = normrnd(0,sqrt(var(y0)/SNR),length(y0),1);
y = y0+e;

Y = y(n:N);

%form PHI_1N

PHI = zeros(n,(N-n+1));

for k = n:N
    PHI(:,k-n+1) = flip(input(k-n+1:k));
end

THETA_LS = PHI'\Y;

%subplot(1,3,3)
plot(0:length(THETA_LS)-1,THETA_LS,'r','LineWidth',1.3);

%% True Est

n = 70;
N = 100000;
SNR = 1;

b = [0 1];
a = [1 -1.8 0.83];

input = normrnd(0,1,N,1);
y0 = filter(b,a,input);
e = normrnd(0,var(y0)/SNR,length(y0),1);
y = y0;

Y = y(n:N);
PHI = zeros(n,(N-n+1));

for k = n:N
    PHI(:,k-n+1) = flip(input(k-n+1:k));
end

THETA_LS = PHI'\Y;

%subplot(1,3,1)
plot(0:length(THETA_LS)-1,THETA_LS,'k--','LineWidth',1.3);

%% Plot deets

xlabel('\tau')
ylabel('h(\tau)')
legend('N = 2000, SNR = 40dB','N = 200, SNR = 20dB','True system')
