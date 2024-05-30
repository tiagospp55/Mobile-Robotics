clc;
clear all;
close all;

d = 0.2;
L = 0.8;

pulses = 1024;

S= [0,219,442,674,875,1113,1350,1520,1744,2001,2214,2440,2723,2934,3127,3399,3594,3860,4080,4321,4533,4701];
a= [0, 0, 5, 5, 8, 8, 10, 10, 10, 12, 10, 7, 6, 3, -4, -8, -10, -12, -14, -12, -10, -8];

theta = zeros(numel(S), 1);
x = 0;
y = 0;

k = (pi*d)/(1*pulses);

for i =2: numel(S)
    dS = k*(S(i)-S(i-1));
    theta(i) = theta(i-1) + (dS/L) * sin(deg2rad(a(i)));
    x(i) = x(i-1) + dS * cos(deg2rad(a(i)))*cos(theta(i));
    y(i) = y(i-1) + dS * cos(deg2rad(a(i)))*sin(theta(i))
end

plot(x,y)