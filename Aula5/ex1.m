clc;
clear all;
close all;
addpath ../Functions/
B = [0 5];
P1 = [2 0];

Dt = 0.2;
V = 2;

th = 50*pi/180;
totalTime = 5;

plot(B(1), B(2), 'r.', 'MarkerSize',20);
axis equal;
axis([0 10 0 10]);

grid on;
hold on;

NN = totalTime/Dt;

x(1) = P1(1);
y(1) = P1(2);
plot(x(1), y(1), 'ob');

alpha = pi- th +atan2(B(2)-P1(2), B(1)-P1(1));
for n = 2:NN
    x(n) = x(n-1) + V*Dt*cos(th);
    y(n) = y(n-1) + V*Dt*sin(th);
    plot(x(n), y(n), 'ob')
    
    %calculate localization using getbdir
    
    b = pi - getbdir(B,[x(n),y(n)], th, 1);
    P = [x(n) y(n)];
    L1 = norm(P-P1);
    L2 = L1 * sin(alpha)/sin(alpha+b);

    x1 = B(1) + L2*cos(th-b);
    y1 = B(2) + L2*sin(th-b);
    
    plot(x1,y1, 'r*');
end
