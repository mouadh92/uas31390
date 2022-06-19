%% INITIALIZATION
clear
close all
clc

load('Pos')
load('refPos')

%%
plot3(Pos.Data(:,1),Pos.Data(:,2),Pos.Data(:,3))
hold on
plot3(refPos.Data(:,1),refPos.Data(:,2),refPos.Data(:,3))
hold off
grid on
xlabel('x'); ylabel('y'); zlabel('z');
legend('Trajectory','Reference')