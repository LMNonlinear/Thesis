clear
close all
clc

load('Chap3_ThirdOrderKernel');
load('Chap3Example_n30_truekernels');
h3_true = theta3;
n3 = length(theta3);
trunc3 = 3;
%Plot 3-dimensional kernel
i = 1; xx = zeros(1,(trunc3+1)^3);
h3 = zeros(1,(trunc3+1)^3);
yy = zeros(1,(trunc3+1)^3);
zz = zeros(1,(trunc3+1)^3);
for x = 0:trunc3
    for y = 0:trunc3
        for z = 0:trunc3
            xx(i) = x; yy(i) = y; zz(i) = z; h3(i) = h3_true(x+1,y+1,z+1);
            i = i+1;
        end
    end
end

% slice(0:trunc3,0:trunc3,0:trunc3,db(h3_true(1:trunc3+1,1:trunc3+1,1:trunc3+1)),[],[],0:trunc3)
% colormap jet
% colorbar

figure()
scatter3(xx,yy,zz,35,h3./max(h3),'filled')
colormap jet
colorbar
axis([0 3 0 3 0 3])
xlabel('\tau_1'); ylabel('\tau_2'); zlabel('\tau_3');

%%
figure()
n2 = length(h2_true);
surf(0:20,0:20,h2_true(1:21,1:21));
colormap jet
xlabel('\tau_1'); ylabel('\tau_2'); zlabel('h_2(\tau_1,\tau_2)');

%%
figure()
plot(h1_true./max(h1_true),'b','LineWidth',1.5);
xlabel('\tau_1'); ylabel('h_1(\tau_1)');
axis([1 25 -0.5 1.2])

%%
figure()
plot(0:20,ones(1,21),'b','LineWidth',1.5);
xlabel('t'); ylabel('h_0')
