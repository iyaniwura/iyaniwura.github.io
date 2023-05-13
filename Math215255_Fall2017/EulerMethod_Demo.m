clear all
close all


f =@(t,y) (2-t)*y; %% defining the function for the slope field
h = 0.1; %% step-size
t0 = 0; %% initial time
tfinal = 1; %% final time
y0 = 1; %% initial condition
n = 0 ; %% initializing counter
yn = y0; %% just so that I can use yn in the for -- loop

% the next few lines contain a for -- loop statement which helps repeat
% the execution of commands contained within it. Please see
% https://www.mathworks.com/help/matlab/ref/for.html for more information
% on for -- loops
Approx_sol=[y0]; %saving the initial condition in my vector of approx. solution
n = n + 1; 
for tn =t0:h:(tfinal-h)
    n = n + 1;  % incrementing counter
    y_nplus1 = yn + h*f(tn,yn);  % computing approximate solution at current
%        time-step using Euler's method
    Approx_sol(n)=y_nplus1; % saving the soution into a vector
    yn = y_nplus1;
end

Approx_sol';

time = t0:h:tfinal; %% creating a vector of the time-points
figure;
set(gca,'FontSize',18)
h2=plot(time,Approx_sol,'r*-');
title('Number of infectious people');
xlabel('time')
ylabel('y(t)')
set(h2,'linewidth',2);

%%% Analytic solution
t = time;
exact_sol = exp(2*t - t.^2/2);

%%% plotting the exact and approximate/numerical solution
figure;
set(gca,'FontSize',18) % Creates an axes and sets its FontSize to 18
h1=plot(time,Approx_sol,'r*-');
hold on
h2=plot(time,exact_sol,'b');
%title();
xlabel('time')
ylabel('y(t)')
set(h1,'linewidth',2)
set(h2,'linewidth',2)
legend('Numerical solution','Analytic solution','Location','northwest')
