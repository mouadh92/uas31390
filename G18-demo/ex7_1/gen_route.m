function [route_scaled] = gen_route(start, end_)
% Input the map
load('auto_wall.txt')
wall = auto_wall;

% Define the map size
max_x = wall(length(wall) - 2, 1);
max_y = wall(length(wall) - 2, 2);
max_z = wall(length(wall) - 2, 3);
map = zeros(max_x, max_y, max_z);

% Input the obstacles into the map
for i = 1:(length(wall) - 3)
    map = gen_square3d([wall(i, 1) wall(i, 1) + 1;...
                        wall(i, 2) wall(i, 2) + 1;...
                        wall(i, 3) wall(i, 3) + 1], map);
end

% Path planning
route_Astar = Astar_3d(map, start, end_);

% Connect all the waypoints along one direction
route_Astar_optimized = optimize_route(route_Astar);

% Draw a figure to show the map and process
figure('Name','Astar')
% Mark the start with green
scatter3(start(1)+0.5, start(2)+0.5, start(3)+0.5, ...
         500, [0,1,0],'filled')
hold on

% Mark the end with red
scatter3(end_(1)+0.5, end_(2)+0.5, end_(3)+0.5, ...
         500, [1,0,0], 'filled')
hold on

% Draw the obstacles
for i = 1:(length(wall) - 3)
    map = gen_square3d([wall(i, 1) wall(i, 1) + 1;...
                        wall(i, 2) wall(i, 2) + 1;...
                        wall(i, 3) wall(i, 3) + 1], map, 1);
end

% Set the axes
axis([1 max_x+1 1 max_y+1 1 max_z+1])
% Make the grid lines more visible
ax = gca;
ax.GridAlpha = 1.0;
grid on
set(gca, 'xtick', [0:1:max_x])
set(gca, 'ytick', [0:1:max_y])
set(gca, 'ztick', [0:1:max_z])

% Draw the route
route_ = route_Astar_optimized;

for i = 2:length(route_)
    plot3([route_(i-1,1)+0.5,route_(i,1)+0.5], ...
          [route_(i-1,2)+0.5,route_(i,2)+0.5], ...
          [route_(i-1,3)+0.5,route_(i,3)+0.5], ...
          'color',[0,0,0],'linewidth',5)
    hold on
end
hold off

% Scale the route
x_scale = 0.65;
y_scale = 0.55;
z_scale = 0.60;

x_offset = 0.3;
y_offset = 0.5;
z_offset = 0.6;

% Make a copy of the route
route_scaled = route_;

% Scale the copy
route_scaled(:,1) = (route_scaled(:,1) - 1) * x_scale + x_offset;
route_scaled(:,2) = (route_scaled(:,2) - 1) * y_scale + y_offset;
route_scaled(:,3) = (route_scaled(:,3) - 1) * z_scale + z_offset;
