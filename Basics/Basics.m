clc;
close all;
clear;

%Set up


%Itegrator
WPC=4;

%Calculate K
R=10;
C=0.1;
K=1/(R*C);


%Step
s1=0;
s2=1;
ts=4;

%Sinwave
A=1;
f=10;
%%
%Verify if model runns 
figure(1);
sim("model");
plot(tout,x);
title("Test plot");
%%
%Autonomic system

%If step=0 all the time, there is no external influeance in the system
s1=0;
s2=0;


%Model Parameters
R=1;
C=1;
K=1/(R*C);
WPC=5;

figure(2);
sim('model');
plot(tout,x);
xlabel("time");
ylabel("voltage");
title("RC circuit");
grid on;
hold on;
plot(tout,ste);
legend("State","Control");

%Model discribes voltage change on capacitor in RC circuit,
% with starting V=WPC Cap capcity=C and resitor R

%%
%WPC=0

%Control=const
ts=0;
s1=5;
s2=5;


%Model Parameters
R=1;
C=1;
K=1/(R*C);
WPC=0;

figure(3);
sim('model');
plot(tout,x);
xlabel("time");
ylabel("voltage");
title("RC + U=(CONST VOLATAGE SOURCE)  (Empty Cap)");
grid on;
hold on;
plot(tout,ste);
legend("State","Control/SOURCE");
%Model shows circuit with constant current source 
%Capasitor charges up asymptoticly, 
%Voltage at capacitor will equal source voltage in 'infinite time'

%%
%Diffrent WPC with const controll

%Control=const=1
ts=0;
s1=1;
s2=1;


%Model Parameters
R=1;
C=1;
K=1/(R*C);
WPC=2;

figure(3);
sim('model');
plot(tout,x);
xlabel("time");
ylabel("voltage");
title("RC + U=1 (Partially charged Cap)");
grid on;
hold on;
plot(tout,ste);
legend("State","(Control/SOURCE)=1");
%Model shows circuit with constant current source 
%Capasitor is charged to WPC, 
%Voltage at capcitor will will get closer to source voltage during time
%Voltage at capacitor will equal source voltage in 'infinite time'

