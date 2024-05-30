function a = getbdir(B, P, theta, error)

% Accepts beacon position B, the current point P and θ.
% Returns the angle deﬁned by <B,P,Q> where Q is a point along the path.
% This angle must be < 180º !
% B - beacon coordinates
% P - current position in path
% th - direction of motion in the global frame
% a - angle <B,P,Q> mod 180º

    if nargin < 4
        error = 0;
    end
    
    DP = B-P;
    a = atan2(DP(2),DP(1)) - theta + deg2rad(error)*randn;
    a = mod(a,pi);
end

