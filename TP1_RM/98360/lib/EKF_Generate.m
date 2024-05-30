function [landmarkxy,P_EKF, xstate_EKF, xstate_true, num_steps] = EKF_Generate(sig_v,sig_omega,sig_r,sig_phi,beacons,v,w,th,x_interpoled,y_interpoled,Dt, Vn, Wn)
%EKF_GENERATE Summary of this function goes here
%   Detailed explanation goes here
N = size(beacons,1)-1;
B = BeaconDetection(N);

control_input_true = [];
landmarkxy = [];

for i = 1:N
    landmarkxy = [landmarkxy; i,B(i).X, B(i).Y];
end

for i = 1:length(v)
    control_input_true = [control_input_true; i, v(i), w(i)];
end

num_steps = height(control_input_true);

%Dont need the part of generating a longer circular trajectory

%generating measured control inputs by adding noises (for EKF to use)
control_input_mea     =control_input_true;
%control noises
noises_v              =randn(num_steps,1)*sig_v;
noises_omega          =randn(num_steps,1)*sig_omega;
control_input_mea(:,2)=control_input_mea(:,2)+noises_v;
control_input_mea(:,3)=control_input_mea(:,3)+noises_omega;

% Id x y th
xstate_true = [0, zeros(1,3)]; % pose at time 0
for i = 1:num_steps
    control_i = control_input_true(i,2:3);
    control_noise = [0;0];
    xstate_true = [xstate_true; i x_interpoled(i) y_interpoled(i) th(i)];
end

obs_landmark_ID = [];

for i=1:length(x_interpoled)-1
    obs_landmark_ID = [obs_landmark_ID;i randperm(N,N)];
end

obs_range_bearing = [];

for i = 1: num_steps
    
    
    % observation noises
    noise_r      =randn*sig_r;
    noise_phi    =randn*sig_phi;
    sensor_noise =[noise_r  noise_phi];

    readings = BeaconDetection(N, xstate_true(i+1,2:4));
    z = [];
    for j = 1:N 
        id = obs_landmark_ID(i,j+1);
        z = [z, id readings(id).d readings(id).a];
    end
    
    obs_range_bearing = [obs_range_bearing; i z];

end




Q = [Vn , 0; 0, Wn];
R_i=[ sig_r^2  0
      0        sig_phi^2];
xstate_EKF = [0, zeros(1,3)]; % pose at time 0
P_EKF      = 0.01*eye(3);  % initial covariance matrix

for step = 1:num_steps
    

    xstate_t = xstate_EKF(end,2:4)';
    P_t = P_EKF(end-2:end,:);

    % control input at time t
    control_t= control_input_mea(step,2:3);
    % observation data at time t+1

    obs_t1 = obs_range_bearing(step,2:end);
    
    %discretization time interval
    Delta_T=1;
    R = diag(repelem(diag(R_i), N));
    
    %using ekf function
    [xstateT1_T1,PT1_T1] = ekf(xstate_t,P_t,control_t,obs_t1,landmarkxy,Delta_T,Q,R);
    
    %update
    xstate_EKF = [xstate_EKF; step, xstateT1_T1];
    P_EKF = [P_EKF; PT1_T1];
end

error_state=xstate_EKF(:,2:4)-xstate_true(:,2:4);
error_state=[xstate_EKF(:,1),error_state];
