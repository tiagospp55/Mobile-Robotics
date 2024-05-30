clc;
clear all;
close all;

ST = 400;
r = 1;
L = 4;
PDD = zeros(2,ST);
th0 = 0;
Dt = 0.1;

w1 = 2;
aw2 = 0;

for i = 1:ST
    aw2 = sin(10*i*pi/ST);
    [Vx,Vy,w] = localvels(2,r,L,w1,aw2);
    
    R = orm(th0);
    th0 = th0 + w*Dt;
    V = inv(R) * [Vx;Vy;w];
    PDD(:,i+1) = PDD(:,i) + V(1:2)*Dt;
end

plot(PDD(1,:), PDD(2,:));