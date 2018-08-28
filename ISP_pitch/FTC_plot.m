close all;

figure(1);
plot(t,x3(:,1),'r-',t,x4(:,1),'b-','linewidth',2);
legend('FTC','PD');
grid

figure(2);
plot(t,u3(:,2),'r-',t,u4(:,2),'b-','linewidth',2);
legend('FTC','PD');
grid