test=dlmread("run.dat"," ",2,0);
xu=test(1:65,1);
xl=test(66:130,1);
yu=test(1:65,3);
yl=test(66:130,3);
%Now you have all necessary variable you can plot the shape:
% plotting upper surface
plot(xu,yu, 'LineWidth' ,2) 
hold on
% plotting lower surface
plot(xl,yl,'LineWidth',2)
% setting the axis to be of equal range
axis([0 1 -.2 .2])
set(gcf,'Position',[100 100 500 200])
% making sure the axis are of equal length and invisible
xlabel("x/c")
ylabel("y/c")

