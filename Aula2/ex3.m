close all;
clear all;
clc;


ST = 600;
r = 1;
L = 4;
P0 = zeros(2,ST);
th0 = 0;
Dt = 0.1;
th1 = 0;
th2 = 0;

P1 = zeros(2,ST);
%% Nao consegui fazer a linha 
for n = 1:ST
    w1 = 1;
    aw2 = 1;
    w3 = 1;
    [Vx,Vy,w] = localvels(3,r,L,w1,aw2,w3);
    R = orm(th0);
    V = inv(R)*[Vx;Vy;w];
    th0 = th0 + Dt*V(3);
    P0(:,n+1) = P0(:,n) + V(1:2)*Dt;
    
    w1 = 1;
    aw2 = 1;
    w3 = 0;
    [Vx,Vy,w] = localvels(3,r,L,w1,aw2,w3);
    R = orm(th0);
    V = inv(R)*[Vx;Vy;w];
    th0 = th0 + Dt*V(3);
    P0(:,n+1) = P0(:,n) + V(1:2)*Dt;
    
end

subplot(1,2,1);
plot(P0(1,:), P0(2,:),'.');
subplot(1,2,2);
plot(P1(1,:), P1(2,:),'.');

