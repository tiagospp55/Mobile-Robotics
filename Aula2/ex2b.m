clear;
close all;
clc; 
addpath ../Functions/

ST = 400;
r = 1;
L = 4;
P0 = zeros(2,ST);
th0 = 0;
Dt = 0.1;
w1 = 0;
aw2 = 0;

for i = 1:ST
    w1 = 2*exp(-i/ST);
    aw2 = 2*exp(-5*i/ST);
    [Vx, Vy, w] = localvels(1,r,L,w1,aw2);
    R = orm(th0);
    V = inv(R) * [Vx; Vy; w];
    th0 = th0 + w*Dt;
    P0(:, i+1) = P0(:,i) + V(1:2)*Dt;
end

plot(P0(1,:), P0(2,:),'.');