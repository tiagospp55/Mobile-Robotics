function rm_98360(N,Dt,r,L,Vn,Wn)

addpath lib/
close all;clc;

if nargin<6
    Wn=0.1; 
end
if nargin<5
    Vn=0.1; 
end
if nargin<4
    L=1; 
end
if nargin < 3
r=0.15; 
end
if nargin < 2
    Dt = 1; 
end
if nargin < 1
    N = 4; 
end



x=[0,0,0];
Vlinear=5;


sig_v     = 0.1;
sig_omega = 0.1;
sig_r   = 0.1;
sig_phi = 0.1;
obs_noise=[0.25, 0.1];

B=BeaconDetection(N,x,obs_noise);

[x,y,beacons,number_steps] = linear_path(B, Vlinear, Dt);
[x_interpoled,y_interpoled] = pchip_path(beacons,number_steps);
plot_paths(x,y,x_interpoled,y_interpoled,beacons);

[w,v,dth,th]=velocities(x_interpoled,y_interpoled,Wn,Vn,Dt);
plot_velocities(w,v,dth,th);

[landmarkxy,P_EKF, x_state_EKF, x_state_true, number_steps]=EKF_Generate(sig_v,sig_omega,sig_r,sig_phi,beacons,v,w,th,x_interpoled,y_interpoled,Dt, Vn, Wn);
arrowproperties = 2;
plot_ekf_data(landmarkxy,P_EKF, x_state_EKF, x_state_true,number_steps,arrowproperties)
[DD_r,DD_l,TRI_v, f_alpha] = motiommodelDD_TRI(x_state_EKF,Dt,r,L,Vn,Wn);B
plot_model_velocities(DD_r,DD_l,TRI_v, f_alpha);




for i=1:length(x_state_EKF)
    error(i)=norm(x_state_EKF(i,2)-x_state_true(i,2));
end

error_avg_x=mean(error);
error_min_x=min(error);
error_max_x=max(error);
error_mdev_x=std(error);

for i=1:length(x_state_EKF)
    error(i)=norm(x_state_EKF(i,3)-x_state_true(i,3));
end

error_avg_y=mean(error);
error_min_y=min(error);
error_max_y=max(error);
error_mdev_y=std(error);

for i=1:length(x_state_EKF)
    error(i)=norm(x_state_EKF(i,4)-x_state_true(i,4));
end

error_avg_th=mean(error);
error_min_th=min(error);
error_max_th=max(error);
error_mdev_th=std(error);



DIR = 'output';

if ~exist(DIR, 'dir')
    mkdir(DIR)
end


xstate_file=fopen(fullfile(DIR, 'loc_98360.txt'),'wt');
for i =1:length(x_state_EKF)
    fprintf(xstate_file,'%f ,%f, %f,%f \n',x_state_EKF(i,1),x_state_EKF(i,2),x_state_EKF(i,3),x_state_EKF(i,4));
end
fclose(xstate_file);


dd_file= fopen(fullfile(DIR, 'DD_98360.txt'),'wt');
for i=1:length(DD_r)
    fprintf(dd_file,'%f ,%f\n',DD_r(i),DD_l(i));
end
fclose(dd_file);

tri_file= fopen(fullfile(DIR, 'TRI_98360.txt'),'wt');
for i =1:length(TRI_v)
    fprintf(tri_file,'%f ,%f\n',TRI_v(i), f_alpha);
end
fclose(tri_file);



end


