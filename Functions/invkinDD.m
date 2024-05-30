function [VR,VL] = invkinDD(X,Y,th,L,t)
% [VR,VL] = invkinDD(X,Y,th,L,t)
% X - target position in x (meters)
% Y - target position in y (meters)
% th- target orientation in th (radians)
% L - wheel separation (meters)
% t - time to accomplish the trajectory (seconds)
% Notice: X, Y and th can not be set all at the same time
% one of them must be NaN for the function to return valid results.

    omega = th/t;
    
    if X ~= NaN
        V = (X*omega)/sin(omega*t);
    elseif Y ~= NaN
        V = (Y*omega)/(1-cos(omega*t));
    end

    VL = V-(L/2)*omega;
    VR = V+(L/2)*omega;

end

