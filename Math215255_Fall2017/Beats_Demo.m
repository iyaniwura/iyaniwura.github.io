clear all
close all


m = 5; % mass 

w0 = 2; % natural frequency of the oscillator
w = 3.5; % frequency of the forcing
% 2.1 2.5 3 3.5

t = 0:0.1:200;  %creating a time vector

amplitude = -2/(m*(w0^2 - w^2));
higher_freq = sin((w + w0)*t/2);
lower_freq = sin((w - w0)*t/2);

y = amplitude.*higher_freq.*lower_freq;

figure()
h3=plot(t,y);
title('Beats');
xlabel('time')
ylabel('y(t)')
set(h3,'linewidth',2);


