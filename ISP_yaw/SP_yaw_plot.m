close all;

figure(1);
plot(t,r(:,1),'r',t,x(:,1),'b');
xlabel('time(s)');ylabel('Position tracking');
grid

figure(2);
plot(t,u(:,1),'r');
xlabel('time(s)');ylabel('control 1');
grid

figure(3);
plot(t,u(:,2),'r');
xlabel('time(sec)');ylabel('error');
grid