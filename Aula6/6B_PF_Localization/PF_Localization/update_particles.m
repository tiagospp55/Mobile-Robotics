function particle = update_particles(particle, robot, sigma)

n = size(particle,2);
  
for j = 1:n
    diff_sq     =(particle(j).laser(3,:)-robot.laser(3,:)).^2;
    diff_sq_sort=sort(diff_sq);
    diff_sq_5   =diff_sq_sort(1:6);

    particle(j).llh = exp(-sum(diff_sq_5)/(2*sigma^2));% * extra;
    % j_likilihood=particle(j).llh
end

% New weight 1
constant = 0;
for j = 1:n
    particle(j).mid = particle(j).weight * particle(j).llh;
    constant = constant + particle(j).mid;
end
 
% Normalise weight
for j = 1:n
    particle(j).weight = particle(j).mid/constant;
end
