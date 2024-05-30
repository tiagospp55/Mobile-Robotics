function plot_paths(x,y,x_interpoled, y_interpoled,beacons)
%PLOT_PATHS Summary of this function goes here
%   Detailed explanation goes here
figure("Name","Pchip path");
plot( x_interpoled,y_interpoled);
hold on 
plot(beacons(:,1), beacons(:,2), "bo", "MarkerSize",6);
hold on
for i = 1:length(x_interpoled)
    plot([x_interpoled(i), x_interpoled(i)], [0, y_interpoled(i)], '--','Color','c');
end
xlabel('X');
ylabel('Y');



figure("Name","Direct Path");
plot(x,y, "-r");
hold on
plot(beacons(:,1), beacons(:,2),"bo","MarkerSize",6)
xlabel('X');
ylabel('Y');


figure("Name","Comparison PChip and Direct paths")
plot( x_interpoled,y_interpoled);
hold on 
plot(beacons(:,1), beacons(:,2), "bo", "MarkerSize",6);
hold on
for i = 1:length(x_interpoled)
    plot([x_interpoled(i), x_interpoled(i)], [0, y_interpoled(i)], '--','Color','c');
end
hold on
plot(x,y, "-r");

end

