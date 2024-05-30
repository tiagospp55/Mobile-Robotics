function [w,v,dth,th] = velocities(x_interpoled,y_interpoled,Wn, Vn, Dt)


    if nargin < 5
        Dt = 1;
    end
    if nargin < 4
        L = 1;
    end
    if nargin < 3
        Wn = 0.1;
    end
    for i = 2: length(x_interpoled)
        distance(i) = sqrt((x_interpoled(i)-x_interpoled(i-1))^2+(y_interpoled(i)-y_interpoled(i-1))^2);
        th(i)=asin((y_interpoled(i)-y_interpoled(i-1))/distance(i));
    end

    dth = diff(th);
  
       noise_v = Vn * randn(length(dth),1);
       noise_w = Wn * randn(length(dth),1);
        
       for i = 1:length(x_interpoled)-1
           v(i) = distance(i)/Dt * (1+noise_v(i));
           w(i) = dth(i)/Dt * (1+noise_w(i));
       end
end