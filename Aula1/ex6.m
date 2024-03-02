clc;
clear all;
close all;
%% Esta errado, pedir ao stor
P1 = [-15 8]';
P2 = [0 0]';
P3 = [30 -5]';
P4 = [20 10]';

P = [P1 P2 P3 P4];
RR = [Inf, 25, 10];
NN = [30 15 30];

allxy = [];
allangle = [];
allT = [];


R = [0 0 2
     1 -1 0];

Rh = R; Rh(3,:) = 1;

hR = fill(Rh(1,:), Rh(2,:), 'y');

%% Aplicar tranformaçoes
for n = 1:width(P)-1
    R = RR(n); N = NN(n);
    M = circtraj(P(:,n), P(:,n+1), R, N);
    plot(P(1,n), P(2,n), '*b', P(1, n+1), P(2,n+1),'*m');
    allxy = cat(2, allxy, M.xy);
    allangle = cat(2,allangle, M.angle);
    allT = cat(3, allT, M.T);
end 


axis([min(allxy(1,:)) max(allxy(1,:)) ...
     min(allxy(2,:)) max(allxy(2,:))...
     ]);
dax1 = 2*ones(4,1);
ax1 = axis; dax1 = [-dax1(1) dax1(2) -dax1(3) dax1(4)];
axis(ax1+dax1);

plot(allxy(1,:), allxy(2,:),'.r');

for n = 1:width(allxy)
    T = allT(:,:,n);
    nR = T*R;
    hR.XData = nR(1,:);
    hR.YData = nR(2,:);
    pause(0.05);
end
