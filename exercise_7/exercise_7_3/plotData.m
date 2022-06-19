%% INITIALIZATION
clear
close all
clc

load('Pos')
load('refPos')

%% 
t1 = 0;
t2 = 20;
indices = Pos.Time > t1 & Pos.Time < t2;
time = Pos.Time(indices1)-t1;

figure(1)
plot(Pos.Data(indices,1),Pos.Data(indices,2))
hold on
plot(squeeze(refPos.Data(1,1,indices)),squeeze(refPos.Data(2,1,indices)))
hold off
xlabel('x'); ylabel('y');
legend('Trajectory','Reference')
