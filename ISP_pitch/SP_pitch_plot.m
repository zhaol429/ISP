close all;

figure(1);
% plot(t,x1(:,1),'r-',t,y1(:,1),'b-.','linewidth',2);
% set(gca,'fontsize',18,'FontName','Times New Roman');
% set(gca,'linewidth',2);
% set(gca,'xtickmode','manual','ytickmode','manual','ztickmode','manual');
% xlabel('time(sec)','fontsize',20);ylabel('Output angle \alpha (rad)','fontsize',20);
% legend('TSM','PID');


subplot(2,1,1);
plot(t,x1(:,1),'r-','linewidth',2);
xlabel('(a)  time(sec)','fontsize',10);ylabel('\alpha /rad','fontsize',10);
legend('FTR');

subplot(2,1,2);
plot(t,y1(:,1),'b-','linewidth',2);
xlabel('(b)  time(sec)','fontsize',10);ylabel('\alpha /rad','fontsize',10);
legend('PID');

figure(2);
% plot(t,u1(:,1),'r-',t,e1(:,1),'b-.','linewidth',2);
% set(gca,'fontsize',18,'FontName','Times New Roman');
% set(gca,'linewidth',2);
% set(gca,'xtickmode','manual','ytickmode','manual','ztickmode','manual');
% xlabel('time(sec)','fontsize',20);ylabel('Control input','fontsize',20);
% legend('TSM','PID');
% grid

subplot(2,1,1);
plot(t,u1(:,1),'r-','linewidth',2);
xlabel('(a)  time(sec)','fontsize',10);ylabel('Control input /({N \cdot m})','fontsize',10);
legend('FTR');
subplot(2,1,2);
plot(t,e1(:,1),'b-','linewidth',2);
xlabel('(b)  time(sec)','fontsize',10);ylabel('Control input /({N \cdot m})','fontsize',10);
legend('PID');

% figure(3);
% plot(t,u1(:,2),'r-',t,err(:,1),'b-','linewidth',2);
