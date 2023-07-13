clear all;close all;clc;


a1=5;
f1=10;
t1=0:0.001:1;
x1=a1*sin(2*pi*f1*t1);
subplot(3,1,1);
plot(t1,x1);

a2=10;
f2=5;
t2=0:0.001:1;
x2=a2*sin(2*pi*f2*t2);
subplot(3,1,2);
plot(t2,x2);

t3=0:0.001:1;
x3 = a1*sin(2*pi*f1*t1) + a2*sin(2*pi*f2*t2);
subplot(3,1,3);
plot(t3,x3);

Ts=1/30;
y = fft(x3);
fs = 1/Ts;
f = (0:length(y)-1)*fs/length(y);

figure(2);
plot(f,abs(y))
