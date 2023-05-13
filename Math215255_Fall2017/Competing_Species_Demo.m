% Introduction to plotting vector field for an ODE of the form
% x'=F(x)
% and superimposing a solution curve
%
% Helpful for homework 5.
%
% To run this, save to a folder. Make sure that folder is in the path for
% matlab/octave. Then type "NLVecField" at the prompt, or open in the
% matlab editor and click "run"

clear all; %start by clearing all variables
close all;


% now start making the vector plot
% first set up matrices X1 and X2 that contain the X1- and X2-
% coordinates. Here, I choose to work on a range of 0<x1<2 and 0<x2<2
% and make the arrows every 0.1 in each direction

[X1, X2] = meshgrid(0:.1:1.5,0:.1:1.5);

% Now make up functions for the x1- and x2- components of F(x)
% This will be the "competing species" model from class
% Set some parameters first:
a1pha1 = 3;
beta1 = 4;
k1 = 1;
alpha2 = 2;
beta2 = 2;
k2 = 1;
% now set the functions
% annoyingly, we have to use .* and .^ (componentwise multiplication and
% comonentwise powers) to make sure these are threaded over the
% components of x1 and x2 correctly.
% If the function is more complicated, you probably should write a
% separate function file rather than using @-function.

F1=@(x1,x2) a1pha1.*x1 - beta1*x1.^2 - k1.*x1.*x2; % first equation of the
system
F2=@(x1,x2) alpha2.*x2 - beta2*x2.^2 - k2.*x1.*x2; % second equation

% now make matrices U1 and U2 containing the vector components

U1 = F1(X1,X2);
U2 = F2(X1,X2);

%Finally plot the vector field using the quiver command
quiver(X1,X2,U1,U2,4)

hold on

% Equilibria solution
Y1 = [0 0];
Y2 = [3/4 0];
Y3 = [0 1];
Y4 = [4/7 5/7];

% plotting the equilibria
plot(Y1(1),Y1(2),'ro')
plot(Y2(1),Y2(2),'ro')
plot(Y3(1),Y3(2),'ro')
plot(Y4(1),Y4(2),'ro')

% observe that some of the arrows here are hard to see. This is because
% quiver() is rescaling the arrows. We can improve this
% by telling it to plot all the arrows with the same length:

figure(2); %change to figure 2

% the following loop rescales every arrow to length L=0.05
% note that U1 and U2 have to be matrices of the same size for this
% loop to work as written

L=0.05;
len=length(U1);
for(i=1:len)
    for(j=1:len)
        nr=sqrt(U1(i,j)^2+U2(i,j)^2);
        U1(i,j)=L*U1(i,j)/nr;
        U2(i,j)=L*U2(i,j)/nr;
    end
end

quiver(X1,X2,U1,U2,0)
% the zero at the end of the arguments tells matlab not to rescale the
% vectors, so they keep the length L that was specified


hold on

% plotting the equilibria
plot(Y1(1),Y1(2),'ro')
plot(Y2(1),Y2(2),'ro')
plot(Y3(1),Y3(2),'ro')
plot(Y4(1),Y4(2),'ro')



% Next up: numerical solve the ODE for a given initial condition x(0)=(1,1).
% to use ode45() which is a good routine for numerical solution of ODE,
% we need to define the ODE as x'=f(t,x). We can use @-function for this as
% it is simple. If it's more complicated, then you should write a function
% file (see lecture one) that inputs t and x and outputs the derivatives.

% I can use F1 and F2 as defined above.

% to go into ode45, f needs to be a function of t and x in that order
% in this class we will only look at x'=f(t,x)=f(x) - that is, autonomous
% non linear systems. But matlab still needs us to specify the dependence
% on t.

f=@(t,x) [F1(x(1),x(2)); F2(x(1),x(2))];

% now I will set the initial point [1,1]

ip=[1;1];

% and the time range to run on. Lets go from t=0 to t=10:

tr=[0 10];

% now run ode45 and put the output into tout and xout:

[tout xout]=ode45(f,tr,ip);

% finally plot on the same axes. I have to plot one component of xout
% against the other component.

hold on; % prevent this graph from overwriting the vector plot.

plot(xout(:,1),xout(:,2))


% now to get fancy: plot a bunch of solution curves by changing the initial
% point:

%figure(3); % change to figure 3

hold on;
%quiver(X1,X2,U1,U2,0) % plot the vector field

for(i=0:0.2:1) % this is a loop from i=0 to i=2 in increments of 0.2
    ip=[1.5;i]; %set initial point along line x1=1.5
    [tout xout]=ode45(f,tr,ip); %compute
    plot(xout(:,1),xout(:,2)) %plot
    ip=[0.1;i]; %now set initial point along line x1=0.1, etc...
    [tout xout]=ode45(f,tr,ip);
    plot(xout(:,1),xout(:,2))
    ip=[i;0.1];
    [tout xout]=ode45(f,tr,ip);
    plot(xout(:,1),xout(:,2))
    ip=[i;1.5];
    [tout xout]=ode45(f,tr,ip);
    plot(xout(:,1),xout(:,2))
end;




