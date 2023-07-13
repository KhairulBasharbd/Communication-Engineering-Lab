clc;clear all;close all;

%%bits = round(rand(1,4));    

bits=[1 0 0 0 0 0 0 0 0 1];

bitrate = 1;                               
n = 1000;                   
T = length(bits)/bitrate;   
N = length(bits)*n;        
dt = T/N;                   
t = 0:dt:T - dt;         

x = zeros(1, N);            
mark=-1; %%Last one position
%%Encoding
for i=1:length(bits)
    if bits(i) == 1 && mark==1
        x((i-1)*n +1 : (i*n)) = -1;
        mark=-1;
    elseif bits(i) == 1 && mark==-1
        x((i-1)*n +1 : (i*n)) = 1;
        mark=1;
    else
        x((i-1)*n +1 : (i*n)) = 0;
    end
end

subplot(2,1,1);
plot(t,x,'Linewidth', 2);
ylim([-1,1]);
title('Encoded signal by using AMI technique');
grid on;

%%Decoding
y = zeros(1,length(bits));
mark=-1;
for i=1:length(bits)
    if x((i-1)*n + 1 : i*n) == 1
        y(i)=1; 
    elseif x((i-1)*n + 1 : i*n) == -1
        y(i)=1;
    end 
end
disp(y);






