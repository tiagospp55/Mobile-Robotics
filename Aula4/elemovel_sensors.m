
m = mobiledev
g = m.Acceleration
[gx, gy, gz] = g  
y = atan2(-gx, sqrt(-gy^(2)+gz^(2)));
x = atan2(gy,gz);

% Define the vertices of the smartphone
vertices = [0.5 0.5 -0.5 -0.5 0.5 0.5 -0.5 -0.5 %
X
0.8 -0.8 -0.8 0.8 0.8 -0.8 -0.8 0.8 %
Y
0.1 0.1 0.1 0.1 -0.1 -0.1 -0.1 -0.1]; %
Z
% Define the faces of the smartphone
faces = [1 2 6 5 % front
4 3 7 8 % back
1 4 8 5 % left
2 3 7 6 % right
1 2 3 4 % top
5 6 7 8];% bottom
% Plot the initial orientation of the model
h=patch('Vertices', vertices', 'Faces', faces, 'FaceColor', 'b');
view(3);


  