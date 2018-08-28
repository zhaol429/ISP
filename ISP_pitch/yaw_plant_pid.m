function [sys,x0,str,ts] = yaw_plant_pid(t,x,u,flag)

switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 2;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [-0.4,0];
str = [];
ts  = [0 0];

function sys=mdlDerivatives(t,x,u)

Jkz=0.0231;Jaz=0.0168;Jax=0.0168;Jay=0.0168;
v1=0.1;v2=0.1;
theta=0.5*sin(pi*t/3);dtheta=0.5*pi/3*cos(pi*t/3);ddtheta=-0.5*(pi/3)^2*sin(pi*t/3);
gamma=0.5*sin(pi*t/3);dgamma=0.5*pi/3*cos(pi*t/3);ddgamma=-0.5*(pi/3)^2*sin(pi*t/3);
psi=0.5*sin(pi*t/3);dpsi=0.5*pi/3*cos(pi*t/3);ddpsi=-0.5*(pi/3)^2*sin(pi*t/3);

p=dgamma+dpsi*sin(theta);
q=dtheta*cos(gamma)-dpsi*sin(gamma)*cos(theta);
r=dtheta*sin(gamma)+dpsi*cos(gamma)*cos(theta);

Pk=p*cos(v1)+q*sin(v1);
Qk=-p*sin(v1)+q*cos(v1);
Rk=r;

Pa=Pk*cos(v2)-Rk*sin(v2);
Qa=Qk;
Ra=Pk*sin(v2)+Rk*cos(v2);

Jk=Jkz+Jaz;
Td=Jax*Pk*Qk-Jay*Pk*Qa;

dPa=(ddgamma+ddpsi*sin(theta)+dpsi*cos(theta))*cos(v1)*cos(v2);
+(ddtheta*cos(gamma)-dtheta*sin(gamma)-ddpsi*sin(gamma)*cos(theta)-dpsi*cos(gamma)*cos(theta)+dpsi*sin(gamma)*sin(theta))*sin(v1)*cos(v2);
-(ddtheta*sin(gamma)+dtheta*cos(gamma)+ddpsi*cos(gamma)*cos(theta)-dpsi*sin(gamma)*cos(theta)-dpsi*cos(gamma)*sin(theta))*sin(v2);

b=1/(Jk*cos(v2));

sys(1)=x(2);
sys(2)=b*u(1)+b*(Td+Jk*dPa*sin(v2))+15*sin(5*pi*t);

function sys=mdlOutputs(t,x,u)

sys(1)=x(1);
