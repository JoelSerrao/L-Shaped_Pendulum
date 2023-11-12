function vresp = MCK(t,th)
% Function to calculate displacement and velcity of 2 DoF dynamic system

m=30; l=10;g=9.81;

M=[(73/24)*m*l^2 ((m*l^2)/2)*(2*cos(th(1)-th(2)) - sin(th(1)-th(2)));
    ((m*l^2)/2)*(2*cos(th(1)-th(2)) - sin(th(1)-th(2))) (25/24)*m*l^2];
C = zeros(2,2);
K = zeros(2,2);

Force = [(-0.25*m*g*l)*(5*cos(th(1))+7*sin(th(1)))-(th(4)^2*(((m*l^2)/2)*(cos(th(1)-th(2))+2*sin(th(1)-th(2))))); 
         ((1/24)*m*g*l)*(-6*cos(th(2))-18*sin(th(2)))-(th(3)^2*(-((m*l^2)/2)*(cos(th(1)-th(2))+2*sin(th(1)-th(2)))))];

AB=[zeros(2) -eye(2);M\K M\C];
vresp=-AB*th+[0;0; M\Force];
end
