clc;clear all;close all;

%%bits = round(rand(1,5));
bits=[0 1 0 0 1 1 1 0];
prev= 1;

bitrate = 1;
n=1000;
T = length(bits)/bitrate;   %% Maximum value of x-axis time.
N = n*length(bits);         %% total data in x-axis.
dt= T/N;
t = 0:dt:T-dt;

%%Encoding
x = zeros(1,N);


for i=1:length(bits)
    if bits(i) ==1
        x((i-1)*n +1 :i*n)= - prev;
        prev= x(i*n);
    else
        x((i-1)*n +1 :i*n)= prev;
        prev = x(i*n);
        
    end
end

plot(t,x,'Linewidth', 3);
ylim([-1,1]);
title('Encoded signal by using polar NRZ-I technique');
grid on;


%Decoding
y = ones(1, length(bits));
previous = 1;
for i=1:length(y)
    if x(((i-1)*n)+1) == previous
        y(i) = 0;
    else
        previous = previous * (-1);
    end
end
disp(y);