%
%  Script file for transonic airfoil design exercise
%
%g
global Xupper CPupper Xlower CPlower em cl cdv CPuold CPlold Xuold ...
    Xlold

airload Autorun.BRF

mach=str2num(em);
% Begin by calculating Cp*
cpstar = 2/1.4/mach/mach*(((2+0.4*mach*mach)/2.4)^3.5-1);

hold off
p1 = plot(Xuold,CPuold,'g','LineWidth',2);
hold on
plot(Xlold,CPlold,'g','LineWidth',2);
hold on;
p2 = plot(Xupper,CPupper,'r', 'LineWidth',2);
hold on
plot(Xlower,CPlower,'r','LineWidth',2);
hold on
p3 = plot(Xuold2, CPuold2,'c','LineWidth',2);
hold on
plot(Xlold2, CPlold2, 'c','LineWidth',2);
xlabel('x/c');
ylabel('-Cp');
axis([0,1,-2,1]);
set (gca,'Ydir','reverse');
axis(axis);
grid on;
p4 = plot([0,1],[cpstar,cpstar],'b');
legend([p3, p1, p2, p4], ['\alpha = 1.00',char(176)],['\alpha = 1.70',char(176)],['\alpha = 2.35',char(176)],'Cp*')
% legend([p2,p3,p4], 'Suction surface','Pressure surface','Cp*')
set(gcf,'Position',[0 0 900 700])
set(findall(gcf,'-property','FontSize'),'FontSize',16)
% legend([p3, p1, p2, p4], 'M = 0.71','M = 0.73','M = 0.75','Cp*')
% % 
% Xuold=Xupper;
% Xlold=Xlower;
% CPuold=CPupper;
% CPlold=CPlower;

% Xuold2=Xupper;
% Xlold2=Xlower;
% CPuold2=CPupper;
% CPlold2=CPlower;


