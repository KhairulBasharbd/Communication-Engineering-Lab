clc;clear all;close all;

bits = round(rand(1,5));

bitrate = 1;
n=1000;
T = length(bits)/bitrate;   %% Maximum value of x-axis time.
N = n*length(bits);         %% total data in x-axis.
dt= T/N;
t = 0:dt:T-dt;

%%Encoding
x = zeros(1,N);

for i=1:length(bits)
    if bits(i)==1
        x((i-1)*n +1 :i*n) = -1;
    else
        x((i-1)*n +1 :i*n) = 1;
        
    end
end

plot(t,x,'Linewidth', 3);
ylim([-1,1]);
title('Encoded signal by using polar NRZ-L technique');
grid on;


%%Decoding
y = zeros(1,length(bits));
for i=1:length(bits)
    if x((i-1)*n + 1 : i*n) == -1
        y(i)=1;   
    end 
end

disp(y);


