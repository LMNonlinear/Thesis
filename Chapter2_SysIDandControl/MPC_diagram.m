clear 
close all
clc

PastFutureLine = 0:0.01:10;
ReferenceLine = 9.5*ones(1,100);

PriorInputSamples =     [0 1 1 2 2 3 3 4 4 5];
PriorInput =            [4 4 5 5 3 3 3.5 3.5 2.5 2.5];
PriorOutputSamples =    [0 1 2 3 4 5];
PriorOutput =           [7 7.5 6.8 6.5 7 7.2];

FutureInputSamples =    [5 5 6 6 7 7 8 8 9 9 10 10 11 11 12 12 13 13 14];
FutureInput = [2.5 2 2 1.5 1.5 1 1 0.5 0.5 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3];

FutureOutputSamples = 5:14;
t = FutureOutputSamples-5;
FutureOutput = (PriorOutput(end))*exp(-t/5) + ReferenceLine(end)*(1-exp(-t/5));



figure()
plot(PriorInputSamples,PriorInput,'k','LineWidth',1.3);
hold on
plot(PriorOutputSamples,PriorOutput,'ro-','LineWidth',1.3);

plot(5*ones(size(PastFutureLine)),PastFutureLine,'k')

plot(FutureInputSamples,FutureInput,'k--','LineWidth',1.3);

plot(linspace(0,FutureInputSamples(end),length(ReferenceLine)),ReferenceLine,'r','LineWidth',1.2)

plot(FutureOutputSamples,FutureOutput,'ro--','LineWidth',1.3);