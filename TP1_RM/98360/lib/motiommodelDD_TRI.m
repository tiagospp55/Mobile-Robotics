function [DD_r,DD_l,TRI_v, f_alpha] = motiommodelDD_TRI(x_state_EFK,Dt,r,L,Vn,Wn)
%MOTIOMMODELDD_TRI Summary of this function goes here
%   Detailed explanation goes here

x = x_state_EFK(:,2);
y = x_state_EFK(:,3);
t = x_state_EFK(:,4);

noise_v = Vn * randn(size(x_state_EFK,1),1);
noise_w = Wn * randn(size(x_state_EFK,1),1);


for i = 2:size(x_state_EFK,1)
    distance(i) = sqrt((x(i)-x(i-1)^2+(y(i)-y(i-1))^2));
    th(i) = atan2((y(i)-y(i-1)),(x(i)-x(i-1)));
end


for i = 2:size(x_state_EFK,1)
    v(i) = distance(i)/Dt*(1+noise_v(i));
    w(i) = (th(i)-th(i-1))/Dt*1+noise_w(i);
end


for i = 1:size(v,2)
    DD_l(i)= (v(i)-(w(i)*L/2))/r
    DD_r(i)= (v(i)+(w(i)*L/2))/r
    TRI_v(i)= v(i)-(w(i)*L);
    w_r(i)=w(i)*L;
    f_alpha(i)=atan(w_r(i)/TRI_v(i));
end



