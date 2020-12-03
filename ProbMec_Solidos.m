clearvars; clc; close all

%% Dados do problema
E=210*10^9; %modulo de young [Pa]
l=0.75; %comprimento da viga [m]
b=0.02; %largura [m]
h=0.015; %altura [m]
I=b*h^3/12; %momento de area de 2a ordem [m^4]
P1=-20; %carga pontual aplicada [N]

%% Variável independente
x=0:0.01:l;
y=-h/2:0.001:h/2;

%% 
v=-P1/(E*I)*(x.^3/6-l*x.^2/2);
subplot(2,4,[1,2,5,6]);
plot(x,v);
hold on;
plot(x,2*v);
grid on;
legend(['P1=' num2str(P1), 'N'], '2*v');

%%
M=-P1*(x-l);
Q=-P1*ones(size(x));
subplot(2,4,3);
area(x,M,'FaceColor', 'red');

subplot(2,4,4);
area(x,Q, 'FaceColor', 'red');

%%
Mp=-P1*(l/2-l);
sigmap=-(Mp*y)/I/(10^6);
subplot(2,4,7);
quiver(zeros(size(y)),y*10^3,sigmap,zeros(size(y)),0);
hold on;
fill([zeros(size(y)),flip(sigmap)],[y*10^3,flip(y*10^3)],'k','Facealpha',0.1);


%%
[X,Y] =meshgrid(x,y)
M=-P1*(X-l);
sigma=-(M.*Y)/I;
figure
surf(X,Y,sigma*10^-6);
