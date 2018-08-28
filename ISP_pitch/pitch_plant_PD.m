function [sys,x0,str,ts] = pitch_plant_PD(t,x,u,flag)

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
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [-1,0];
str = [];
ts  = [0 0];

function sys=mdlDerivatives(t,x,u)

% if t<10
%     sys(1)=x(2);
%     sys(2)=u(1);
% else
%     sys(1)=x(2);
%     sys(2)=u(1)+0.2*sin(2*t);
% end
    sys(1)=x(2);
    sys(2)=u(1)+0.2*sin(2*t);

function sys=mdlOutputs(t,x,u)

sys(1)=x(1);
sys(2)=x(2);
% sys(3)=Ty;