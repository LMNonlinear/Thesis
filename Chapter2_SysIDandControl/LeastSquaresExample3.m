clear 
close all
clc

%% GOOD Est 1

n = 70;
n1=n;
N = 2000;
SNR = 100;

b = [0 1];
a = [1 -1.8 0.83];

input = normrnd(0,1,N,1);
y0 = filter(b,a,input);
e = normrnd(0,sqrt(var(y0)/SNR),length(y0),1);
y = y0+e;
noise_std = std(e);

Y = y(n:N);

%form PHI_1N

PHI = zeros(n,(N-n+1));

for k = n:N
    PHI(:,k-n+1) = flip(input(k-n+1:k));
end

%---Formulate and solve the least squares problem

N = length(y);

Y = y(n:N);

%form PHI_1N

PHI = zeros(n1,(N-n+1));

for k = n:N
    PHI(:,k-n+1) = flip(input(k-n+1:k));
end

THETA_LS = PHI'\Y;

%Seperate kernels

h1_LS = THETA_LS(1:n);

figure();
plot(h1_LS);


%---Regularisation-------------------------------

%Y = Y';
nml = PHI*PHI';

options = optimoptions('fmincon','TolFun',1e-3,'TolX',1e-3,'UseParallel',1);

c10 = 1;
lambda10 = 0.8;
std0 = noise_std;

f = @(x)TCfunc_new(x,PHI,Y,n);
tic
x_final = fmincon(f,[c10; lambda10; std0], [], [], [], [],[0; 0.3; 0], [Inf; 1; Inf],[],options);

c1 = x_final(1);
lambda1 = x_final(2);
std = x_final(3);
toc

%-----------Form the final penalty matrix---------------------------

P1 = zeros(n);
for j = 1:n
    for k = 1:n
        P1(j,k) = c1*lambda1^(max([j k]));
    end
end

L = chol(P1,'lower');
%form thin QR matrix
Rd = triu(qr([PHI' Y]));
Rd1 = Rd(1:n+1,1:end-1);
Rd2 = Rd(1:n+1,end);
R = triu(qr([Rd1*L Rd2; noise_std*eye(n) zeros(n,1)]));
R1 = R(1:n,1:n);
R2 = R(1:n,end);
r = R(n+1,n+1);

THETA_REG = L*(R1\R2);

%Seperate kernels

h1_REG = THETA_REG(1:n);

figure();
plot(h1_REG);

h1_REG_easy = h1_REG;