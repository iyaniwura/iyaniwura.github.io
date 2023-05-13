% SIR model from Math 215 Section 104 class Sept. 8

clear all;
close all;

% initial conditions

S0=10^6 - 1;
I0=1;

N = S0 + I0;

% solve differential equations for vector y=[S;I] from day 0 to day end_day
% and initial conditions as specified

end_day=50;%240

% ode45 is a function that provides numerical approximations of
% solutions to ordinary differential equations.
% We use it when we are not able to solve the equations explicitly or when
% it is inconvenient to do so.

[T, y] = ode45('SIRmodelRHS',[0 end_day],[S0 I0]);

% The first argument of ode45 is a function name. The function returns the
% right hand side of the differential equation system.
% The second argument specifies the time range that will be used.
% The third argument contains a vector of initial conditions.
% Many more options can be set. Type "help ode45" to get started.

% The column vector T now holds the time points of the interpolation
% y contains two columns: the first column contains S(t) 
% and the second column contains I(t)

% To access the columns of y individually, use : notation

S=y(:,1);
I=y(:,2);

% now plot S and I on separate plots

figure;
set(gca,'FontSize',18)
h1=plot(T,S);
title('Number of susceptible people');
xlabel('time')
ylabel('S(t)')
set(h1,'linewidth',2);


% Note: these graph labelling commands apply to the currently active
% figure. We need to start a new figure using the "figure" command, 
% otherwise the previous labels will be overwritten.

figure;
set(gca,'FontSize',18)
h2=plot(T,I);
title('Number of infectious people');
xlabel('time')
ylabel('I(t)')
set(h2,'linewidth',2);



figure;
set(gca,'FontSize',18)
h3=plot(T,(N-(I+S)));
title('Number of recovered people');
xlabel('time')
ylabel('R(t)')
set(h3,'linewidth',2);


figure;
set(gca,'FontSize',18) % Creates an axes and sets its FontSize to 18
h1=plot(T,S);
hold on
h2=plot(T,I);
h3=plot(T,(N-(I+S)));
%title();
xlabel('time')
ylabel('Number of people')
set(h1,'linewidth',2);
set(h2,'linewidth',2);
set(h3,'linewidth',2);
legend('S(t)','I(t)','R(t)')


