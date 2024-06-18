%% Robot DD
clear;
close all;
clc; 
addpath ../Functions/


ST = 400;
r = 1;
L = 4;
P0 = [0;0];
th0 = 0;
Dt = 0.1;

w1 = 0;
aw2 = 0;

P0 = zeros(2,ST);

for i = 1:ST
    w1 = 2;
    aw2 = sin(10*i*pi/ST)
    [Vx, Vy, w] = localvels(2,r,L,w1,aw2);
    R = orm(th0);
    V = inv(R) * [Vx; Vy; w];
    th0 = th0 + w*Dt
    P0(:,i+1) = P0(:,i) + V(1:2)*Dt;    

    
end

plot(P0(1,:), P0(2,:))
    
