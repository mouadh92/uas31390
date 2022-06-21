%% Initialization

close all
clear
clc

% load('uas_thrust_data.mat')
load('acc.mat')
load('pwm.mat')

g = 9.81;

%% Identification
t1 = 5;
t2 = 15;
indices = out.pwm.Time > t1 & out.pwm.Time < t2;

%%
figure
plot(acceleration.Time, acceleration.Data - g)
grid on
hold all
plot(pwm.Time, pwm.Data/60000)
ylim([-10 10])

%%
x = pwm.Data(indices)/60000;
y = acceleration.Data(indices) - g;
result = uas_fit(x, y);
p1 = result.p1;
p2 = result.p2 - 3;
save('uas_thrust_constants.mat', 'p1', 'p2')

