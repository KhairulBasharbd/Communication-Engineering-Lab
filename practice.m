clc;clear all;close all;

bits = [0 1 0 0 1 1];
bitrate=1;
n=1000; %%sampling rate
T = length(bits) / bitrate;
N = length(bits) *n;
dt=T/N;
t = 0:dt:T-dt;
prev=1;
x = zeros(1,N);
%x(1)=prev;
%half=500;
%%Encoding
for i=1:length(bits)
    half = (i*n) - n/2;
    if bits(i)==0
        x((i-1)*n +1 :half) = - prev;
        x(half : i*n) = prev;
        prev=x(half+1);
    else
        x((i-1)*n +1 :half) = prev;
        x(half : i*n) = - prev;
        prev=x(half+1);
    end
end

        
 plot(t,x,'linewidth',3);
 ylim([-1.1,1.1]);
 grid on;
        
        
y = zeros(1,length(bits));        
 %%decoding
 prev = 1;
for i=1:length(bits)
    half = ((i*n) - (n/2));
    if x((i-1)*n +1 : half-1) == prev
        prev=-prev;
        y(i)= 1;
    else  y(i)=0;
        
    end
end       
        
disp(y);        
