clc;
clear all;
close all;

ST = 600;
r = 1;
L = 4;
P0 = zeros(2,ST);
th0 = 0;
Dt = 0.1;
th1 = 0;
th2 = 0;

PTRI = zeros(2,ST);
POMNI = zeros(2,ST);

for n = 1:ST
    w1 = 2*sin(n*pi/ST);
    aw2 = 0.25 *sin(2*n*pi/ST);
    w3 = sin(n*pi/ST);

    [Vx,Vy,w] = localvels(1,r,L,w1,aw2);
    R = orm(th0);
    th0 = th0 + Dt*w;
    V = inv(R)*[Vx;Vy;w];
    P0(:,n+1) = P0(:,n) + V(1:2)*Dt;

    [Vx,Vy,w] = localvels(2,r,L,w1,aw2);
    R = orm(th1);
    th1 = th1 + Dt*w;
    V = inv(R)*[Vx;Vy;w];
    PTRI(:,n+1) = PTRI(:,n) + V(1:2)*Dt;
    
    [Vx,Vy,w] = localvels(3,r,L,w1,aw2,w3);
    R = orm(th2);
    V = inv(R)*[Vx;Vy;w];
    th2 = th2 + Dt*V(3);
    POMNI(:,n+1) = POMNI(:,n) + V(1:2)*Dt;

end

subplot(1,3,1);
plot(P0(1,:), P0(2,:),'.');
subplot(1,3,2);
plot(PTRI(1,:), PTRI(2,:),'.');
subplot(1,3,3);
plot(POMNI(1,:), POMNI(2,:),'.');
