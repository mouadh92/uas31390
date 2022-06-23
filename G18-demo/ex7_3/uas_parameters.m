clear all
close all
clc
% Generate trajactory
load('hoops.mat')

density = 3;
ts = linspace(2, 36, 6);
knots = [ts(1) ts(end)];
order = 3;
start_end = [1.59 -2.60];
start = [start_end 1];
end_ = [start_end 0];

velocity = 0.5;
make_plots = 1;
adjust = [0 0 0;
          0 0 0;
          0 0 0;
          0 0 0];

poly_traj = optimal_traj(density, ts, knots, order, start, end_, velocity, adjust, -u_h1, -u_h2, u_h3, u_h4, p_h1 ,p_h2, p_h3, p_h4, make_plots);
save('poly_traj.mat', 'poly_traj')

% parameters
arm_length = 0.040;
rotor_offset_top = 0.001;

mass_drone = 0.027;
mass_mocap = 0.013;
mass_total = mass_drone + mass_mocap;

inertia_xx = 16.571710e-6;
inertia_yy = 16.655602e-6;
inertia_zz = 29.261652e-6;

pp0 = 5.484560e-4;
pp1 = 1.032633e-6;
pp2 = 2.130295e-11;
numOfMotors = 4;

l0 = -7600;
l1 = 149000;

motor_constant = 0.0000000189;
moment_constant = 0.006;

drag_coefficient = 1e-6;

x0 = 0;
y0 = 0;
z0 = 0;

max_rot_velocity = 2700;

route = [0 0 1 ; 9 0 1 ; 9 9 1];
wall_color = [0.8 0.2 0.2];
sample_time = 4e-2;
publish_rate = 1 * sample_time;

g = 9.80665 ;

allocation_matrix = ...
    [1 1 1 1
     0 arm_length 0 -arm_length
     -arm_length 0 arm_length 0
     -moment_constant moment_constant -moment_constant moment_constant] ;

mix_matrix = inv(motor_constant * allocation_matrix) ;
air_density = 1.2041;

simTime = 40;

% attitude PD
att_Kp  = 0.1; % proportional gain
att_Ki  = 0;    % integral gain
att_Kd  = 10;   % derivative gain
att_N   = 50;  % cut-off frequency

% position PID - critically damped
pos_Kp  = 0.33; % proportional gain
pos_Ki  = 0.000033;    % integral gain
pos_sat = 0.15; % saturation -

% velocity - D
pos_Kvel = 0.25;

% x - PID
posx_Kp  = 0.120; % proportional gain
posx_Ki  = 0.002;    % integral gain
posx_Kd  = 0.150;   % derivative gain
pos_N   = 25;  % cut-off frequency

% y - PID
posy_Kp  = 0.120; % proportional gain
posy_Ki  = 0.002;    % integral gain
posy_Kd  = 0.150;   % derivative gain
posy_N   = 25;  % cut-off frequency

% z - PID
posz_Kp  = 0.100; % proportional gain
posz_Ki  = 0.002;    % integral gain
posz_Kd  = 0.150;   % derivative gain
posz_N   = 25;  % cut-off frequency
