%% INITIALIZATION
clear
close all
clc

load('Pos')
load('refPos')

error = Pos.Data - refPos.Data;

%% Task 1
t1 = 0;
t2 = 20;
indices1 = Pos.Time > t1 & Pos.Time < t2;
time1 = Pos.Time(indices1)-t1;

figure(1)
plot(Pos.Data(indices1,1),Pos.Data(indices1,2))
hold on
scatter(0,-2,'filled','r')
hold off
xlabel('X'); ylabel('Y');
legend('Observed','Reference')

figure(2)
subplot(3,1,1)
plot(time1,Pos.Data(indices1,1))
hold on
plot(time1,refPos.Data(indices1,1))
hold off
xlabel('Time'); ylabel('X');
ylim([min(min(Pos.Data(indices1,1)),min(refPos.Data(indices1,1)))-0.2, max(max(Pos.Data(indices1,1)),max(refPos.Data(indices1,1)))+0.2])
legend('Observed','Reference')

subplot(3,1,2)
plot(time1,Pos.Data(indices1,2))
hold on
plot(time1,refPos.Data(indices1,2))
hold off
xlabel('Time'); ylabel('Y');
ylim([min(min(Pos.Data(indices1,2)),min(refPos.Data(indices1,2)))-0.02, max(max(Pos.Data(indices1,2)),max(refPos.Data(indices1,2)))+0.02])
legend('Observed','Reference')

subplot(3,1,3)
plot(time1,Pos.Data(indices1,3))
hold on
plot(time1,refPos.Data(indices1,3))
hold off
xlabel('Time'); ylabel('Z');
legend('Observed','Reference')

figure(3)
plot(time1,error(indices1,1))
hold on
plot(time1,error(indices1,2))
plot(time1,error(indices1,3))
legend('Error in X','Error in Y','Error in Z')
xlabel('Time'); ylabel('Error');
hold off

%% Task 2
t3 = 25;
t4 = 40;
indices2 = Pos.Time > t3 & Pos.Time < t4;
time2 = Pos.Time(indices2)-t3;

figure(4)
plot(Pos.Data(indices2,1),Pos.Data(indices2,2))
hold on
scatter(0,-2,'filled','r')
hold off
xlabel('X'); ylabel('Y');
legend('Observed','Reference')

figure(5)
subplot(3,1,1)
plot(time2,Pos.Data(indices2,1))
hold on
plot(time2,refPos.Data(indices2,1))
hold off
xlabel('Time'); ylabel('X');
ylim([min(min(Pos.Data(indices2,1)),min(refPos.Data(indices2,1)))-0.2, max(max(Pos.Data(indices2,1)),max(refPos.Data(indices2,1)))+0.2])
legend('Observed','Reference')

subplot(3,1,2)
plot(time2,Pos.Data(indices2,2))
hold on
plot(time2,refPos.Data(indices2,2))
hold off
xlabel('Time'); ylabel('Y');
ylim([min(min(Pos.Data(indices2,2)),min(refPos.Data(indices2,2)))-0.02, max(max(Pos.Data(indices2,2)),max(refPos.Data(indices2,2)))+0.02])
legend('Observed','Reference')

subplot(3,1,3)
plot(time2,Pos.Data(indices2,3))
hold on
plot(time2,refPos.Data(indices2,3))
hold off
xlabel('Time'); ylabel('Z');
legend('Observed','Reference')

figure(6)
plot(time2,error(indices2,1))
hold on
plot(time2,error(indices2,2))
plot(time2,error(indices2,3))
legend('Error in X','Error in Y','Error in Z')
xlabel('Time'); ylabel('Error');
hold off
