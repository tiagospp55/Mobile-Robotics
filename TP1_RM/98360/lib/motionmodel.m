
function [xstate1] = motionmodel(xstate,Vin,Dn,t)
%% Made by the professor in class %%

xstate1(1)=xstate(1)+(Vin(1)+Dn(1))*t*cos(xstate(3));
xstate1(2)=xstate(2)+(Vin(1)+Dn(1))*t*sin(xstate(3));

xstate1(3)=xstate(3)+(Vin(2)+Dn(2))*t;


end
