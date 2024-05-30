function [x_interpoled,y_interpoled] = pchip_path(beacons,steps)


x_interpoled=[];
for i=1:length(beacons)-1
    x_interpoled = [x_interpoled linspace(beacons(i,1),beacons(i+1,1),steps(i)+1)];
end


[Z,idx]= unique(x_interpoled','stable');
x_interpoled=x_interpoled(:,idx);
y_interpoled = pchip(beacons(:,1),beacons(:,2),x_interpoled);

end

