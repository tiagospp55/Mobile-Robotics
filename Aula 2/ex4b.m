clear all;
close all;
clc;
%% Inacabado
[Rob,h] = DrawRobot(t);
Robh = [Rob; ones(1,size(Rob,2))];

for i = 1:size(P,2)-1
    dr = P(:,i+1)-P(:,i);
    th =...;
    T = ...;
    nRob = ...;
    h.XData = nRob(1,:);
    h.YData = nRob(2,:);
    pause(1/ST/Dt);
end