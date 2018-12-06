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
%!!!!!!!!!!!!!SET MANUAL SWITCH TO "STEP!!!!!!!

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
%!!!!!!!!!!!!!SET MANUAL SWITCH TO "STEP!!!!!!!

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
%!!!!!!!!!!!!!SET MANUAL SWITCH TO "STEP!!!!!!!

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

figure(4);
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
%%
%!!!!!!!!!!!!!SET MANUAL SWITCH TO "STEP!!!!!!!

%Control WPC=0 3->0

%Control 3->0 at 5 
ts=5;
s1=3;
s2=0;


%Model Parameters
R=2;
C=1;
K=1/(R*C);
WPC=0;

figure(5);
sim('model');
plot(tout,x);
xlabel("time");
ylabel("voltage");
title("RC + U=f(t) (Empty Cap)");
grid on;
hold on;
plot(tout,ste);
legend("State","(Control/SOURCE)=3-->0");
%Model shows circuit with current source that changes at time=5 
%Capasitor is empty, 
%Voltage at capcitor will will get closer to source voltage during time
%but after power source cut off,at 5. Cap volatge will drop dwon to 0 
%%
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%!!!!!!!!!!!!!SET MANUAL SWITCH TO "SIN WAVE"!!!!!!
%--------------------------------------------------------------------

%Sin as Controll

%Control
A=1;
T=0.1;
f=1/T;

%Model Parameters
R=0.5;
C=0.3;
K=1/(R*C);
WPC=3;

figure(6);
sim('model');
plot(tout,x);
xlabel("time");
ylabel("voltage");
title("RC + U=Sin(t)");
grid on;
hold on;
plot(tout,ste);
legend("State","(Control/SOURCE)=Sin(t)");

%Volatage on Cap will close to mean of source voltage and try to follow
%voltage chnges in time


