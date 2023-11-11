close all;clear;clc

dis0=[pi/2;2;0;0];
ts=0:0.01:10;

m=1; l=2; g=9.81; M=2; k=1; L0=1;

opts = odeset('RelTol',1e2^100,'AbsTol',1e2^100);
[t,dis]=ode45('twodof',ts,dis0,opts);

V = 0.5*m.*(dis(:,3).^2)+(1/6)*l^2*M.*(dis(:,2).^2)+(0.5*m.*(dis(:,2).^2).*(dis(:,3)).^2 );
T = -0.5*M*l*g.*(cos(dis(:,1)))+(k/2).*(L0-dis(:,2)).^2 -m*g*cos(dis(:,1))*dis(:,2);

figure('Name','PE Vs KE')
subplot(3,1,1)
plot(t,dis(:,1),'b',t,dis(:,2),'r')
subplot(3,1,2)
plot(t,V,'b',t,T,'r')
subplot(3,1,3)
plot(t,abs(T+V))