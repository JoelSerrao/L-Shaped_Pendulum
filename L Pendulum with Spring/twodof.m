function vresp = twodof(t,dis)

m=1; l=2; g=9.81; M=2; k=1; L0=1;

Mass = [((1/3)*M*l^2)+m*(dis(2))^2 0;  0  m];

C=[0 0; 0 0];

K=[0 0; 0 k];

AB=[zeros(2) -eye(2);Mass\K Mass\C];

Force = [-(2*m*dis(2)*dis(3)*dis(4))-((M*g/2)*l*sin(dis(1)))-(m*g*dis(2))*sin(dis(1));(m*dis(2)*(dis(3))^2)+(k*L0)+(m*g*cos(dis(1)))];


vresp=-AB*dis+[0;0; Mass\Force];

end
