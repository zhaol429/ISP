close all;

figure(1);
plot(t,r(:,1),'r',t,x(:,1),'b',t,x1(:,1),'g');
xlabel('time(s)');ylabel('Position tracking');

