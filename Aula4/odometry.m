clc;
close all;
clear all;

d = 0.2;
L = 0.6;

CR=[0,223,446,669,892,1115,1338,1561,1784,2007,2230,2453,2676,2899,3122,3345,3568,3791,4014,4237,4460,4683];
CL=[0,120,240,360,480, 600, 720, 840, 960, 810, 750, 690, 630, 570, 510, 450, 621, 873,1125,1377,1629,1881];

dR = 223;
dL = 120;

k = (pi*d)/(1*2048);

x = 0;
theta = zeros(numel(CR),1)
y = 0;

for i = 2:numel(CR)
    NCR = CR(i) - CR(i-1);
    NCL = CL(i) - CL(i);

    DiL = k * NCL;
    DiR = k * NCR;

    Dth = (DiR - DiL)/d;   
    Di =  (DiR - DiL)/2;

    theta(i) = theta(i-1) + Dth;
    x(i) = x(i-1) + Di * cos(theta(i))
    y(i) = y(i-1) + Di * sin(theta(i)) 
end 

plot(x,y)
% xlabel('X'); ylabel('Y')
% grid on;
% axis equal;
% title("x=", num2string(x(i),2) + ";y =" + num2string(y(i),2) + "\theta=" + num2sttring(theta(i)*180/pi,2)+"\circ");
% 
% hold on
% ss = 1;
% dCr = diff(CR);
% dCl = diff(CL);
%text(x(2:ss:end))