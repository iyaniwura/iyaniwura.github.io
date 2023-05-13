clear all
close all

%%%%% Problem 1
f1 = @(t,y) (2-t)*y;  %defining the function f(t,y)

figure(1);
dirfield(f1, -4:.1:4, -4:0.1:4); %% plotting the direction field
hold on
[ts,ys] = ode45(f1,[0,4],1/2); %% ode45(function, [t0 t_end],y0)
plot(ts,ys,'b')
title('Slope field');
xlabel('time')
ylabel('y(t)')


[ts,ys] = ode45(f1,[0,4],1);
plot(ts,ys,'k')



%%%%% Problem 2 : Logistic equation

k = 0.5; %%% Maximum sustainable population
M = 5; % population growth rate
f2 = @(t,y) 0.5*y*(5-y);  %defining the function f(t,y)
end_time= 4;
figure(2);
dirfield(f2, 0:.1:end_time, 0:0.1:7);%% plotting the direction field
title('Slope field for logistic model');
xlabel('time')
ylabel('y(t)')
hold on
[ts,ys] = ode45(f2,[0,end_time],6.5); %% ode45(function, [t0 t_end],y0)
plot(ts,ys,'b')

[ts,ys] = ode45(f2,[0,end_time],2.5); %% ode45(function, [t0 t_end],y0)
plot(ts,ys,'k')

[ts,ys] = ode45(f2,[0,end_time],0.001); %% ode45(function, [t0 t_end],y0)
plot(ts,ys,'g')

[ts,ys] = ode45(f2,[0,end_time],0); %% ode45(function, [t0 t_end],y0)
plot(ts,ys,'b')


[ts,ys] = ode45(f2,[0,end_time],5); %% ode45(function, [t0 t_end],y0)
plot(ts,ys,'g')
