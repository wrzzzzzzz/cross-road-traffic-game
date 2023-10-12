function crossroad(w)
plot([0,3],[3,3],'LineWidth',2,'Color','k');hold on;
plot([3,3],[3,0],'LineWidth',2,'Color','k');
plot([3+w,3+w],[0,3],'LineWidth',2,'Color','k');
plot([3+w,6+w],[3,3],'LineWidth',2,'Color','k');
plot([6+w,3+w],[3+w,3+w],'LineWidth',2,'Color','k');
plot([3+w,3+w],[3+w,6+w],'LineWidth',2,'Color','k');
plot([3,3],[6+w,3+w],'LineWidth',2,'Color','k');
plot([3,0],[3+w,3+w],'LineWidth',2,'Color','k');
plot([0,3],[3+w/2,3+w/2],'--','LineWidth',0.5,'Color','k');
plot([3+w/2,3+w/2],[6+w,3+w],'--','LineWidth',0.5,'Color','k');
plot([6+w,3+w],[3+w/2,3+w/2],'--','LineWidth',0.5,'Color','k');
plot([3+w/2,3+w/2],[0,3],'--','LineWidth',0.5,'Color','k');
end