function MM = circtraj(P1,P2,R,N)
%CIRCTRAJ Create a circular path between two points P1 and P2 with a given radius R and N points.
%   MM.xy - matrix of xy points
%   MM.angle - the vector of orientations
%   MM.T - The associate geometric transformation
    
    A = P1;
    B = P2;
    d = norm(B-A);
    R = max(R,d/2);
    
    if isinf(R); R = 1e6; end
    
    C = (B+A)/2 + sqrt(R^2-d^2/4)/d*[0,-1;1,0] * (B-A);
    
    a = atan2(A(2)-C(2), A(1)-C(1));
    b = atan2(B(2)-C(2), B(1)-C(1));
    b = mod(b-a,2*pi) + a;
    t = linspace(a,b,N);
    M = C+R*[cos(t); sin(t)];
    
    dM = diff(M,1,2);
    ang = atan2(dM(2,:), dM(1,:));
    ang(end+1) = ang(end);
    
    T = zeros(3,3,width(M));
    
    for n = 1:size(T,3)
        T(:,:,n) = transl(M(:,n))*rotat(ang(n));
    end
    
    MM.xy = M;
    MM.angle = ang;
    MM.T = T;

end

