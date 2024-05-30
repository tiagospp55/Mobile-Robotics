clc;
clear all;
close all;
addpath ../Functions/
L = 0.5;
P0 = [0 0 0];
t = 5;
X = 2;
th = pi/6;
r = 1;
Dt = 0.1;

[VR,VL] = invkinDD(X,NaN,th,L,t);

for i = 0:Dt:t
    [Vx, Vy, w] = localvels(1,r,L,w1,aw2);
    R = orm(th0);
    V = inv(R) * 
end


