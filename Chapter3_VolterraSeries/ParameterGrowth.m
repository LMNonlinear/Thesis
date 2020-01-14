clear
close all
clc

dimension = 1:5;
lengths = ceil(logspace(0,2,20));
figure()
for m = dimension
    for j = 1:length(lengths)
        nm = lengths(j)
        v(j) = nchoosek(nm+m-1,m);
    end
    loglog(lengths,v,'LineWidth',1.3)
    hold on
end
grid on
xlabel('n_m')
ylabel('d_m')
legend('m=1','m=2','m=3','m=4','m=5');

dimension = 0:5;
lengths = [10 20 50 100];
v=[];
figure()
for nm = lengths
    for m = dimension
        v(m+1) = nchoosek(nm+m-1,m);
    end
    switch nm
        case 10
            semilogy(dimension,v,'o','LineWidth',1.3,'MarkerSize',7)
        case 20
            semilogy(dimension,v,'x','LineWidth',1.3,'MarkerSize',7)
        case 50
            semilogy(dimension,v,'*','LineWidth',1.3,'MarkerSize',7)
        case 100
            semilogy(dimension,v,'+','LineWidth',1.3,'MarkerSize',7)
    end
    hold on
end
grid on
xlabel('m')
ylabel('d_m')
legend('n_m=10','n_m=20','n_m=50','n_m=100');
axis([0 5.2 1 2e8])