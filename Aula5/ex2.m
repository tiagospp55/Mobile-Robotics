clear;
close all;
clc;

syms th1 th2 x y x1 x2 y1 y2 real

A = [-sin(th1) cos(th1)
     -sin(th2) cos(th2)];
B = [-x1*sin(th1)+y1*cos(th1)
     -x2*sin(th2)+y2*cos(th2)];

P = [x y];

X = pinv(A)*B;

X = simplify(X);
