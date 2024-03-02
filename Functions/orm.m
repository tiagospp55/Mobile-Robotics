function R = orm(th)
%ORM Returns the ortogonal rotation matrix

R = [cos(th)  sin(th)  0
     -sin(th) cos(th)  0
     0        0        1];

end

