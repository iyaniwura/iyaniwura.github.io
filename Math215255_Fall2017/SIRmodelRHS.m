function SIRderivs = SIRmodelRHS(t,y)
% returns RHS of SIR model from class Sept. 8

% first unpack the variables  and use helpful names to avoid errors
S = y(1);
I = y(2);

% set parameters
beta = 2E-6;
alpha = 0.3;

% now set the entries of the RHS in the correct order
% again use helpful variable names to avoid mistakes

dSdt = - beta * S * I;
dIdt = beta * S * I - alpha * I;

% finally return the RHS entries as the name of the function, in the right
% order

SIRderivs=[dSdt; dIdt];

end

