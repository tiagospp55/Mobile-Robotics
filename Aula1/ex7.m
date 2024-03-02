clc;
close all;
clear all;

addpath ../Functions/

Pi = [0 0]; %Starting positionç
Pf = [15 14];
S = [10 5] % Source Position
a = pi/4; % Starting position

ST = 100; %Simulation Steps
ang = inf
k = 10; %sensibility

Dt = 1; % Delta time
N = 100;

R = [0 0 2
     1 -1 0];

Rh = R; Rh(3,:) = 1; % homogeneus version

MM = traject(Pi,Pf,N);
M = MM.xy;
TT = MM.T;

plot(Pi(1), Pi(2), '*r');

P = Pi;

allxy = []
allangle = []
allv = []

for n = 1:ST
    d = norm(P-S)
    v = k/d^2
    P = P+v*[cos(ang); sin(ang)]*Dt;
    allv(n) = v;
    vprev = v;
    allxy = cat(2, allxy, P)
    allangle = cat(2, allangle, ang);
end

while 1 
    for n = 1:width(allxy)
        T = transl(allxy(:,n))*rotat(n);
        nR = T*Rh; hR.XData=nR(1,:); hR.YData = nR(2,:);
        pause(0.05)
        if n == 1; pause; end
    end
    pause(1);
end
