function [sys,x0,str,ts] = SP_pitch_plant(t,x,u,flag)

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
sizes.NumOutputs     = 2;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [0.3,0];
str = [];
ts  = [0 0];

function sys=mdlDerivatives(t,x,u)

Jay=0.0168;

% if t<3
%     sys(1)=x(2);
%     sys(2)=1/Jay*u(1)+0.5*sin(pi*t/3);
% else
%     sys(1)=x(2);
%     sys(2)=1/Jay*u(1)+15*sin(5*pi*t);
% end
sys(1)=x(2);
sys(2)=1/Jay*u(1);

function sys=mdlOutputs(t,x,u)

sys(1)=x(1);
sys(2)=x(2);