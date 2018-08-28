close all;

figure(1);
plot(t,r(:,1),'r',t,x(:,1),'b');
xlabel('time(s)');ylabel('Position tracking');

figure(2);
plot(t,r1(:,1),'r',t,x1(:,1),'b');
xlabel('time(s)');ylabel('Position tracking');
