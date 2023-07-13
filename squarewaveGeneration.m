close all; clear all; clc;

t=0:0.001:1;
f=2;

rad=2*pi*f;
x=square(rad*t);

plot(t,x);
%axis([1,1.5,2,1.5,1]);
grid on;

