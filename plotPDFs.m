
clear all
close all
clc

steps = 0.01;
points = 0:steps:4;

[erlang1, my1] = computePDFs(6,5,points);
[erlang2, my2] = computePDFs(12,6,points);

h = figure;
p = plot(points, erlang1, 'b',...
    points, my1, 'm-.',...
    points, erlang2, 'g',...
    points, my2, 'r-.');

xlabel('x','fontsize',20);
ylabel('PDF','fontsize',20);

legend('L=6, n=5 -- Erlang',...
    'L=6, n=5 -- Hypoexp',...
    'L=12, n=6 -- Erlang',...
    'L=12, n=6 -- Hypoexp');

set(p,'LineWidth',4);
set(gca,'fontsize',20)
grid on;
print(h,'-depsc2','erlangComparison.eps');
