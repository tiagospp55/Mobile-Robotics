function [Vx, Vy, w] = localvels(t,r,L,w1,aw2,w3)
%LOCALVELS Vx, Vy, w - velocities in local frame
% t - type of robot:
%       1 - DD
%       2 - TRI
%       3 - OMNI
% r - traction wheel radius
% L - meaning depending on type (wheel sep/1, wheel dist/2, wheel dist/3)
% w1 - angular vel of wheel 1 (Right wheel/1, steering/2)
% aw2 - angular vel of wheel 2 (left/1) or alpha/2
% w3 - angular vel of wheel 3 (OMNI)
if nargin < 6
    w3 = 0;
end

switch t
    case 1
        M = [r/2  r/2
             0    0
             -r/L r/L];
        V = M*[aw2; w1];
        Vx = V(1);
        Vy = V(2);
        w = V(3);
    case 2 
        Vs = w1*r;
        Vx = Vs*cos(aw2);
        Vy = 0;
        w = (Vs * sin(aw2))/L;
    case 3
        M = [0 r/sqrt(3) -r/sqrt(2);
             -2*r/3 r/3 r/3;
             r/(3*L) r/(3*L) r/(3*L)];

        V = M*[w1; aw2; w3];
        Vx = V(1);
        Vy = V(2);
        w = V(3);
end


end

