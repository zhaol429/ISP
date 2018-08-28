function [sys,x0,str,ts] = SP_yaw_s(t,x,u,flag)

switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      = 5;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [0 0];

function sys=mdlOutputs(t,x,u)
persistent e0 de0 dde0
T=0.2;

Jkz=0.0231;Jaz=0.0168;Jax=0.0168;Jay=0.0168;
v1=0.1;v2=0.1;
Jk=Jkz+Jaz;
b=1/(Jk*cos(v2));

x1d=u(1);
dx1d=0;
ddx1d=0;

x=u(2:1:3);
dx=u(4:1:5);
if t==0
    e0=x(1);
    de0=x(2);
    dde0=dx(2);
end

C=[5,1];

e=x(1)-x1d;
de=x(2)-dx1d;
dde=dx(2)-ddx1d;

if t<=T
   A0=-10/T^3*e0-6/T^2*de0-1.5/T*dde0;
   A1=15/T^4*e0+8/T^3*de0+1.5/T^2*dde0;
   A2=-6/T^5*e0-3/T^4*de0-0.5/T^3*dde0;
   p=e0+de0*t+1/2*dde0*t^2+A0*t^3+A1*t^4+A2*t^5;
   dp=de0+dde0*t+A0*3*t^2+A1*4*t^3+A2*5*t^4;
   ddp=dde0+A0*3*2*t+A1*4*3*t^2+A2*5*4*t^3;
else
    p=0;dp=0;ddp=0;
end

rou=(C(1)*e+C(2)*de)-(C(1)*p+C(2)*dp);

delta0=0.03;
delta1=1.5;
delta=delta0+delta1*norm(e);
mrou=norm(rou)+delta;

K=10;
D=1;
ut=-1/b*(-ddx1d-ddp+inv(C(2))*C(1)*(de-dp))-1/b*rou/mrou*(D+K);

sys(1)=ut;
sys(2)=e;