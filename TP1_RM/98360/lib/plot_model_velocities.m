function plot_model_velocities(DD_r,DD_l,TRI_v, f_alpha)
%PLOT_MODEL_VELOCITIES Summary of this function goes here
%   Detailed explanation goes here

DD_r
figure("Name",'Differential Drive(velocities)')
plot(1:length(DD_l),DD_l,'b')
hold on
plot(1:length(DD_r),DD_r,'r')
xlabel('Time')
ylabel('Angular Velocity')
legend('Left Wheel','Right Wheel')

figure("Name","Tricycle Velocity and angle")
subplot(2,1,1)
plot(1:length(TRI_v),TRI_v,'b')
xlabel('Time')
ylabel('Velocity')
subplot(2,1,2)
plot (1:length(f_alpha),f_alpha,'b')
hold on
xlabel('Time')
ylabel('Angular Velocity')


end

