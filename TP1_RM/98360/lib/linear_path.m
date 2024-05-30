function [x,y,beacons, steps] = linear_path(B, Vn, Dt)

beacons = [0 0];
steps = [];
x = [];
y = [];
steps = [round(sqrt((B(1).X)^2+(B(1).Y)^2))]

x = linspace(0,B(1).X, steps(1));
y = linspace(0, B(1).Y, steps(1));

for i = 1:length(B)-1 
    B1 = B(i);
    B2 = B(i+1);
    number_steps = round(sqrt((B2.X-B1.X)^2 + (B2.Y-B1.Y)^2) / (Vn*Dt));
    steps = [steps; number_steps];
    x = [x linspace(B1.X,B2.X, number_steps)];
    y = [y linspace(B1.Y,B2.Y, number_steps)];
end


for i = 1:length(B)
    beacons = [beacons; B(i).X B(i).Y];
end


end











