function MM= traject(P1,P2,N)
%TRAJECT create a mlinear trjaectory between P1 and P2 with N points
%   MM.xy - matrix of xy points
%   MM.angle - the vector of orientations
%   MM.T - The associate geometric transformation

    M = [linspace(P1(1), P2(1), N)
         linspace(P1(1), P2(1), N)];
    dM = diff(M,1,2); 
    
    
    ang = atan2(dM(2,:), dM(1,:));
    ang(end+1) = ang(end)
    
    T = zeros(3,3, width(M));
    
    for n = 1:size(T,3)
        T(:,:,n) = transl(M(:,n)) * rotat(ang(n));
    end
    
    MM.xy = M;
    MM.angle = ang;
    MM.T = T;

end

