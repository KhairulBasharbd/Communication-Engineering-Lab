clc;clear all;close all;

%%bits = round(rand(1,4));    %% Random bit generation.

bits=[1 0 1 1];

bitrate = 1;                %%Assume ratio = data_rate / signal_rate = 1               
n = 1000;                   %%Total descrete point in one bit/signal elements.
T = length(bits)/bitrate;   %%Highest value of x-axis.
N = length(bits)*n;         %%Total descrete point on x-axis.
dt = T/N;                   %%smallest time unit.
t = 0:dt:T - dt;            %%

x = zeros(1, N);            %%Initialization.

%%Encoding
for i=1:length(bits)
    half = ((i-1)*n) + n/2;
    if bits(i)==1
        x((i-1)*n +1 :half) = -1;
        x(half : i*n) = 1;
    else
        x((i-1)*n +1 :half) = 1;
        x(half : i*n) = -1;
        
    end
end

subplot(2,1,1);
plot(t,x,'Linewidth', 3);
ylim([-1,1]);
title('Encoded signal by using Polar Biphase Manchester technique');
grid on;


%%Decoding
y = zeros(1,length(bits));
for i=1:length(bits)
    if x((i-1)*n + 1) == -1
        y(i)=1;   
    end 
end

disp(y);