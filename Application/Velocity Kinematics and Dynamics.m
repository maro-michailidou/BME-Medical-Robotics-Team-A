syms theta_mcpaa theta_mcpfe theta_pip theta_dip
syms dtheta_mcpaa dtheta_mcpfe dtheta_pip dtheta_dip
syms ddtheta_mcpaa ddtheta_mcpfe ddtheta_pip ddtheta_dip
syms L1 L2 L3 m1 m2 m3 I1 I2 I3 g k1 k2 k3 c
syms tau1 tau2 tau3
syms t

% Define the angular velocities
w1 = -sin(theta_mcpaa)*(L2*cos(theta_pip + theta_mcpfe) + L1*cos(theta_mcpfe) + L3*cos(theta_pip + theta_mcpfe + theta_dip))*dtheta_mcpaa ...
     -cos(theta_mcpaa)*(L2*sin(theta_pip + theta_mcpfe) + L1*sin(theta_mcpfe) + L3*sin(theta_pip + theta_mcpfe + theta_dip))*dtheta_mcpfe ...
     -cos(theta_mcpaa)*(L2*sin(theta_pip + theta_mcpfe) + L3*sin(theta_pip + theta_mcpfe + theta_dip))*dtheta_pip ...
     -L3*sin(theta_pip + theta_mcpfe + theta_dip)*cos(theta_mcpaa)*dtheta_dip;

w2 = cos(theta_mcpaa)*(L2*cos(theta_pip + theta_mcpfe) + L1*cos(theta_mcpfe) + L3*cos(theta_pip + theta_mcpfe + theta_dip))*dtheta_mcpaa ...
     -sin(theta_mcpaa)*(L2*sin(theta_pip + theta_mcpfe) + L1*sin(theta_mcpfe) + L3*sin(theta_pip + theta_mcpfe + theta_dip))*dtheta_mcpfe ...
     -sin(theta_mcpaa)*(L2*sin(theta_pip + theta_mcpfe) + L3*sin(theta_pip + theta_mcpfe + theta_dip))*dtheta_pip ...
     -L3*sin(theta_pip + theta_mcpfe + theta_dip)*sin(theta_mcpaa)*dtheta_dip;

w3 = (L2*cos(theta_pip + theta_mcpfe) + L1*cos(theta_mcpfe) + L3*cos(theta_pip + theta_mcpfe + theta_dip))*dtheta_mcpfe ...
     + (L2*cos(theta_pip + theta_mcpfe) + L3*cos(theta_pip + theta_mcpfe + theta_dip))*dtheta_pip ...
     + L3*cos(theta_pip + theta_mcpfe + theta_dip)*dtheta_dip;

% Kinetic Energy
K = 1/2*I1*dtheta_mcpfe^2 + 1/2*I2*dtheta_pip^2 + 1/2*I3*dtheta_dip^2 + 1/2*m1*w1^2 + 1/2*m2*w2^2 + 1/2*m3*w3^2;

% Potential Energy
U = m1*g*L1*sin(theta_mcpfe) + m2*g*(L1*sin(theta_mcpfe) + L2*sin(theta_pip + theta_mcpfe))...
    + m3*g*(L1*sin(theta_mcpfe) + L2*sin(theta_pip + theta_mcpfe) + L3*sin(theta_pip + theta_mcpfe + theta_dip)) ...
    + 1/2*k1*(theta_mcpfe)^2 + 1/2*k2*(theta_pip)^2 + 1/2*k3*(theta_dip)^2;

% Lagrangian
L = K - U;

% Damping forces
F = 1/2 * (c*dtheta_mcpfe^2 + c*dtheta_pip^2 + c*dtheta_dip^2);

% Lagrange equations
eq1 = diff(diff(L, dtheta_mcpfe), t) - diff(L, theta_mcpfe) + diff(F, dtheta_mcpfe);
eq2 = diff(diff(L, dtheta_pip), t) - diff(L, theta_pip) + diff(F, dtheta_pip);
eq3 = diff(diff(L, dtheta_dip), t) - diff(L, theta_dip) + diff(F, dtheta_dip);

% Simplify the expression
simplified_eq1 = simplify(eq1);
simplified_eq2 = simplify(eq2);
simplified_eq3 = simplify(eq3);

% Solve the equations
sol = solve([eq1, eq2, eq3], [ddtheta_mcpaa, ddtheta_mcpfe, ddtheta_pip, ddtheta_dip]);

