close all;clear;clc

m=30; l=10; g=9.81;

x0 = [pi/2;pi/2;0;0];
ts = 0:0.01:20;
[t,x] = ode45('MCK',ts,x0);

% Energy
V = -(0.25*g*l*m).*(7*cos(x(:,1))+3*cos(x(:,2))-5.*sin(x(:,1))-sin(x(:,2)));
T = ((1/48)*l^2*m).*(73.*x(:,3).^2+24.*(2.*cos(x(:,1)-x(:,2))-sin(x(:,1)-x(:,2))).*x(:,3).*x(:,4)+25.*x(:,4).^2);

% Results
figure('Name','Total Energy')
plot(t,V,'black',t,T,'r',t, (T+V))
title('Energy plot')
ylabel('Energy (J)')
xlabel('Time (s)')
legend('Potential Energy','Kinetic Energy','Total Energy')
grid on