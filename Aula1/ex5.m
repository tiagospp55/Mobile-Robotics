clc;
close all;
clear all;

addpath ../Functions/

R = [0 0 2
     1 -1 0];

Rh = R; Rh(3,:) = 1; % homogeneus version

hR = fill(Rh(1,:), Rh(2,:), 'y');
axis equal; grid on; hold on;

P1 = [-15 -8]';
P2 = [15 4]';
N = 50;

MM = circtraj(P1,P2,5,N);

M = MM.xy;
TT = MM.T;

plot(P1(1),P1(2), '*b', P2(1),P2(2), '*m');
plot(M(1,:), M(2,:), 'r');
axis([-20 20 -20 20]);

for n= 1:N
    T = TT(:,:,n);
    nR = T * Rh;
    hR.XData = nR(1,:);
    hR.YData = nR(2,:);
    pause(0.05);
end