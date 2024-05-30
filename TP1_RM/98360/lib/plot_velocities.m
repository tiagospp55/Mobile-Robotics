function plot_velocities(w,v,dth,th)
%PLOT_VELOCITIES Summary of this function goes here
%   Detailed explanation goes here

figure("Name","Linear and Angula Velocity");
subplot(2,1,1);
plot(v);
title("Linear Velocity")
subplot(2,1,2);
plot(w);
title("Angular Velocity")

figure("Name","Theta Representation")
subplot(2,1,1);
plot(th);
title("Theta");
subplot(2,1,2);
plot(dth);
title("Delta Theta");
end

