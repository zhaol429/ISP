close all;

figure(1);
% plot(t,x2(:,1),'r-',t,y2(:,1),'b-.','linewidth',2);
% set(gca,'fontsize',18,'FontName','Times New Roman');
% set(gca,'linewidth',2);
% set(gca,'xtickmode','manual','ytickmode','manual','ztickmode','manual');
% xlabel('time(sec)','fontsize',20);ylabel('Output angle \beta (rad)','fontsize',20);
% legend('TSM','PID');

subplot(2,1,1);
plot(t,x2(:,1),'r-','linewidth',2);
xlabel('(a)  time(sec)','fontsize',10);ylabel('\beta /rad','fontsize',10);
legend('FTR');

subplot(2,1,2);
plot(t,y2(:,1),'b-','linewidth',2);
xlabel('(b)  time(sec)','fontsize',10);ylabel('\beta /rad','fontsize',10);
legend('PID');

figure(2);
% plot(t,u2(:,1),'r-',t,e2(:,1),'b-.','linewidth',2);
% set(gca,'fontsize',18,'FontName','Times New Roman');
% set(gca,'linewidth',2);
% set(gca,'xtickmode','manual','ytickmode','manual','ztickmode','manual');
% xlabel('time(sec)','fontsize',20);ylabel('Control input','fontsize',20);
% legend('TSM','PID');

subplot(2,1,1);
plot(t,u2(:,1),'r-','linewidth',2);
xlabel('(a)  time(sec)','fontsize',10);ylabel('Control input /({N \cdot m})','fontsize',10);
legend('FTR');

subplot(2,1,2);
plot(t,e2(:,1),'b-','linewidth',2);
xlabel('(b)  time(sec)','fontsize',10);ylabel('Control input /({N \cdot m})','fontsize',10);
legend('PID');

% figure(3);
% plot(t,u2(:,2));
% grid
