pkg load signal;

close all; clear all; clc;

%var = input("Enter an expression : ");

r1=rand(1,10);
subplot(2,1,1);
plot(r1);

rb=round(rand(1,10));
subplot(2,1,2);
stem(rb);




