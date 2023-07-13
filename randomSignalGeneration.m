clear all;close all;clc;

N=input('Enter the length of bit stream = ');
%N = 20;
bits=round(rand(1,N));
bits
subplot(2,1,1);
stairs(1:N,bits);
ylim([-0.2 1.2]);
title('Uni Polar Non Return to Zero');
grid on;

bitrate=1;
n=1000;
T = N/bitrate;
dt=T/(N*n);

t=0:dt:T-dt;
x=zeros(1,length(t));

for i=1:N
    if bits(i)==1
        x((i-1) * n+1 : i*n) =1;
    else
         x((i-1) * n+1 : i*n) = -1;
    end
    
end
subplot(2,1,2);
plot(t,x);
ylim([-0.2 1.2]);
grid on;


bitsout=zeros(1,N);

L=length(x);
for i=1:N
    if bits(i)==1
        bitsout(i) =1;
    else
         bitsout(i) =0;
    end
    
end

