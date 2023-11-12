close all;clear;clc

dis0=[pi/2;2;0;0];
ts=0:0.01:10;

m=1; l=2; g=9.81; M=2; k=1; L0=1;

%opts = odeset('RelTol',1e2^100,'AbsTol',1e2^100);
[t,dis]=ode45('twodof',ts,dis0);

V = 0.5*m.*(dis(:,3).^2)+(1/6)*l^2*M.*(dis(:,2).^2)+(0.5*m.*(dis(:,2).^2).*(dis(:,3)).^2 );
T = -0.5*M*l*g.*(cos(dis(:,1)))+(k/2).*(L0-dis(:,2)).^2 -m*g.*cos(dis(:,1)).*dis(:,2);

figure()
subplot(4,1,1)
plot(t,dis(:,1),'b',t,dis(:,2),'r')
title('Displacements')
xlabel('Displacement in m')
ylabel('Time in s')
legend('theta','l','location','best')

subplot(4,1,2)
plot(t,dis(:,3),t,dis(:,4))
title('Velocities')
xlabel('Velocity in m/s')
ylabel('Time in s')
legend('theta_dot','l_dot','location','best')

subplot(4,1,3)
plot(t,V,'b',t,T,'r')
title('Energies')
xlabel('Energy in J')
ylabel('Time in s')
legend('KE','PE','location','best')

subplot(4,1,4)
plot(t,abs(T+V))
title('Total Energy')
xlabel('Energy in J')
ylabel('Time in s')