%% Robot DD
clear;
close all;
clc; 
addpath ../Functions/


ST = 200;
r = 1;
L = 4;
P0 = [0;0];
th0 = 0;
th1 = 0;
th2 = 0;
Dt = 0.1;

w1 = 1;
aw2 = 1;
w3 = 1;
PDD = zeros(2, ST);
PTRI = zeros(2,ST);
POMNI = zeros(2,ST);

for i = 1:ST
    [Vx, Vy, w] = localvels(1,r,L,w1, aw2);
    R = orm(th0);
    V = inv(R) * [Vx; Vy; w];
    PDD(:,i+1) = PDD(:,i) + V(1:2)*Dt;
    
    [Vx, Vy, w] = localvels(2,r,L,w1, aw2);
    
    R = orm(th1);
    V = inv(R) * [Vx; Vy; w];
    th1 = th1 + V(3)*Dt;
    PTRI(:,i+1) = PTRI(:,i) + V(1:2)*Dt;
    

    [Vx, Vy, w] = localvels(3,r,L,w1, aw2, w3);

    R = orm(th2);
    V = inv(R) * [Vx; Vy; w];
    th2 = th2 + V(3)*Dt
    POMNI(:,i+1) = POMNI(:,i) + V(1:2)*Dt;
end

subplot(1,3,1);
plot(PDD(1,:), PDD(2,:));
subplot(1,3,2);
plot(PTRI(1,:), PTRI(2,:));
subplot(1,3,3);
plot(POMNI(1,:), POMNI(2,:))
    
