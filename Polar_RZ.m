clc;clear all;close all;

%%bits = round(rand(1,5));
bits=[0 1 0 0 1];


bitrate = 1;
n=1000;
T = length(bits)/bitrate;   %% Maximum value of x-axis time.
N = n*length(bits);         %% total data in x-axis.
dt= T/N;
t = 0:dt:T-dt;

%%Encoding
x = zeros(1,N);

for i=1:length(bits)
    half = ((i-1)*n) + n/2;
    if bits(i)==1
        x((i-1)*n +1 :half) = 1;
        x(half : i*n) = 0;
    else
        x((i-1)*n +1 :half) = -1;
        x(half : i*n) = 0;
        
    end
end

plot(t,x,'Linewidth', 3);
ylim([-1,1]);
title('Encoded signal by using polar RZ technique');
grid on;


%%Decoding
y = zeros(1,length(bits));
for i=1:length(bits)
    if x((i-1)*n + 1) == 1
        y(i)=1;   
    end 
end

disp(y);


