function [sys,x0,str,ts] = pitch_s_FTC(t,x,u,flag)

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
sizes.NumInputs      = 3;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [0 0];

function sys=mdlOutputs(t,x,u)

Jay=0.0168;
k1=4.2;k2=3.8;
alpha1=1/3;
alpha2=2*alpha1/(1+alpha1);

theta_d=u(1);
dtheta_d=0;
x=u(2:1:3);
e=theta_d-x(1);
de=dtheta_d-x(2);

ut=k1*sign(e)*(abs(e))^alpha1+k2*sign(de)*(abs(de))^alpha2;
Ty=Jay*ut;

sys(1)=ut;
sys(2)=Ty;