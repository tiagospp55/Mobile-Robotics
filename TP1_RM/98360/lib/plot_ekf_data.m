function plot_ekf_data(landmarkxy,P_EKF, xstate_EKF, xstate_true, num_steps,arrowproperties)
%PLOT_EKF_DATA Summary of this function goes here
%   Detailed explanation goes here

if nargin < 6
    arrowproperties = 2;
end

figure("Name","EKF Data")


plot(landmarkxy(:,2),landmarkxy(:,3),'k*','MarkerSize',14); %,'linewidth',6)
text(landmarkxy(:,2)+0.2,landmarkxy(:,3),num2str(landmarkxy(:,1)),'fontweight','bold','fontsize',14)
grid on

hold on
for i=0:num_steps
    uncer_p = P_EKF(i*3+1:i*3+2, 1:2);        % get the xy covariance
    
    uncer_x = xstate_EKF(i+1,2);
    uncer_y = xstate_EKF(i+1,3);
    CV=GetCov(uncer_p,uncer_x,uncer_y);  % by wangzhan, make it large on purpose, not now
    plot(CV(1,:),CV(2,:),'-b');
    
    plot(xstate_EKF(i+1,2),xstate_EKF(i+1,3),'bo','linewidth',2);

    dx = arrowproperties*cos(xstate_EKF(i+1,4));
    dy = arrowproperties*sin(xstate_EKF(i+1,4));
    quiver(xstate_EKF(i+1,2),xstate_EKF(i+1,3),dx, dy, 0, 'Color', 'b','linewidth',1.2)
    
    plot(xstate_true(i+1,2),xstate_true(i+1,3),'ro','linewidth',2);
    
    dx = arrowproperties*cos(xstate_true(i+1,4));
    dy = arrowproperties*sin(xstate_true(i+1,4));
    quiver(xstate_true(i+1,2),xstate_true(i+1,3),...
           dx, dy, 0, 'Color', 'r','linewidth',1.2)
    
end

end

